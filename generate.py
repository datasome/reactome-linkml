#!/usr/bin/env python

import yaml
import os
from re import sub, findall, search
from help import print_help
import copy
import sys

web_schema_diff_file_name = None
output_type = None
script_name = sys.argv[0]
if len(sys.argv) > 1:
    output_type = sys.argv[1]
    if output_type not in ["java", "graphql", "yaml", "mysql"]:
        print_help(script_name)
        sys.exit(1)
else:
    print_help(script_name)
    sys.exit(1)

if len(sys.argv) > 2:
    # If the second argument is provided, it is expected to be be the name of the linkml file that contains web schema-only content
    web_schema_diff_file_name = sys.argv[2]
    OUTPUT_DIR = "graph-core-classes"
    CURATOR = ""
else:
    # If no arguments are provided, curator schema-only java classes are generated into curator-graph-core-classes
    OUTPUT_DIR = "curator-graph-core-classes"
    CURATOR = "curator."

GETTER_ONLY_ANNOT_SUFFIX = "@getter"

VALUE_TO_JAVA_ENUM = {
    "INCOMING" : "Relationship.Direction",
    "OUTGOING" : "Relationship.Direction",
    "NOMANUALEDIT": "ReactomeConstraint.Constraint",
    "MANDATORY": "ReactomeConstraint.Constraint",
    "OPTIONAL": "ReactomeConstraint.Constraint",
    "REQUIRED": "ReactomeConstraint.Constraint"
}

OTHER_ANNOTATIONS = ['abstract', 'implements', 'set', 'sorted_set', 'getter_only',
                     'static', 'final', 'transient', 'constructor_parameter',
                     'include_fetch', 'include_default_setter', 'no_default_getter_setter',
                     'no_default_getter', 'no_list_getter_setter', 'no_list_setter',
                     'include_stoichiometry', 'no_default_constructor', 'protected', 'public']

# Indentation used in generated java classes
INDENT_0 = ""
INDENT_1 = INDENT_0 + "    "
INDENT_2 = INDENT_1 + "    "

CLASS_TO_PACKAGE_NAME = {
    "DatabaseObjectLike": "org.reactome.server.graph.{}domain.result".format(CURATOR),
    "GeneratedValue": "org.springframework.data.neo4j.core.schema",
    "Id": "org.springframework.data.neo4j.core.schema",
    "InvocationTargetException": "java.lang.reflect",
    "JsonGetter": "com.fasterxml.jackson.annotation",
    "JsonIdentityInfo": "com.fasterxml.jackson.annotation",
    "JsonIgnore": "com.fasterxml.jackson.annotation",
    "JsonProperty": "com.fasterxml.jackson.annotation",
    "ObjectIdGenerators": "com.fasterxml.jackson.annotation",
    "Method": "java.lang.reflect",
    "Node": "org.springframework.data.neo4j.core.schema",
    "NonNull": "org.springframework.lang",
    "ParameterizedType": "java.lang.reflect",
    "Property": "org.springframework.data.neo4j.core.schema",
    "ReactomeAllowedClasses": "org.reactome.server.graph.{}domain.annotations".format(CURATOR),
    "ReactomeConstraint": "org.reactome.server.graph.{}domain.annotations".format(CURATOR),
    "ReactomeInstanceDefiningValue": "org.reactome.server.graph.{}domain.annotations".format(CURATOR),
    "ReactomeProperty": "org.reactome.server.graph.{}domain.annotations".format(CURATOR),
    "ReactomeRelationship": "org.reactome.server.graph.{}domain.annotations".format(CURATOR),
    "ReactomeSchemaIgnore": "org.reactome.server.graph.{}domain.annotations".format(CURATOR),
    "ReactomeTransient": "org.reactome.server.graph.{}domain.annotations".format(CURATOR),
    "Relationship": "org.springframework.data.neo4j.core.schema",
    "RelationshipProperties" : "org.springframework.data.neo4j.core.schema",
    "Serializable": "java.io",
    "StoichiometryObject": "org.reactome.server.graph.service.helper",
    "TargetNode": "org.springframework.data.neo4j.core.schema"
}

# These java interfaces are not represented in yaml
JAVA_INTERFACES_IN_MODEL = ["Trackable", "Deletable"]

# Mapping of range to MySQL types
RANGE_TO_MYSQL_TYPE = {
    "string" : "mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci",
    "integer" : "int unsigned",
    "AnnotationLongType" : "int unsigned",
    "boolean" : "enum('TRUE','FALSE') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci"
}

# Bespoke class-attribute to MySQL type mappings
# TODO: N.B. gk_current.sql contains table: Ontology and DataModel, but they're not shown on
# https://curator.reactome.org/cgi-bin/classbrowser?DB=gk_central&CLASS=AbstractModifiedResidue
CLAZZ_TO_ATTRIBUTE_TO_MYSQL_TYPE = {
    "InstanceEdit" : { "dateTime" : "timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" },
    "PathwayDiagram" : { "storedATXML" : "longblob" },
    "Ontology" : { "ontology" : "longblob" },
    "Person" : {
        "initial" : "varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL",
        "surname" : "varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL"
    },
    "LiteratureReference" : {"journal" : "varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci"}
}

def remove_curator_only_annotations(classes: dict, slots: dict) -> (dict, dict):
    """Remove all constraint and category annotations as they are not used in web schema"""
    for slot in slots:
        slot_entry = slots[slot]
        if 'annotations' in slot_entry:
            for key in ['category', 'constraint']:
                if key in slot_entry['annotations']:
                    slot_entry['annotations'].pop(key)
    for clazz in classes:
        class_entry = classes[clazz]
        if is_annotation(clazz):
            continue
        if 'attributes' in class_entry:
            for attr in class_entry['attributes']:
                attr_entry = class_entry['attributes'][attr]
                if attr_entry and 'annotations' in attr_entry:
                    for key in ['category', 'constraint']:
                        if key in attr_entry['annotations']:
                            attr_entry['annotations'].pop(key)
        if 'slot_usage' in class_entry:
            for slot in class_entry['slot_usage']:
                slot_entry = class_entry['slot_usage'][slot]
                if slot_entry and 'annotations' in slot_entry:
                    for key in ['category', 'constraint']:
                        if key in slot_entry['annotations']:
                            slot_entry['annotations'].pop(key)
    return classes, slots

def effect_any_class_renaming(clazz: str, diff_classes: dict, clazz2web_clazz: dict) -> (dict, dict):
    """Deal with classes that were renamed in web schema compared to curator schema"""
    diff_class_annotations = {}
    diff_class_entry = diff_classes[clazz]
    if 'annotations' in diff_class_entry:
        diff_class_annotations = diff_class_entry['annotations']
        if 'renamed_to' in diff_class_annotations:
            web_clazz = diff_class_annotations['renamed_to']
            clazz2web_clazz[clazz] = web_clazz
            # For renamed classes, the content of clazz in curator schema will be updated with the web schema-only
            # content of web_clazz. Once classes have been iterated over, classes[clazz] will be moved to classes[web_clazz]
            diff_class_entry = diff_classes[web_clazz]
            diff_class_annotations = {}
            if 'annotations' in diff_class_entry:
                diff_class_annotations = diff_class_entry['annotations']
    return diff_class_entry, diff_class_annotations

def override_class_attributes(class_attributes: dict, diff_class_attributes: dict):
    """ Iterate through class attributes, removing any curator schema-only annotations
        and overriding any annotations and keys if present in that attribute's entry in
        diff_class_attributes
    """
    for attr in class_attributes:
        if attr in diff_class_attributes:
            if 'annotations' in diff_class_attributes[attr]:
                diff_class_attr_annots = diff_class_attributes[attr]['annotations']
                if 'removed_annotations' in diff_class_attr_annots:
                    for annot in diff_class_attr_annots['removed_annotations'].split(","):
                        class_attributes[attr]['annotations'].pop(annot.strip())
                for annot in diff_class_attr_annots:
                    if annot != 'removed_annotations':
                        if 'annotations' not in class_attributes[attr]:
                            class_attributes[attr]['annotations'] = {}
                        class_attributes[attr]['annotations'][annot] = diff_class_attr_annots[annot]
            for key in diff_class_attributes[attr]:
                if key != 'annotations':
                    class_attributes[attr][key] = diff_class_attributes[attr][key]
    for attr in diff_class_attributes:
        # Add any web schema-only attributes to class_attributes
        if attr not in class_attributes:
            class_attributes[attr] = diff_class_attributes[attr]

def override_class_slots(class_entry: dict, diff_class_slots: dict, diff_class_slot_usage: dict):
    """ Iterate through class slots, removing any curator schema-only annotations from class_usage
        and overriding any annotations and keys if present in that attribute's class_usage in
        diff_class_slots
    """
    if 'slots' in class_entry:
        class_slots = class_entry['slots']
        for slot in class_slots:
            if slot in diff_class_slots:
                if slot in diff_class_slot_usage:
                    if 'annotations' in diff_class_slot_usage[slot]:
                        diff_class_slot_usage_annots = diff_class_slot_usage[slot]['annotations']
                        if 'removed_annotations' in diff_class_slot_usage_annots:
                            for annot in diff_class_slot_usage_annots['removed_annotations'].split(","):
                                class_slots['slot_usage'][slot]['annotations'].pop(annot.strip())
                        for annot in diff_class_slot_usage_annots:
                            if annot != 'removed_annotations':
                                class_slots['slot_usage'][slot]['annotations'][annot] = \
                                    diff_class_slot_usage_annots[annot]
                    for key in diff_class_slots['slot_usage'][slot]:
                        if key != 'annotations':
                            class_slots['slot_usage'][slot][key] = diff_class_slot_usage[slot][key]
    for slot in diff_class_slots:
        # Add any web schema-only slots to class_slots
        if 'slots' not in class_entry:
            class_entry['slots'] = []
        if slot not in class_slots:
            class_slots.append(slot)
    for slot in diff_class_slot_usage:
        # Add any web schema-only slot usage to class_slot_usage
        if 'slot_usage' not in class_entry:
            class_entry['slot_usage'] = {}
        class_entry['slot_usage'][slot] = diff_class_slot_usage[slot]

def override_schema_slots(diff_slots: dict, slots: dict):
    """ Iterate through schema slots, removing any curator schema-only annotations
        and overriding any annotations and keys if present in the corresponding slot's entry in diff_slots
    """
    for slot in diff_slots:
        if slot not in slots:
            # Add any web schema-only slots to slots dict
            slots[slot] = diff_slots[slot]
        else:
            if 'annotations' in diff_slots[slot]:
                diff_slot_annots = diff_slots[slot]['annotations']
                if 'removed_annotations' in diff_slot_annots:
                    for annot in diff_slot_annots['removed_annotations'].split(","):
                        slots[slot]['annotations'].pop(annot.strip())
                for annot in diff_slot_annots:
                    if annot != 'removed_annotations':
                        if 'annotations' not in slots[slot]:
                            slots[slot]['annotations'] = {}
                        slots[slot]['annotations'][annot] = diff_slot_annots[annot]
            for key in diff_slots[slot]:
                # Add any web schema-only keys in diff_slots[slot] to slots[slot]
                if key != 'annotations':
                    slots[slot][key] = diff_slots[slot][key]

def get_web_yaml(web_schema_diff_file_name: str, schema_data: dict):
    with open(web_schema_diff_file_name, "r") as stream:
        try:
            # schema_data contains curator schema
            classes = schema_data['classes']
            slots = schema_data['slots']
            # Remove curator schema-only annotations from all class attributes and slots
            classes, slots = remove_curator_only_annotations(classes, slots)

            # diff_data contains web-only content
            diff_data = yaml.safe_load(stream)
            diff_classes = diff_data['classes']
            diff_slots = diff_data['slots']

            # clazzes_for_removal will contain names of classes in curator schema that should be removed from the web schema
            clazzes_for_removal = []
            # For the classes that have been renamed in web schema (e.g. ReactionlikeEvent => ReactionLikeEvent)
            clazz2web_clazz = {}

            # By the end of the loop below classes and slots should contain the correct content of the web schema
            for clazz in classes:
                class_entry = classes[clazz]
                if clazz in diff_classes:
                    # Deal with classes that were renamed in web schema compared to curator schema
                    diff_class_entry, diff_class_annotations = \
                        effect_any_class_renaming(clazz, diff_classes, clazz2web_clazz)
                    # Collect all relevant portions of class_entry and diff_class_entry
                    diff_class_attributes, diff_class_slot_usage = {}, {}
                    diff_class_slots = []
                    if 'annotations' in class_entry:
                        class_annotations = class_entry['annotations']
                    if 'attributes' in diff_class_entry:
                        diff_class_attributes = diff_class_entry['attributes']
                        if 'attributes' not in class_entry:
                            class_entry['attributes'] = {}
                    if 'attributes' in class_entry:
                        class_attributes = class_entry['attributes']
                    if 'slots' in diff_class_entry:
                        diff_class_slots = diff_class_entry['slots']
                        if 'slots' not in class_entry:
                            class_entry['slots'] = []
                    if 'slots' in class_entry:
                        class_slots = class_entry['slots']
                    if 'slot_usage' in diff_class_entry:
                        diff_class_slot_usage = diff_class_entry['slot_usage']
                        if 'slot_usage' not in class_entry:
                            class_entry['slot_usage'] = {}
                    if 'slot_usage' in class_entry:
                        class_slot_usage = class_entry['slot_usage']

                    # Tag clazz for removal from classes after the main loop has finished
                    if 'removed_class' in diff_class_annotations:
                        clazzes_for_removal.append(clazz)

                    # Remove any curator schema-only annotations
                    if 'removed_annotations' in diff_class_annotations:
                        for annot in diff_class_annotations['removed_annotations'].split(","):
                            class_annotations.pop(annot.strip())

                    # Remove any curator schema-only attributes
                    if 'removed_attributes' in diff_class_annotations:
                        for attr in diff_class_annotations['removed_attributes'].split(","):
                            class_attributes.pop(attr.strip())

                    # Remove any curator schema-only slots and associated slot_usage
                    if 'removed_slots' in diff_class_annotations:
                        for slot in diff_class_annotations['removed_slots'].split(","):
                            slot = slot.strip()
                            class_slots.remove(slot)
                            if slot in class_slot_usage:
                                class_slot_usage.pop(slot)

                    # Override is_a in class_entry if present in diff_class_entry
                    if 'is_a' in diff_class_entry:
                        class_entry['is_a'] = diff_class_entry['is_a']

                    # Add/override any 'non-removed' annotations from diff_class_annotations to class_entry['annotations']
                    if 'annotations' not in class_entry:
                        class_entry['annotations'] = {}
                    for key in diff_class_annotations:
                        if not key.startswith("removed_"):
                            class_entry['annotations'][key] = diff_class_annotations[key]

                    # Override 'description' in class_entry from diff_class_entry
                    if 'description' in diff_class_entry:
                        class_entry['description'] = diff_class_entry['description']

                    # Iterate through class attributes, removing any curator schema-only annotations
                    # and overriding any annotations and keys if present in that attribute's entry in
                    # diff_class_attributes
                    override_class_attributes(class_attributes, diff_class_attributes)

                    # Iterate through class slots, removing any curator schema-only annotations from class_usage
                    # and overriding any annotations and keys if present in that attribute's class_usage in
                    # diff_class_slots
                    override_class_slots(class_entry, diff_class_slots, diff_class_slot_usage)

            # Add to classes web schema-only classes
            for clazz in diff_classes:
                if clazz not in classes:
                    classes[clazz] = diff_classes[clazz]

            # Remove from classes all curator schema-only class entries
            for clazz in clazzes_for_removal:
                classes.pop(clazz)

            # Rename any classes, according to clazz2web_clazz[clazz]
            for clazz in clazz2web_clazz:
                web_clazz =  clazz2web_clazz[clazz]
                classes[web_clazz] = copy.deepcopy(classes[clazz])
                classes.pop(clazz)

            # Iterate through schema slots, removing any curator schema-only annotations
            # and overriding any annotations and keys if present in the corresponding slot's entry in diff_slots
            override_schema_slots(diff_slots, slots)

        except yaml.YAMLError as exc:
            print(exc)
            return None
    return schema_data

def is_class_relationship(class_entry: dict) -> bool:
    """ Return true if class_entry represents a relationship properties class """
    if 'annotations' in class_entry:
        class_annotations = class_entry['annotations']
        if 'relationship_properties' in class_annotations and class_annotations['relationship_properties'] is True:
            return True
    return False

def get_package_suffix(class_entry: dict) -> str:
    """ Return package suffix for class represented by class_entry"""
    if is_class_relationship(class_entry):
        pkg_suffix = "relationship"
    else:
        pkg_suffix = "model"
    return pkg_suffix

def get_package(class_entry: dict) -> str:
    """ Return java package for class represented by class_entry """
    pkg_suffix = get_package_suffix(class_entry)
    return "org.reactome.server.graph.{}domain.{}".format(CURATOR, pkg_suffix)


def get_keywords(class_annotations: dict, keywords: list) -> str:
    """ Return a string of keywords in the order they appear in keywords list, provided they appear in class_annotations """
    ret = " "
    for keyword in keywords:
        if keyword in class_annotations and class_annotations[keyword] is True:
            ret += '{} '.format(keyword)
    return ret


def get_extends(class_entry: dict) -> str:
    """ Get java extends clause for class_entry"""
    ret = ""
    if 'is_a' in class_entry:
        ret = ' extends {}'.format(class_entry['is_a'])
    return ret


def get_implements(clazz: str, classes: dict, class_annotations: dict, annotations_imports: set) -> (str, set):
    """Return implements clause for class clazz and annotations_imports, with any new import statements added
        for classes inside the implements clause """
    ret = ""
    if 'implements' in class_annotations:
        implements_clause = class_annotations['implements']
        ret = ' implements {}'.format(implements_clause)

        # Add import statements for classes inside implements clause
        for entry in implements_clause.replace(" ", "").split(","):

            # First remove any java generics in order to find out the implemented class
            clazzes = findall(r'\<(.*)\>', entry)
            if clazzes:
                implemented_clazz = clazzes[0]
            else:
                implemented_clazz = entry

            if implemented_clazz in CLASS_TO_PACKAGE_NAME:
                annotations_imports.add('import {}.{};'
                                        .format(CLASS_TO_PACKAGE_NAME[implemented_clazz], implemented_clazz))
            elif implemented_clazz not in JAVA_INTERFACES_IN_MODEL:
                clazz_package = get_package(classes[clazz])
                implemented_clazz_package = get_package(classes[implemented_clazz])
                if clazz_package != implemented_clazz_package:
                    # If the package of the class within Implements clause is not the same as that of clazz,
                    # add an import statement for the implemented clazz
                    annotations_imports.add(
                        'import {}.{};'.format(implemented_clazz_package, implemented_clazz))
    return ret, annotations_imports


def add_collection_if_applicable(java_type: str, attr_entry: dict,
                                     attr_annotations: dict, annotations_imports: set) -> (str, set):
    """ Add import java.util.* import to annotations_imports; wrap java_type in Java collection generics if
        add entry multivalued """
    ret_java_type = java_type
    if 'multivalued' in attr_entry and attr_entry['multivalued'] is True:
        annotations_imports.add('import java.util.*;')
        for collection_type in ['set', 'sorted_set']:
            if collection_type in attr_annotations and attr_annotations[collection_type]:
                ret_java_type = "{}<{}>".format(capitalize(collection_type), java_type)
                break
        if ret_java_type == java_type:
            # No set/sorted_set annotation was found => we default to collection type: List
            ret_java_type = "{}<{}>".format("List", java_type)
    return ret_java_type, annotations_imports


def capitalize(attr: str) -> str:
    """ Capitalize linkml annotation or attr, removing any underscores, e.g.
        reactome_schema_ignore => ReactomeSchemaIgnore and dbId => DbId
        """
    if not attr.startswith("_") and not attr[0].isupper():
        # Example of attr.startswith("_"): _DeletedInstance
        if "_" in attr and "DB_ID" not in attr:
            return sub(r"_+", " ", attr).title().replace(" ", "")
        else:
            # Example of "DB_ID" in attr: deletedInstanceDB_ID
            attr = attr[0].upper() + attr[1:]
    return attr

def lower_case(attr: str) -> str:
    """ Lower-case attr """
    return attr[0].lower() + attr[1:]


def map_annotation_attributes_to_classes(annotations: dict, classes: dict) -> dict:
    """ Return map of attributes in annotations to their corresponding classes """
    annot_attr2class = {}
    for annotation in annotations:
        if annotations[annotation] is not None:
            # N.B. annotations[annotation] is None means its range is str (hence doesn't go into annot_attr2class)
            range = annotations[annotation]['range']
            if range[0].isupper():
                # The first letter is upper case - it must be a class name
                if classes[range] is not None and 'attributes' in classes[range]:
                    for annot_attr in classes[range]['attributes']:
                        # e.g. for annotation = json_identity_info and range = JsonIdentityInfo:
                        # classes[range]['attributes'] = ['generator','property']
                        annot_attr2class[annot_attr] = range
                else:
                    # E.g. property1 => @Property - this mapping is needed because of the overlap
                    # with property attribute of JsonIdentityInfo
                    annot_attr2class[annotation] = range
    return annot_attr2class


def get_annotation_imports(annotations: dict, annot_attr2class: dict) -> set:
    """ Return annotation import statements for each annotation in annotations """
    annotations_imports = set([])
    for annot_attr in annotations:
        value = annotations[annot_attr]
        if value is None:
            continue
        if annot_attr in annot_attr2class:
            annot_class = annot_attr2class[annot_attr]
            annotations_imports.add('import {}.{};'.format(CLASS_TO_PACKAGE_NAME[annot_class], annot_class))
        else:
            if annot_attr not in OTHER_ANNOTATIONS:
                # annotations in OTHER_ANNOTATIONS are java code-specific instructions and don't need a class import
                if annot_attr.endswith(GETTER_ONLY_ANNOT_SUFFIX):
                    # Some annotations are tagged for getters only via GETTER_ONLY_ANNOT_SUFFIX -
                    # we need to remove the suffix befor we can look up the associated class in  CLASS_TO_PACKAGE_NAME
                    annot_attr = sub(r"{}$".format(GETTER_ONLY_ANNOT_SUFFIX),"", annot_attr)
                annot_class = capitalize(annot_attr)
                if type(value) != bool or value is True:
                    if annot_class in CLASS_TO_PACKAGE_NAME:
                        annotations_imports.add(
                            'import {}.{};'.format(CLASS_TO_PACKAGE_NAME[annot_class], annot_class))
    return annotations_imports

def quote_value(value):
    """ Return quoted value if it doesn't start with "{" (e.g. the value for suppress_warnings in ChemicalDrug);
        otherwise return value as is.
    """
    if not search(r"{.*}", value):
        return "\"{}\"".format(value)
    return value


def format_value_for_java_annotation(value, annotations_imports: set) -> (str, set):
    """ Return a tuple:
        - value formatted for inclusion in java annotation;
        - annotations_imports, with any new class imports added
    """
    if value:
        if type(value) == bool:
            # Convert Python boolean to Java boolean
            value = str(value).lower()
        elif value in VALUE_TO_JAVA_ENUM:
            # Append value to Java enum if applicable
            value = "{}.{}".format(VALUE_TO_JAVA_ENUM[value], value)
        elif value.endswith(".class"):
            # e.g. "ObjectIdGenerators.PropertyGenerator.class"
            value = value.split(".")[0]
            annotations_imports.add(
                'import {}.{};'.format(CLASS_TO_PACKAGE_NAME[value], value))
        else:
            value = quote_value(value)
    return value, annotations_imports


def get_annotations(annotations: dict, annot_attr2class: dict,
                    annotations_imports: set, indent: str) -> (list, dict, set):
    """ Based on (class/attr) annotations, return in the first element of return tuple:
        a list of java annotation statements.
        Any annotations you come across that exists in OTHER_ANNOTATIONS, return in the
        second element of return tuple: dict
        Return in the third element of return tuple, annotations_imports with any new imports added
    """

    """
    Some annotation classes (e.g. @Relationship) have multiple attributes that each are assigned a value
    within Java annotation (e.g. Regulation.java, authored attr:
    @Relationship(type = "authored", direction = Relationship.Direction.INCOMING)
    We need to store each such assignment clause for an annotation class within class_to_annotation_clauses[annot_class]
    """
    class_to_annotation_clauses = {}
    ret_java_annotations = []
    other_annotations = {}

    for annot_attr in annotations:
        if annotations[annot_attr] is None:
            # N.B. To 'switch off' annot_attr that is not in annot_attr2class, it has to have no value
            # (e.g. generated_value in DBInfo), whereas to 'switch off' annot_attr that is in annot_attr2class
            # (e.g. addedField in _Deleted class in attr: curatorComment) it needs to be assigned False.
            continue
        if annot_attr in annot_attr2class:
            annot_class = annot_attr2class[annot_attr]
            if annot_class not in class_to_annotation_clauses:
                class_to_annotation_clauses[annot_class] = []
            value, annotations_imports = \
                format_value_for_java_annotation(annotations[annot_attr], annotations_imports)
            if value:
                # Store value assignment clause for annot_class
                class_suffix = "_{}".format(annot_class)
                if annot_attr.endswith(class_suffix):
                    annot_attr = annot_attr.replace(class_suffix, "")
                class_to_annotation_clauses[annot_class].append("{} = {}".format(annot_attr, value))
        else:
            # annot_attr not in annot_attr2class
            if not annotations[annot_attr]:
                continue
            elif not annot_attr.endswith(GETTER_ONLY_ANNOT_SUFFIX):
                # Ignore getter-only annotations here - they are processed within get_class_attributes_slots() method
                if annot_attr not in OTHER_ANNOTATIONS:
                    # For all non-OTHER_ANNOTATIONS, add java annotation statement to ret_java_annotations
                    annot_class = capitalize(annot_attr)
                    value = annotations[annot_attr]
                    if value and not type(value) == bool:
                        value = quote_value(value)
                        # E.g. @SuppressWarnings("unused")
                        ret_java_annotations.append("{}@{}({})".format(indent, annot_class, value))
                    else:
                        # E.g. @Node
                        ret_java_annotations.append("{}@{}".format(indent, annot_class))
                else:
                    other_annotations[annot_attr] = annotations[annot_attr]

    # Output java annotations involving annotation classes
    # if attr == "modification":
    #     print(attr, value, class_to_annotation_clauses)
    for annot_class in class_to_annotation_clauses:
        if class_to_annotation_clauses[annot_class]:
            annot_clauses = "({})".format(", ".join(class_to_annotation_clauses[annot_class]))
        else:
            annot_clauses = ""
        # E.g. @Relationship(type = "edited", direction = Relationship.Direction.INCOMING)
        ret_java_annotations.append("{}@{}{}".format(indent, annot_class, annot_clauses))
    return ret_java_annotations, other_annotations, annotations_imports


def get_relationship_and_target_node_class(attr_entry: dict, schema_slots: dict, classes: dict) -> (str, str):
    """ If attr_entry corresponds represents a relationship class (RC) attribute, return a tuple containing RC
        and the class of the attribute annotated within RC as @TargetNode. For example, if attr_entry represents
        SortedSet<PublicationAuthor> author in Publication.java and in PublicationAuthor.java we have:
        @TargetNode private Person author;
        this function would return tuple: ('PublicationAuthor','Person')
        If no @TargetNode attribute is found within RC, return (None, None)
    """
    if attr_entry and 'range' in attr_entry:
        attr_range = attr_entry['range']
        if attr_range in classes and classes[attr_range]:
            relationship_class_entry = classes[attr_range]
            if 'annotations' in relationship_class_entry and \
                    'relationship_properties' in relationship_class_entry['annotations']:
                # If attr_entry corresponds has a range that is a relationship class

                # Accumulate attributes and slots of relationship_class_entry into attributes dict
                attributes = {}
                if 'attributes' in relationship_class_entry:
                    attributes |= relationship_class_entry['attributes']
                if 'slots' in relationship_class_entry:
                    for attr in relationship_class_entry['slots']:
                        attributes[attr] = schema_slots[attr]

                # Iterate through attributes and if 'target_node' annotation is found, return
                for attr in attributes:
                    relationship_class_attr_entry = attributes[attr]
                    if 'annotations' in relationship_class_attr_entry and \
                            'target_node' in relationship_class_attr_entry['annotations'] and \
                            relationship_class_attr_entry['annotations']['target_node']:
                        return attr_range, relationship_class_attr_entry['range']
    return None, None

def get_attr_slot_entries(class_entry: dict, schema_slots: dict) -> dict:
    """ Return all slots and attributes in class_entry as a single dict, with any slot_usage overrides applied
    """
    attrs = {}
    if 'attributes' in class_entry:
        attrs = class_entry['attributes']
    slots = {}
    if 'slots' in class_entry:
        for slot_name in class_entry['slots']:
            slots[slot_name] = copy.deepcopy(schema_slots[slot_name])
    if 'slot_usage' in class_entry:
        slot_usage = class_entry['slot_usage']
        for slot_name in slot_usage:
            # Override any attr's value from slots[slot_name] with the corresponding value in slot_usage
            for attr in slot_usage[slot_name]:
                if attr != "annotations":
                    slots[slot_name][attr] = slot_usage[slot_name][attr]
                else:
                    for annot_attr in slot_usage[slot_name]['annotations']:
                        slots[slot_name]['annotations'][annot_attr] = slot_usage[slot_name]['annotations'][annot_attr]
    attributes = attrs | slots
    return attributes

def get_java_type(attr_entry: dict, class_entry: dict, annotations_imports: set) -> (str, set):
    """ Return a tuple containing a Java type for attr_entry, and annotations_imports with any
        relevant import statements added
    """
    if 'range' in attr_entry:
        if attr_entry['range'] == "AnnotationLongType":
            java_type = "Long"
        elif attr_entry['range'] == "AnnotationBytesType":
            java_type = "byte[]"
        else:
            java_type = capitalize(attr_entry['range'])
            if java_type in classes:
                java_type_package = get_package(classes[java_type])
                clazz_package = get_package(class_entry)
                if clazz_package != java_type_package:
                    annotations_imports.add(
                        'import {}.{};'.format(java_type_package, java_type))
    else:
        java_type = "String"
    return java_type, annotations_imports


def add_getter(attr: str, attr_entry: dict, java_type: str, annot_lines: list, attr_slot_to_getter: dict):
    """ Add to attr_slot_to_getter[attr] a chunk of code containing java annotations and the getter method """
    if attr_entry is not None and 'annotations' in attr_entry:
        if 'deprecated' in attr_entry['annotations']:
            attr_slot_to_getter[attr].append(INDENT_1 + "@Deprecated")
        elif 'allowed' in attr_entry['annotations'] and attr_entry['annotations']['allowed']:
            for java_annot in annot_lines:
                if 'ReactomeAllowedClasses' in java_annot:
                    break
            if java_annot:
                attr_slot_to_getter[attr].append(java_annot)
        else:
            # Process any getter-only annotations (i.e. output just for getters, but not for the attributes
            # being 'got'
            for annot in attr_entry['annotations']:
                if annot.endswith(GETTER_ONLY_ANNOT_SUFFIX):
                    annot_attr = sub(r"{}$".format(GETTER_ONLY_ANNOT_SUFFIX), "", annot)
                    annot_class = capitalize(annot_attr)
                    for java_annot in annot_lines:
                        if annot_class in java_annot:
                            break
                    value = attr_entry['annotations'][annot]
                    if value and not type(value) == bool:
                        value = quote_value(value)
                        # E.g. @JsonGetter("RNAMarker")
                        attr_slot_to_getter[attr].append("{}@{}({})".format(INDENT_1, annot_class, value))
                    else:
                        attr_slot_to_getter[attr].append(INDENT_1 + "@" + annot_class)
    attr_slot_to_getter[attr] += [
        "{}public {} get{}() {{ return {}; }}".format(INDENT_1, java_type, capitalize(attr), attr),
        ""]


def add_setter(attr_entry: dict, attr: str, java_type: str, attr_slot_to_setter: str):
    """ Add to attr_slot_to_setter[attr] a chunk of code containing the setter method """
    setter_code = None
    if attr_entry is not None and 'annotations' in attr_entry:
        if 'deprecated' in attr_entry['annotations']:
            attr_slot_to_setter[attr].append(INDENT_1 + "@Deprecated")
        if 'allowed' in attr_entry['annotations'] and attr_entry['annotations']['allowed']:
            setter_code = \
                [get_filled_allowed_code_template(
                    attr, java_type, attr_entry['annotations']['allowed'], "SetWithAllowedClasses.java"), ""]
    if not setter_code:
        setter_code = \
            ["{}public void set{}({} {}) {{".format(INDENT_1, capitalize(attr), java_type, attr),
             "{}this.{} = {};".format(INDENT_2, attr, attr),
             INDENT_1 + "}", ""]
    attr_slot_to_setter[attr] += setter_code

def add_getter_setter_fetch_for_relationship_attribute(attr_entry: dict, attr: str,
                                                       attr_slot_to_getter: dict, attr_slot_to_setter: dict,
                                                       relationship_clazz: str, target_node_clazz: str,
                                                       dbid_variable_name: str,
                                                       other_annotations: dict,
                                                       annotations_imports: set):
    """ Output from code templates getter/setter/fetch methods for attr, as well as any getter-only java annotations """
    if 'include_fetch' in other_annotations:
        attr_slot_to_getter[attr] += \
            [get_filled_relationship_code_template(
                relationship_clazz, target_node_clazz, attr, "RelationshipFetch.java", dbid_variable_name),
                ""]
        annotations_imports.add(
            'import {}.{};'.format(CLASS_TO_PACKAGE_NAME["StoichiometryObject"], "StoichiometryObject"))
        annotations_imports.add(
            'import {}.{};'.format(CLASS_TO_PACKAGE_NAME["JsonIgnore"], "JsonIgnore"))
    if 'include_stoichiometry' in other_annotations:
        getter_template_file = "RelationshipGet.java"
        setter_template_file = "RelationshipSet.java"
    else:
        getter_template_file = "RelationshipGetNoStoichiometry.java"
        setter_template_file = "RelationshipSetNoStoichiometry.java"
    # Process any getter-only annotations
    for annot in attr_entry['annotations']:
        if annot.endswith(GETTER_ONLY_ANNOT_SUFFIX):
            annot_attr = sub(r"{}$".format(GETTER_ONLY_ANNOT_SUFFIX), "", annot)
            annot_class = capitalize(annot_attr)
            attr_slot_to_getter[attr].append(INDENT_1 + "@" + annot_class)

    if 'no_list_getter_setter' not in other_annotations:
        attr_slot_to_getter[attr] += \
            [get_filled_relationship_code_template(
                relationship_clazz, target_node_clazz, attr, getter_template_file, dbid_variable_name),
                ""]
        if 'no_list_setter' not in other_annotations:
            attr_slot_to_setter[attr] += \
                [get_filled_relationship_code_template(
                    relationship_clazz, target_node_clazz, attr, setter_template_file, dbid_variable_name),
                    ""]


def get_class_attributes_slots(clazz: str, class_entry: dict, schema_slots: dict, annot_attr2class: dict,
                               annotations_imports: set, classes: dict) -> (list, list, set):
    """ Return Java code chunks for all attributes/slots in class_entry, including all relevant
    getters/setters/fetch methods
    """

    # Auxiliary dicts
    attr_slot_to_lines = {}
    attr_slot_to_getter = {}
    attr_slot_to_setter = {}

    # Return lists
    attr_slot_lines = []
    getter_setter_lines = []

    # Retrieve all slots and attributes from class_entry
    attributes = get_attr_slot_entries(class_entry, schema_slots)

    for attr in attributes:
        other_annotations = {}
        attr_entry = attributes[attr]
        annot_lines = []
        if attr_entry is not None:
            java_type, annotations_imports = get_java_type(attr_entry, class_entry, annotations_imports)
            if 'annotations' in attr_entry:
                # Accumulate any Java annotations into attr_slot_to_lines[attr]
                annot_lines, other_annotations, annotations_imports = \
                    get_annotations(attr_entry['annotations'], annot_attr2class, annotations_imports, INDENT_1)
                attr_slot_to_lines[attr] = annot_lines
                annotations_imports.update(get_annotation_imports(attr_entry['annotations'], annot_attr2class))
                java_type, annotations_imports = \
                    add_collection_if_applicable(java_type, attr_entry, other_annotations, annotations_imports)
        else:
            # java_type = "String" is the default in linkml schema (hence no attr_entry needed for string attributes)
            java_type = "String"

        # Prepare data structures for storing code for attr
        value = ""
        if attr not in attr_slot_to_lines:
            attr_slot_to_lines[attr] = []
        attr_slot_to_getter[attr] = []
        attr_slot_to_setter[attr] = []

        if attr_entry is not None:
            # Retrieve value (if any) to be assigned to the attribute
            value = get_value(class_entry, attr, attr_entry)

        if 'getter_only' in other_annotations and other_annotations['getter_only']:
            # 'getter_only' means no variable - just a getter method returning a value (e.g. getExplanation())
            attr_slot_to_lines[attr].append("{}public {} get{}() {{".format(INDENT_1, java_type, capitalize(attr)))
            if not search("return", value):
                value = "return {};".format(value)
            attr_slot_to_lines[attr].append(INDENT_2 + value)
            attr_slot_to_lines[attr] += [INDENT_1 + "}", ""]
            continue
        elif value is not None and value != "":
            # Not 'getter_only' attr - generated value assignment code (if there's value to be assigned)
            value = " = {}".format(value)

        # In preparation of outputting getter for an attr that is of type relationship class, retrieve that
        # class (=relationship_clazz) and also the type of its attribute annotated as @TargetNode (=target_node_clazz)
        relationship_clazz, target_node_clazz = get_relationship_and_target_node_class(attr_entry, schema_slots, classes)

        # Assemble attr's getter method and any relevant java annotations into attr_slot_to_getter[attr]
        if 'transient' not in other_annotations and 'no_default_getter_setter' not in other_annotations:
            # Note: transient attributes don't have getters or setters
            if not target_node_clazz:
                # Assemble java annotations and the getter for an attribute _not_ of type relationship class (as in that
                # case the getter is retrieved from code templates)
                add_getter(attr, attr_entry, java_type, annot_lines, attr_slot_to_getter)
            if not target_node_clazz or 'include_default_setter' in other_annotations:
                # Output setter if attr is _not_ of type relationship class (as in that case the setter is
                # retrieved from code templates), or if include_default_setter is included in attr's annotations
                add_setter(attr_entry, attr, java_type, attr_slot_to_setter)

        # Now output getter/setter/fetch methods in the case attr is of type relationship class
        dbid_variable_name = get_dbid_variable_name(schema_slots)
        if target_node_clazz and 'no_default_getter' not in other_annotations:
            add_getter_setter_fetch_for_relationship_attribute(
                attr_entry, attr, attr_slot_to_getter, attr_slot_to_setter,
                relationship_clazz, target_node_clazz, dbid_variable_name, other_annotations, annotations_imports)

        # Output declaration of attribute attr
        accessibility = "private"
        if 'protected' in other_annotations and other_annotations['protected'] is True:
            accessibility = "protected"
        elif 'public' in other_annotations and other_annotations['public'] is True:
            accessibility = "public"
        attr_slot_to_lines[attr] += ["{}{}{}{} {}{};".format(INDENT_1, accessibility,
                                         get_keywords(other_annotations, ["static", "final", "transient"]),
                                         java_type, attr, value),
                                     ""]

    # Assemble return lists for all attributes/slots
    for attr_slot in sorted(list(attr_slot_to_lines.keys())):
        attr_slot_lines += attr_slot_to_lines[attr_slot]
    for attr_slot in sorted(list(attr_slot_to_lines.keys())):
        getter_setter_lines += attr_slot_to_getter[attr_slot]
        getter_setter_lines += attr_slot_to_setter[attr_slot]

    return attr_slot_lines, getter_setter_lines, annotations_imports


def get_value(class_entry: dict, attr: str, attr_entry: dict) -> str:
    """ Return correctly formatted value to be assigned to attr in the generated Java class"""
    ret = ""
    if attr == "explanation":
        # For getExplanation() method return the content of 'description' field
        if 'description' in class_entry:
            ret = "\"{}\"".format(class_entry['description'])
    else:
        value = None
        if 'ifabsent' in attr_entry:
            # Return 'ifabsent' value as is unless it's a boolean in which case lower-case it (boolean in Java in lower case)
            value = attr_entry['ifabsent']
            if type(value) == bool:
                value = str(value).lower()
        elif 'slot_usage' in class_entry \
            and attr in class_entry['slot_usage'] \
            and 'ifabsent' in class_entry['slot_usage'][attr]:
                # Cater for attributes that have 'ifabsent' value specified in 'slot_usage' section
                value = class_entry['slot_usage'][attr]['ifabsent']
        if value is not None:
            if search("^(string|int)", str(value)):
                # First extract value from within string(val) or int(val) statement
                ret = findall(r'.*\((.*)\)', value)[0]
                if value.startswith("string"):
                    # Double-quote a value of type string
                    ret = "\"{}\"".format(ret)
            else:
                ret = value
    return ret

def get_empty_constructor(clazz: str) -> str:
    """ Return empty constructor of class clazz"""
    return "{}public {}() {{}}".format(INDENT_1, clazz)


def get_parameterized_constructor(clazz: str, slots: dict, class_entry: dict, other_annotations: list) -> str:
    """ Return parameterised constructor of class clazz with constructor parameter and its type retrieved
        from other_annotations - e.g.
        public EntityWithAccessionedSequence(Long dbId) { super(dbId); }
            or
        public DatabaseObject(Long dbId) { this.dbId = dbId; }
    """
    ret = None
    if 'constructor_parameter' in other_annotations:
        parameter_name = other_annotations['constructor_parameter']
        # N.B. Assumption that any constructor_parameter must be a slot
        slot = slots[parameter_name]
        if 'range' in slot:
            range = slot['range']
            if range == "AnnotationLongType":
                java_type = "Long"
            elif range == "AnnotationBytesType":
                java_type = "byte[]"
            else:
                java_type = capitalize(range)
        if 'slots' in class_entry and parameter_name in class_entry['slots']:
            ret = "{}public {}({} {}) {{ this.{} = {}; }}"\
                .format(INDENT_1, clazz, java_type, parameter_name, parameter_name, parameter_name)
        else:
            ret = "{}public {}({} {}) {{ super({}); }}" \
                .format(INDENT_1, clazz, java_type, parameter_name, parameter_name)
    return ret


def is_annotation(clazz: str) -> bool:
    """ Return true if clazz is an annotation class (i.e. should not be output as .java class)"""
    return clazz.startswith("Annotation") or clazz in CLASS_TO_PACKAGE_NAME


def find(file_name: str, path: str) -> str:
    """ Return path to a file called file_name if it exists within path; otherwise return None"""
    for root, dirs, files in os.walk(path):
        if file_name in files:
            return os.path.join(root, file_name)
    return None

def get_additional_class_content(clazz: str, annotations_imports: set) -> (str, set):
    """ Return additional content for class clazz """
    ret_code = None
    fh = find("{}.java".format(clazz), os.path.join("additional_class_content", OUTPUT_DIR))
    if fh:
        if clazz == "DatabaseObject":
            for annot_clazz in ['NonNull', 'InvocationTargetException', 'ParameterizedType', 'Method']:
                annotations_imports.add('import {}.{};'
                                        .format(CLASS_TO_PACKAGE_NAME[annot_clazz], annot_clazz))
        elif clazz == "Person":
            for annot_clazz in ['JsonGetter']:
                annotations_imports.add('import {}.{};'
                                        .format(CLASS_TO_PACKAGE_NAME[annot_clazz], annot_clazz))
        elif clazz == "ReferenceEntity":
            for annot_clazz in ['ReactomeSchemaIgnore', 'JsonIgnore']:
                annotations_imports.add('import {}.{};'
                                        .format(CLASS_TO_PACKAGE_NAME[annot_clazz], annot_clazz))
        with open(fh, 'r') as additional_content_file:
            ret_code = additional_content_file.read()
    return ret_code, annotations_imports


def get_comparable_methods_for_relationship_class(clazz: str, class_entry: str, annotations_imports: set) -> str:
    """ Return chunk of code containing methods implementing java Comparable interface for class: clazz """
    ret_code = None
    if is_class_relationship(class_entry):
        fh = os.path.join("code_templates","RelationshipComparable.java")
        with open(fh, 'r') as additional_content_file:
            ret_code = additional_content_file.read()
            ret_code = ret_code.replace("@RelationshipClass@", clazz)
            annotations_imports.add("import java.util.Objects;")
    return ret_code, annotations_imports


def get_filled_relationship_code_template(relationship_clazz: str, target_node_clazz: str,
                                          attr: str, template_file_name: str, dbid_variable_name: str) -> str:
    """ Return chunk of code containing a getter/setter/fetch method for class relationship_clazz's attribute attr
        from template file template_file_name.
    """
    fh = os.path.join("code_templates", template_file_name)
    with open(fh, 'r') as additional_content_file:
        ret = additional_content_file.read()
        ret = ret.replace("@RelationshipClass@", relationship_clazz)
        ret = ret.replace("@TargetNodeClass@", target_node_clazz)
        ret = ret.replace("@targetNodeClass@", lower_case(target_node_clazz))
        ret = ret.replace("@attribute@", attr)
        ret = ret.replace("@Attribute@", capitalize(attr))
        ret = ret.replace("@DbId@", capitalize(dbid_variable_name))
    return ret


def get_filled_allowed_code_template(attr: str, java_type: str, allowed_annot: str, template_file_name: str) -> str:
    """ Generate chunk of code containing a special case setter method for attr that has allowed classes java annotation -
        this setter method throws a RuntimeException unless the setter's call argument is of the allowed type"""
    allowed_classes_str = findall(r'^\{(.*)\}$', allowed_annot)[0]
    allowed_classes = sub(r'\.class|\s', '', allowed_classes_str).split(",")
    allowed_test_clauses = ""
    for clazz in allowed_classes:
        if allowed_test_clauses:
            allowed_test_clauses += " || "
        allowed_test_clauses += "{} instanceof {}".format(attr, clazz)
    error_msg = "\" is none of: {}\"".format(", ".join(allowed_classes))

    fh = os.path.join("code_templates", template_file_name)
    with open(fh, 'r') as additional_content_file:
        ret = additional_content_file.read()
        ret = ret.replace("@Clazz@", java_type)
        ret = ret.replace("@attribute@", attr)
        ret = ret.replace("@Attribute@", capitalize(attr))
        ret = ret.replace("@allowed_test_clauses@", allowed_test_clauses)
        ret = ret.replace("@error_msg@", error_msg)
    return ret

def get_dbid_variable_name(slots):
    """ Get variable name for dbId/DB_ID variable (the name of this variable differs between the curator and web schemas)"""
    if "DB_ID" in slots:
        return "DB_ID"
    else:
        return "dbId"

def output_java(clazz: str, classes: dict, slots: dict, annot_attr2class: dict):
    # Retrieve content for class clazz
    annotations_imports = set([])
    class_entry = classes[clazz]
    package = get_package(class_entry)
    output_dir = os.path.join(OUTPUT_DIR, get_package_suffix(class_entry))
    annot_lines = []
    other_annotations = []
    if 'annotations' in class_entry:
        annot_lines, other_annotations, annotations_imports = \
            get_annotations(class_entry['annotations'], annot_attr2class, annotations_imports, INDENT_0)
        annotations_imports.update(get_annotation_imports(class_entry['annotations'], annot_attr2class))
    class_declaration = "public{}class {}".format(get_keywords(other_annotations, ["abstract"]), clazz)
    class_declaration += get_extends(class_entry)
    implement_clause, annotations_imports = get_implements(clazz, classes, other_annotations, annotations_imports)
    class_declaration += implement_clause
    attr_slot_lines, getter_setter_lines, annotations_imports = \
        get_class_attributes_slots(clazz, class_entry, slots, annot_attr2class, annotations_imports, classes)
    parameterized_constructor = get_parameterized_constructor(clazz, data['slots'], class_entry, other_annotations)
    additional_class_content, annotations_imports = get_additional_class_content(clazz, annotations_imports)
    comparable_methods, annotations_imports = \
        get_comparable_methods_for_relationship_class(clazz, class_entry, annotations_imports)
    # Assemble class content into lines list
    lines = []
    lines += ['package {};'.format(package), ""]
    if annotations_imports:
        lines += sorted(list(annotations_imports)) + [""]
    lines += annot_lines
    lines += ["{} {{".format(class_declaration), ""]
    lines += attr_slot_lines
    if 'no_default_constructor' not in other_annotations:
        lines += [get_empty_constructor(clazz), ""]
    if parameterized_constructor:
        lines += [parameterized_constructor, ""]
    lines += getter_setter_lines
    if additional_class_content:
        lines += [additional_class_content, ""]
    if comparable_methods:
        lines += [comparable_methods, ""]
    lines += ["}", ""]
    # Write class content into the file
    fp = open(os.path.join(output_dir, "{}.java".format(clazz)), 'w')
    # DEBUG: print(clazz, lines)
    fp.write("\n".join(lines))
    fp.close()

def inherit_attributes_slots(class_entry: dict, attributes: dict, classes: dict):
    """Inherit all attributes/slots of parents of clazz in class_entry - recursively to the top parent"""
    if 'is_a' in class_entry:
        parent_clazz = class_entry['is_a']
        parent_class_attributes = get_attr_slot_entries(classes[parent_clazz], slots)
        for attr in parent_class_attributes:
            if attr not in attributes:
                attributes[attr] = parent_class_attributes[attr]

def get_filled_mysql_table_template(clazz: str, classes: dict, slots: dict) -> str:
    """Generate mysql representation of clazz, by filling the table mysql template"""
    ret = None
    lines = ["`DB_ID` int unsigned NOT NULL DEFAULT 0,"]

    class_entry = classes[clazz]
    fh = os.path.join("mysql_templates", "gk_table.sql")
    with open(fh, 'r') as mysql_table_template:
        ret = mysql_table_template.read()
        ret = ret.replace("@TABLE_NAME@", clazz)
        attributes = get_attr_slot_entries(class_entry, slots)
        for attr in attributes:
            # DEBUG: print(clazz, attr, attributes, attributes[attr])
            attr_entry = attributes[attr]
            if attr in attributes and attributes[attr] is not None:
                # TODO: deal with multivalued here
                if 'multivalued' in attr_entry and attr_entry['multivalued'] is True:
                    None
                    # TODO: output class_2_multivalued_primitive_attribute - ret needs to be become a list of class str's -
                    # TODO clazz's str being the first, followed by any class_2_*'s str's
                else:
                    # Get suffix: (NOT NULL or DEFAULT NULL)
                    if 'annotations' in attr_entry:
                        if 'constraint' in attr_entry['annotations'] and \
                            attr_entry['annotations']['constraint'] == 'MANDATORY':
                            suffix = "NOT NULL"
                        else:
                            suffix = "DEFAULT NULL"
                    else:
                        suffix = "DEFAULT NULL"
                    mysql_type = "TBC"
                    if 'range' in attr_entry:
                        range = attr_entry['range']
                        if range in RANGE_TO_MYSQL_TYPE:
                            mysql_type = RANGE_TO_MYSQL_TYPE[range]
                        elif range[0].isupper():
                            # attr refers to a class
                            None
                    else:
                        mysql_type = RANGE_TO_MYSQL_TYPE['string']
                    lines.append("{}`{}` {} {},".format(INDENT_1, attr, mysql_type, suffix))
            else:
                # e.g. name in DBInfo - a simple string with no annotations
                range = "string"
                suffix = "DEFAULT NULL"
                mysql_type = RANGE_TO_MYSQL_TYPE[range]
                lines.append("{}`{}` {} {},".format(INDENT_1, attr, mysql_type, suffix))
        lines.append("{}PRIMARY KEY (`DB_ID`),".format(INDENT_1))
        ret = ret.replace("@TABLE_CONTENT@", "\n".join(lines))

    return ret

def generate_graphql(clazz: str, classes: dict, slots: dict):
    """Generate grqphql representation of clazz"""
    lines = []
    class_entry = classes[clazz]
    if 'description' in class_entry:
        lines += ["\"\"\"", class_entry['description'], "\"\"\""]
    prefix = "type"
    implements_clause = ""
    if clazz == "DatabaseObject":
        prefix = "interface"
    if 'is_a' in class_entry and class_entry['is_a'] == "DatabaseObject":
        implements_clause = " implements {}".format(class_entry['is_a'])
    lines.append("{} {}{}".format(prefix, clazz, implements_clause))
    lines.append("{")
    attributes = get_attr_slot_entries(class_entry, slots)
    inherit_attributes_slots(class_entry, attributes, classes)
    attr2line = {}
    for attr in attributes:
        attrLines = []
        mandatory = ""
        attr_entry = attributes[attr]
        graphql_type = None
        if attr_entry is not None:

            # Get mandatory flag
            if 'annotations' in attr_entry:
                if 'constraint' in attr_entry['annotations'] and \
                    attr_entry['annotations']['constraint'] == 'MANDATORY':
                    mandatory = "!"
                if 'id' in attr_entry['annotations'] and attr_entry['annotations']['id']:
                    mandatory = "!"
                    graphql_type = "ID"

            # Get attribute description if available
            description = ""
            if 'description' in attr_entry:
                description = attr_entry['description']
            if 'annotations' in attr_entry and 'direction' in attr_entry['annotations']:
                direction = attr_entry['annotations']['direction']
                if direction:
                    if description:
                        description += "; "
                    description += "direction: {}".format(direction)
            if description:
                attrLines.append("{}{}{}{}".format(INDENT_1, "\"", description, "\""))

            # Get graphql_type for attr (unless already assigned - see above)
            if not graphql_type:
                if 'range' in attr_entry:
                    # TODO: Deal correctly with conversion of linkml type to graphql_type
                    if attr_entry['range'] == "AnnotationLongType" or attr_entry['range'] == "integer":
                        # TODO: Long is not one of basic types in https://graphql.org/graphql-js/basic-types/
                        graphql_type = "Int"
                    elif attr_entry['range'] == "AnnotationBytesType":
                        # TODO: byte[] is not one of basic types in https://graphql.org/graphql-js/basic-types/
                        graphql_type = "String"
                    else:
                        graphql_type = capitalize(attr_entry['range'])
                else:
                    graphql_type = "String"
            # Wrap in [] if attr multivalued
            if 'multivalued' in attr_entry and attr_entry['multivalued']:
                # Putting mandatory flag inside a list means that no null entries are
                # allowed in that list - i.e. any entry in that list has to be of type: graphql_type
                # See: https://graphql.org/learn/schema/
                graphql_type = "[{}{}]".format(graphql_type, mandatory)
        else:
            graphql_type = "String"

        attrLines.append("{}{}: {}{}".format(INDENT_1, attr, graphql_type, mandatory))
        attr2line[attr] = "\n".join(attrLines)

    for attr in sorted(list(attr2line.keys())):
        lines.append(attr2line[attr])

    lines += ["}", "", ""]
    return lines


# Main program body
with open("schema.yaml", "r") as stream:
    try:
        data = yaml.safe_load(stream)
        if web_schema_diff_file_name is not None:
            data = get_web_yaml(web_schema_diff_file_name, data)
            if data is None:
                print("ERROR: Failed to generate schema.web.yaml")
                sys.exit(1)
        classes = data['classes']
        slots = data['slots']
        annotations = classes['Annotations']['attributes']
        annot_attr2class = map_annotation_attributes_to_classes(annotations, classes)
        graphql_lines = []
        mysql_lines = []
        for clazz in classes:
            if is_annotation(clazz):
                # Don't output annotation classes into .java file
                continue
            if output_type == "java":
                output_java(clazz, classes, slots, annot_attr2class)
            elif output_type == "graphql":
                graphql_lines += generate_graphql(clazz, classes, slots)
            elif output_type == "yaml":
                # Output data as yaml so that it can be validated
                aux = copy.deepcopy(data)
                # Remove any slot annotations with None as value - as that makes validation fail
                for slot_name in aux['slots']:
                    slot = aux['slots'][slot_name]
                    if 'annotations' in slot:
                        non_null_annots = {}
                        for key in slot['annotations']:
                            if slot['annotations'][key] is not None:
                                non_null_annots[key] = slot['annotations'][key]
                        slot['annotations'] = non_null_annots
                with open("schema.web.yaml", "w") as outf:
                    yaml.dump(aux, outf, default_flow_style=False)
            elif output_type == "mysql":
                mysql_lines.append(get_filled_mysql_table_template(clazz, classes, slots))

        if output_type == "graphql":
            # Write generated graphql content to a file
            suffix = ""
            if web_schema_diff_file_name is not None:
                suffix = ".web"
            fp = open(os.path.join(OUTPUT_DIR, "schema{}.graphql".format(suffix)), 'w')
            fp.write("\n".join(graphql_lines))
            fp.close()

        elif output_type == "mysql":
            fh = os.path.join("mysql_templates", "gk_current.sql")
            with open(fh, 'r') as mysql_template:
                mysql_content = mysql_template.read()
                mysql_content = mysql_content.replace("@SCHEMA_CONTENT@", "\n".join(mysql_lines))
                # Write generated mysql content to a file
                fp = open(os.path.join(OUTPUT_DIR, "gk_current.sql"), 'w')
                fp.write(mysql_content)
                fp.close()


    except yaml.YAMLError as exc:
        print(exc)
        sys.exit(1)

