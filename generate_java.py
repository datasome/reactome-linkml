#!/usr/bin/env python

import yaml
import json
import pprint
import os

OUTPUT_DIR = "graph-core-classes"
JAVA_PACKAGE = "org.reactome.server.graph.domain.model"

ANNOTATION_CLASS_TO_PACKAGE_NAME = {
    "JsonIdentityInfo": "com.fasterxml.jackson.annotation",
    "JsonIgnore": "com.fasterxml.jackson.annotation",
    "ReactomeProperty": "org.reactome.server.graph.domain.annotations",
    "ReactomeSchemaIgnore": "org.reactome.server.graph.domain.annotations",
    "ReactomeTransient": "org.reactome.server.graph.domain.annotations",
    "Id": "org.springframework.data.neo4j.core.schema",
    "Node": "org.springframework.data.neo4j.core.schema",
    "Relationship": "org.springframework.data.neo4j.core.schema"
}

NON_JAVA_ANNOTATIONS = ['abstract', 'implements', 'set', 'sorted_set']
INDENT_1 = "    "

def get_abstract(class_annotations):
    ret = " "
    if 'abstract' in class_annotations and class_annotations['abstract'] == True:
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

def isClassName(label):
    return label[0].isupper()

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

def get_annotation_imports_and_class_annotations(class_entry, annotations, slots, annot_attr2class):
    annotations_imports = set([])
    class_to_annotation_clauses = {}
    class_annotations = []
    for annot_attr in class_entry['annotations']:
        if annot_attr in annot_attr2class:
            annot_class = annot_attr2class[annot_attr]
            annotations_imports.add('import {}.{};'.format(ANNOTATION_CLASS_TO_PACKAGE_NAME[annot_class], annot_class))
            if annot_class not in class_to_annotation_clauses:
                class_to_annotation_clauses[annot_class] = []
            class_to_annotation_clauses[annot_class].append("{} = {}".format(annot_attr, class_entry['annotations'][annot_attr]))
        else:
            if annot_attr not in NON_JAVA_ANNOTATIONS:
                class_annotations.append("@{}".format(annot_attr.title()))
    for annot_class in class_to_annotation_clauses:
        class_annotations.append("@{}({})".format(annot_class, ", ".join(class_to_annotation_clauses[annot_class])))
    return annotations_imports, class_annotations

def get_empty_constructor(clazz):
    return INDENT_1 + "public {}() {{}}".format(clazz)
        
with open("schema.web.yaml", "r") as stream:
    try:
        data = yaml.safe_load(stream)
        pp = pprint.PrettyPrinter(indent=4)
        classes = data['classes']
        slots = data['slots']
        annotations = classes['Annotations']['attributes']
        annot_attr2class = map_annotation_attributes_to_classes(annotations, classes)
        for clazz in classes:
            class_entry = classes[clazz]
            class_annotations = class_entry['annotations']
            class_declaration = "public{}class {}".format(get_abstract(class_annotations), clazz)
            class_declaration += get_extends(class_entry)
            class_declaration += get_implements(class_annotations)
            lines = []
            annotations_imports, class_annotations = get_annotation_imports_and_class_annotations(
                class_entry, annotations, slots, annot_attr2class)
            fp = open(os.path.join(OUTPUT_DIR, "{}.java".format(clazz)), 'w')

            # Assemble class content
            lines.append("package {};".format(JAVA_PACKAGE))
            lines.append("")
            if annotations_imports:
                lines += sorted(list(annotations_imports))
                lines.append("")
            lines += class_annotations
            lines.append("{} {{".format(class_declaration))
            # TODO: Class attributes go here
            lines.append("")
            lines.append(get_empty_constructor(clazz))

            lines.append("}")

            fp.write("\n".join(lines)) 
            fp.close()

    except yaml.YAMLError as exc:
        print(exc)

