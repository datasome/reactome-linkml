#!/usr/bin/env python

import yaml
import os
from re import sub

OUTPUT_DIR = "graph-core-classes"
JAVA_PACKAGE = "package org.reactome.server.graph.domain.model;"

ANNOTATION_CLASS_TO_PACKAGE_NAME = {
    "JsonIdentityInfo": "com.fasterxml.jackson.annotation",
    "JsonIgnore": "com.fasterxml.jackson.annotation",
    "ReactomeAllowedClasses": "org.reactome.server.graph.domain.annotations",
    "ReactomeConstraint": "org.reactome.server.graph.domain.annotations",
    "ReactomeInstanceDefiningValue": "org.reactome.server.graph.domain.annotations",
    "ReactomeProperty": "org.reactome.server.graph.domain.annotations",
    "ReactomeRelationship": "org.reactome.server.graph.domain.annotations",
    "ReactomeSchemaIgnore": "org.reactome.server.graph.domain.annotations",
    "ReactomeTransient": "org.reactome.server.graph.domain.annotations",
    "Id": "org.springframework.data.neo4j.core.schema",
    "Node": "org.springframework.data.neo4j.core.schema",
    "Relationship": "org.springframework.data.neo4j.core.schema"
}

VALUE_TO_JAVA_ENUM = {
    "INCOMING" : "Relationship.Direction",
    "OUTGOING" : "Relationship.Direction",
    "NOMANUALEDIT": "ReactomeConstraint.Constraint",
    "MANDATORY": "ReactomeConstraint.Constraint",
    "OPTIONAL": "ReactomeConstraint.Constraint",
    "REQUIRED": "ReactomeConstraint.Constraint"
}

OTHER_ANNOTATIONS = ['abstract', 'implements', 'set', 'sorted_set', 'getter_only', 'value']
INDENT_0 = ""
INDENT_1 = "    "
INDENT_2 = "        "

def get_abstract(class_annotations):
    ret = " "
    if 'abstract' in class_annotations and other_annotations['abstract']:
        ret = ' abstract '
    return ret

def get_extends(class_entry):
    ret = ""
    if 'is_a' in class_entry:
        ret = ' extends {}'.format(class_entry['is_a'])
    return ret

def get_implements(class_annotations):
    ret = ""
    if 'implements' in class_annotations:
        ret = ' implements {}'.format(class_annotations['implements'])
    return ret

def add_collection_if_applicable(clazz, java_type, attr_entry, attr_annotations):
    ret = java_type
    print("**", clazz, java_type, attr_entry, attr_annotations)
    if 'multivalued' in attr_entry:
        for collection_type in ['set', 'sorted_set']:
            if collection_type in attr_annotations and attr_annotations[collection_type]:
                ret = "{}<{}>".format(capitalize(collection_type), java_type)
                break
        if ret == java_type:
            # No set/sorted_set annotation was found => we default to collection type: List
            ret = "{}<{}>".format("List", java_type)
    print("***", ret)
    return ret

def isClassName(label):
    return label[0].isupper()

def capitalize(attr):
    if not attr[0].isupper():
        return  sub(r"_+", " ", attr).title().replace(" ", "")
    return attr

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
            annotations_imports.add('import {}.{};'.format(ANNOTATION_CLASS_TO_PACKAGE_NAME[annot_class], annot_class))
        else:
            if annot_attr not in OTHER_ANNOTATIONS:
                annot_class = capitalize(annot_attr)
                if annot_class in ANNOTATION_CLASS_TO_PACKAGE_NAME:
                    annotations_imports.add(
                        'import {}.{};'.format(ANNOTATION_CLASS_TO_PACKAGE_NAME[annot_class], annot_class))
    return annotations_imports

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
            if type(value) != bool or value:
                if type(value) == bool:
                    value = str(value).lower()
                elif value in VALUE_TO_JAVA_ENUM:
                    value = "{}.{}".format(VALUE_TO_JAVA_ENUM[value], value)
                else:
                    value = "\"{}\"".format(value)
                class_to_annotation_clauses[annot_class].append("{} = {}".format(annot_attr, value))
        else:
            if annotations[annot_attr]:
                if annot_attr not in OTHER_ANNOTATIONS:
                    annot_class = capitalize(annot_attr)
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

def get_class_attributes_slots(clazz, class_entry, schema_slots, annot_attr2class, annotations_imports):
    attr_slot_to_lines = {}
    lines = []

    attrs = {}
    if 'attributes' in class_entry:
        attrs = class_entry['attributes']
    slots = {}
    if 'slots' in class_entry:
        for slot_name in class_entry['slots']:
            slots[slot_name] = schema_slots[slot_name]
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
            else:
                java_type = "String"
            if 'annotations' in attr_entry:
                annot_lines, other_annotations = get_annotations(attr_entry['annotations'], annot_attr2class, INDENT_1)
                attr_slot_to_lines[attr] = annot_lines
                annotations_imports.update(get_annotation_imports(attr_entry['annotations'], annot_attr2class))
                java_type = add_collection_if_applicable(clazz, java_type, attr_entry, other_annotations)
        else:
            java_type = "String"

        # TODO &&&& value e.g. stoichiometry
        # TODO &&&& process slot_usage for slots - explicitly override slot fields with those in slot_usage
        if attr not in attr_slot_to_lines:
            attr_slot_to_lines[attr] = []
        if 'getter_only' in other_annotations and other_annotations['getter_only']:
            attr_slot_to_lines[attr] += [
                INDENT_1 + "public {} get{}() {{".format(java_type, capitalize(attr)),
                INDENT_2 + "return \"{}\";".format(getValue(clazz, attr, attr_entry['annotations'])),
                INDENT_1 + "}",
                ""]
        else:
            attr_slot_to_lines[attr] += [INDENT_1 + "private {} {};".format(java_type, attr), ""]

    for attr_slot in sorted(list(attr_slot_to_lines.keys())):
        lines += attr_slot_to_lines[attr_slot]
    return lines, sorted(list(annotations_imports))

def getValue(clazz, attr, annotations):
    if attr == "className":
        # TODO: More complex logic required for certain classes; this also doesn't implement inheritance in java classes
        return clazz
    else:
        return annotations['value']

def get_empty_constructor(clazz):
    return INDENT_1 + "public {}() {{}}".format(clazz)

def is_annotation(clazz):
    return clazz.startswith("Annotation") or clazz in ANNOTATION_CLASS_TO_PACKAGE_NAME
        
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
            annot_lines, other_annotations = get_annotations(class_entry['annotations'], annot_attr2class, INDENT_0)
            annotations_imports.update(get_annotation_imports(class_entry['annotations'], annot_attr2class))
            class_declaration = "public{}class {}".format(get_abstract(other_annotations), clazz)
            class_declaration += get_extends(class_entry)
            class_declaration += get_implements(other_annotations)
            class_attributes_slots, annotations_imports = get_class_attributes_slots(
                clazz, class_entry, slots, annot_attr2class, annotations_imports)

            # Assemble class content
            lines = []
            lines += [JAVA_PACKAGE, ""]
            if annotations_imports:
                lines += annotations_imports + [""]
            lines += annot_lines
            lines += ["{} {{".format(class_declaration), ""]
            lines += class_attributes_slots
            lines += [get_empty_constructor(clazz), ""]

            # TODO: The rest of the class goes here
            lines += ["}",""]

            # Write class content into the file
            fp = open(os.path.join(OUTPUT_DIR, "{}.java".format(clazz)), 'w')
            # DEBUG: print(clazz, lines)
            fp.write("\n".join(lines)) 
            fp.close()

    except yaml.YAMLError as exc:
        print(exc)

