#!/usr/bin/env python

import yaml
import os
from re import sub, findall, search
import copy

OUTPUT_DIR = "graph-core-classes"
JAVA_PACKAGE = "package org.reactome.server.graph.domain.model;"

CLASS_TO_PACKAGE_NAME = {
    "DatabaseObjectLike": "org.reactome.server.graph.domain.result",
    "GeneratedValue": "org.springframework.data.neo4j.core.schema",
    "Id": "org.springframework.data.neo4j.core.schema",
    "JsonIdentityInfo": "com.fasterxml.jackson.annotation",
    "JsonIgnore": "com.fasterxml.jackson.annotation",
    "ObjectIdGenerators": "com.fasterxml.jackson.annotation",
    "Node": "org.springframework.data.neo4j.core.schema",
    "ReactomeAllowedClasses": "org.reactome.server.graph.domain.annotations",
    "ReactomeConstraint": "org.reactome.server.graph.domain.annotations",
    "ReactomeInstanceDefiningValue": "org.reactome.server.graph.domain.annotations",
    "ReactomeProperty": "org.reactome.server.graph.domain.annotations",
    "ReactomeRelationship": "org.reactome.server.graph.domain.annotations",
    "ReactomeSchemaIgnore": "org.reactome.server.graph.domain.annotations",
    "ReactomeTransient": "org.reactome.server.graph.domain.annotations",
    "Relationship": "org.springframework.data.neo4j.core.schema",
    "RelationshipProperties" : "org.springframework.data.neo4j.core.schema",
    "Serializable": "java.io",
    "StoichiometryObject": "org.reactome.server.graph.service.helper"
}

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
                     'no_list_setter', 'include_stoichiometry']
INDENT_0 = ""
INDENT_1 = "    "
INDENT_2 = "        "

def is_class_relationship(class_entry):
    if 'annotations' in class_entry:
        class_annotations = class_entry['annotations']
        if 'relationship_properties' in class_annotations and class_annotations['relationship_properties']:
            return True
    return False

def get_package(class_entry):
    pkg_root = "org.reactome.server.graph.domain"
    if is_class_relationship(class_entry):
        pkg_suffix = "relationship"
    else:
        pkg_suffix = "model"
    return "{}.{}".format(pkg_root, pkg_suffix)

def get_keywords(class_annotations, keywords):
    ret = " "
    for keyword in keywords:
        if keyword in class_annotations and class_annotations[keyword]:
            ret += '{} '.format(keyword)
    return ret

def get_extends(class_entry):
    ret = ""
    if 'is_a' in class_entry:
        ret = ' extends {}'.format(class_entry['is_a'])
    return ret


def get_implements(clazz, classes, class_annotations, annotations_imports):
    ret = ""
    if 'implements' in class_annotations:
        implements_clause = class_annotations['implements']
        ret = ' implements {}'.format(implements_clause)

        # Add import statements for classes inside implements clause
        for entry in implements_clause.replace(" ", "").split(","):
            clazzes = findall(r'\<(.*)\>', entry)
            if clazzes:
                implementing_clazz = clazzes[0]
            else:
                implementing_clazz = entry
            if implementing_clazz in CLASS_TO_PACKAGE_NAME:
                annotations_imports.add('import {}.{};'
                                        .format(CLASS_TO_PACKAGE_NAME[implementing_clazz], implementing_clazz))
            else:
                clazz_package = get_package(classes[clazz])
                implementing_clazz_entry = get_package(classes[implementing_clazz])
                if clazz_package != implementing_clazz_entry:
                    annotations_imports.add(
                        'import {}.{};'.format(clazz_package, clazz))
    return ret


def add_collection_if_applicable(java_type, attr_entry, attr_annotations, annotations_imports):
    ret = java_type
    if 'multivalued' in attr_entry:
        annotations_imports.add('java.util.*;')
        for collection_type in ['set', 'sorted_set']:
            if collection_type in attr_annotations and attr_annotations[collection_type]:
                ret = "{}<{}>".format(capitalize(collection_type), java_type)
                break
        if ret == java_type:
            # No set/sorted_set annotation was found => we default to collection type: List
            ret = "{}<{}>".format("List", java_type)
    return ret


def isClassName(label):
    return label[0].isupper()


def capitalize(attr):
    if not attr[0].isupper():
        if "_" in attr:
            return sub(r"_+", " ", attr).title().replace(" ", "")
        else:
            attr = attr[0].upper() + attr[1:]
    return attr

def lower_case(attr):
    return attr[0].lower() + attr[1:]


def map_annotation_attributes_to_classes(annotations, classes):
    annot_attr2class = {}
    for annotation in annotations:
        if annotations[annotation] is not None:
            # N.B. annotations[annotation] is None means its range is str (hence doesn't go into annot_attr2class)
            range = annotations[annotation]['range']
            if isClassName(range):
                    for annot_attr in classes[range]['attributes']:
                        annot_attr2class[annot_attr] = range
    return annot_attr2class


def get_annotation_imports(annotations, annot_attr2class):
    annotations_imports = set([])
    for annot_attr in annotations:
        if annot_attr in annot_attr2class:
            annot_class = annot_attr2class[annot_attr]
            annotations_imports.add('import {}.{};'.format(CLASS_TO_PACKAGE_NAME[annot_class], annot_class))
        else:
            if annot_attr not in OTHER_ANNOTATIONS:
                annot_class = capitalize(annot_attr)
                if annot_class in CLASS_TO_PACKAGE_NAME:
                    annotations_imports.add(
                        'import {}.{};'.format(CLASS_TO_PACKAGE_NAME[annot_class], annot_class))
    return annotations_imports

def quote_value(value):
    if not search(r"{.*}", value):
        return "\"{}\"".format(value)
    return value

def get_annotations(annotations, annot_attr2class, indent):
    class_to_annotation_clauses = {}
    lines = []
    other_annotations = {}
    for annot_attr in annotations:
        if annot_attr in annot_attr2class:
            annot_class = annot_attr2class[annot_attr]
            if annot_class not in class_to_annotation_clauses:
                class_to_annotation_clauses[annot_class] = []
            value = annotations[annot_attr]
            if value:
                if type(value) == bool:
                    value = str(value).lower()
                elif value in VALUE_TO_JAVA_ENUM:
                    value = "{}.{}".format(VALUE_TO_JAVA_ENUM[value], value)
                elif value.endswith(".class"):
                    # e.g. "ObjectIdGenerators.PropertyGenerator.class"
                    value = value.split(".")[0]
                    annotations_imports.add(
                        'import {}.{};'.format(CLASS_TO_PACKAGE_NAME[value], value))
                else:
                    value = quote_value(value)
                class_to_annotation_clauses[annot_class].append("{} = {}".format(annot_attr, value))
        else:
            if annotations[annot_attr]:
                if annot_attr not in OTHER_ANNOTATIONS:
                    annot_class = capitalize(annot_attr)
                    value = annotations[annot_attr]
                    if value and not type(value) == bool:
                        value = quote_value(value)
                        lines.append("{}@{}({})".format(indent, annot_class, value))
                    else:
                        lines.append("{}@{}".format(indent, annot_class))
                else:
                    other_annotations[annot_attr] = annotations[annot_attr]

    for annot_class in class_to_annotation_clauses:
        if class_to_annotation_clauses[annot_class]:
            annot_clauses = "({})".format(", ".join(class_to_annotation_clauses[annot_class]))
        else:
            annot_clauses = ""
        lines.append("{}@{}{}".format(indent, annot_class, annot_clauses))
    return lines, other_annotations

def get_relationship_and_target_node_classs(attr_entry, schema_slots, classes):
    if attr_entry and 'range' in attr_entry:
        attr_range = attr_entry['range']
        if attr_range in classes and classes[attr_range] and \
            'annotations' in classes[attr_range] and \
            'relationship_properties' in classes[attr_range]['annotations']:
            relationship_class_entry = classes[attr_range]

            attributes = {}
            if 'attributes' in relationship_class_entry:
                attributes |= relationship_class_entry['attributes']
            if 'slots' in relationship_class_entry:
                for attr in relationship_class_entry['slots']:
                    attributes[attr] = schema_slots[attr]
            for attr in attributes:
                attr_entry = attributes[attr]
                if 'annotations' in attr_entry and \
                        'target_node' in attr_entry['annotations'] and \
                        attr_entry['annotations']['target_node']:
                    return attr_range, attr_entry['range']
    return None, None

def get_class_attributes_slots(clazz, class_entry, schema_slots, annot_attr2class, annotations_imports, classes):
    attr_slot_to_lines = {}
    attr_slot_to_getter = {}
    attr_slot_to_setter = {}
    attr_slot_lines = []
    getter_setter_lines = []

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
    for attr in attributes:
        other_annotations = {}
        attr_entry = attributes[attr]
        if attr_entry is not None:
            if 'range' in attr_entry:
                if attr_entry['range'] == "AnnotationLongType":
                    java_type = "Long"
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
            if 'annotations' in attr_entry:
                annot_lines, other_annotations = get_annotations(attr_entry['annotations'], annot_attr2class, INDENT_1)
                attr_slot_to_lines[attr] = annot_lines
                annotations_imports.update(get_annotation_imports(attr_entry['annotations'], annot_attr2class))
                java_type = add_collection_if_applicable(java_type, attr_entry, other_annotations, annotations_imports)
        else:
            java_type = "String"

        value = ""
        if attr not in attr_slot_to_lines:
            attr_slot_to_lines[attr] = []
        attr_slot_to_getter[attr] = []
        attr_slot_to_setter[attr] = []

        if attr_entry:
            value = get_value(class_entry, attr, attr_entry)
        if 'getter_only' in other_annotations and other_annotations['getter_only']:
            # 'getter_only' means no variable - just a getter method returning a value (e.g. getExplanation())
            attr_slot_to_lines[attr].append(INDENT_1 + "public {} get{}() {{".format(java_type, capitalize(attr)))
            if not search("return", value):
                value = "return {};".format(value)
            attr_slot_to_lines[attr].append(INDENT_2 + value)
            attr_slot_to_lines[attr] += [INDENT_1 + "}", ""]
            continue
        else:
            value = " = {}".format(value)
        relationship_clazz, target_node_clazz = get_relationship_and_target_node_classs(attr_entry, schema_slots, classes)
        if 'transient' not in other_annotations and 'no_default_getter_setter' not in other_annotations:
            if not target_node_clazz:
                attr_slot_to_getter[attr] += [
                    INDENT_1 + "public {} get{}() {{ return {}; }}".format(java_type, capitalize(attr), attr),
                    ""]
            if not target_node_clazz or 'include_default_setter' in other_annotations:
                attr_slot_to_setter[attr] += [
                    INDENT_1 + "public void set{}({} {}) {{".format(capitalize(attr), java_type, attr),
                    INDENT_2 + "this.{} = {};".format(attr, attr),
                    INDENT_1 + "}",
                    ""]
        if target_node_clazz:
            if 'include_fetch' in other_annotations:
                attr_slot_to_getter[attr] += \
                    [get_filled_code_template(relationship_clazz, target_node_clazz, attr, "RelationshipFetch.java"), ""]
            if 'include_stoichiometry' in other_annotations:
                getter_template_file = "RelationshipGet.java"
                setter_template_file = "RelationshipSet.java"
            else:
                getter_template_file = "RelationshipGetNoStoichiometry.java"
                setter_template_file = "RelationshipSetNoStoichiometry.java"
            attr_slot_to_getter[attr] += \
                [get_filled_code_template(relationship_clazz, target_node_clazz, attr, getter_template_file), ""]
            if 'no_list_setter' not in other_annotations:
                attr_slot_to_setter[attr] += \
                    [get_filled_code_template(relationship_clazz, target_node_clazz, attr, setter_template_file), ""]

        attr_slot_to_lines[attr] += [INDENT_1 + \
                                     "private{}{} {}{};".format(
                                         get_keywords(other_annotations, ["static", "final", "transient"]),
                                         java_type, attr, value),
                                     ""]

    for attr_slot in sorted(list(attr_slot_to_lines.keys())):
        attr_slot_lines += attr_slot_to_lines[attr_slot]
    for attr_slot in sorted(list(attr_slot_to_lines.keys())):
        getter_setter_lines += attr_slot_to_getter[attr_slot]
        getter_setter_lines += attr_slot_to_setter[attr_slot]

    return attr_slot_lines, getter_setter_lines, sorted(list(annotations_imports))


def get_value(class_entry, attr, attr_entry):
    ret = None
    if attr == "explanation":
        if 'description' in class_entry:
            ret = "\"{}\"".format(class_entry['description'])
    else:
        value = None
        if 'ifabsent' in attr_entry:
            value = attr_entry['ifabsent']
        elif 'slot_usage' in class_entry \
            and attr in class_entry['slot_usage'] \
            and 'ifabsent' in class_entry['slot_usage'][attr]:
                value = class_entry['slot_usage'][attr]['ifabsent']
        if value:
            if search("^(string|int)", value):
                ret = findall(r'.*\((.*)\)', value)[0]
                if value.startswith("string"):
                    ret = "\"{}\"".format(ret)
            else:
                ret = value
    return ret


def get_empty_constructor(clazz):
    return INDENT_1 + "public {}() {{}}".format(clazz)


def get_parameterized_constructor(clazz, slots, class_entry, other_annotations):
    ret = None
    if 'constructor_parameter' in other_annotations:
        parameter_name = other_annotations['constructor_parameter']
        # N.B. Assumption that any constructor_parameter must be a slot
        slot = slots[parameter_name]
        if 'range' in slot:
            range = slot['range']
            if range == "AnnotationLongType":
                java_type = "Long"
            else:
                java_type = capitalize(range)
        if 'slots' in class_entry and parameter_name in class_entry['slots']:
            ret = INDENT_1 + "public {}({} {}) {{ this.{} = {}; }}"\
                .format(clazz, java_type, parameter_name, parameter_name, parameter_name)
        else:
            ret = INDENT_1 + "public {}({} {}) {{ super({}); }}" \
                .format(clazz, java_type, parameter_name, parameter_name)
    return ret


def is_annotation(clazz):
    return clazz.startswith("Annotation") or clazz in CLASS_TO_PACKAGE_NAME


def find(name, path):
    for root, dirs, files in os.walk(path):
        if name in files:
            return os.path.join(root, name)


def get_additional_class_content(clazz):
    ret = None
    fh = find("{}.java".format(clazz), "additional_class_content")
    if fh:
        with open(fh, 'r') as additional_content_file:
            ret = additional_content_file.read()
    return ret

def get_comparable_methods_for_relationship_class(clazz, class_entry):
    ret = None
    if is_class_relationship(class_entry):
        fh = os.path.join("code_templates","RelationshipComparable.java")
        with open(fh, 'r') as additional_content_file:
            ret = additional_content_file.read()
        ret = ret.replace("@RelationshipClass@", clazz)
        return ret

def get_filled_code_template(relationship_clazz, target_node_clazz, attr, template_file_name):
    fh = os.path.join("code_templates", template_file_name)
    with open(fh, 'r') as additional_content_file:
        ret = additional_content_file.read()
    ret = ret.replace("@RelationshipClass@", relationship_clazz)
    ret = ret.replace("@TargetNodeClass@", target_node_clazz)
    ret = ret.replace("@targetNodeClass@", lower_case(target_node_clazz))
    ret = ret.replace("@attribute@", attr)
    ret = ret.replace("@Attribute@", capitalize(attr))
    return ret


with open("schema.web.yaml", "r") as stream:
    try:
        data = yaml.safe_load(stream)
        classes = data['classes']
        slots = data['slots']
        annotations = classes['Annotations']['attributes']
        annot_attr2class = map_annotation_attributes_to_classes(annotations, classes)
        for clazz in classes:
            if is_annotation(clazz):
                continue
            annotations_imports = set([])
            class_entry = classes[clazz]
            package = get_package(class_entry)
            annot_lines, other_annotations = get_annotations(class_entry['annotations'], annot_attr2class, INDENT_0)
            annotations_imports.update(get_annotation_imports(class_entry['annotations'], annot_attr2class))
            class_declaration = "public{}class {}".format(get_keywords(other_annotations, ["abstract"]), clazz)
            class_declaration += get_extends(class_entry)
            class_declaration += get_implements(clazz, classes, other_annotations, annotations_imports)
            attr_slot_lines, getter_setter_lines, annotations_imports = \
                get_class_attributes_slots(clazz, class_entry, slots, annot_attr2class, annotations_imports, classes)
            parameterized_constructor = get_parameterized_constructor(clazz, data['slots'], class_entry, other_annotations)
            additional_class_content = get_additional_class_content(clazz)
            comparable_methods = get_comparable_methods_for_relationship_class(clazz, class_entry)
            # Assemble class content
            lines = []
            lines += ['package {};'.format(package), ""]
            if annotations_imports:
                lines += annotations_imports + [""]
            lines += annot_lines
            lines += ["{} {{".format(class_declaration), ""]
            lines += attr_slot_lines
            lines += [get_empty_constructor(clazz), ""]
            if parameterized_constructor:
                lines += [parameterized_constructor, ""]
            lines += getter_setter_lines
            if additional_class_content:
                lines += [additional_class_content, ""]
            if comparable_methods:
                lines += [comparable_methods, ""]
            # TODO: The rest of the class goes here
            lines += ["}", ""]

            # Write class content into the file
            fp = open(os.path.join(OUTPUT_DIR, "{}.java".format(clazz)), 'w')
            # DEBUG: print(clazz, lines)
            fp.write("\n".join(lines)) 
            fp.close()

    except yaml.YAMLError as exc:
        print(exc)

