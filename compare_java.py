#!/usr/bin/env python

import yaml
import os
from re import sub, findall, search
import copy
import pprint
import sys
import re

if len(sys.argv) < 3:
    print('Specify generated_classes_dir and original_classes_dir')
    sys.exit()
generated_classes_dir = sys.argv[1]
original_classes_dir = sys.argv[2]

def tidy(line: str):
    line = re.sub(r" * { *$", "", line)
    line = re.sub(r" +$", "", line)
    line = re.sub(r"^ +","", line)
    return line

def find(file_name: str, path: str) -> str:
    """ Return path to a file called file_name if it exists within path; otherwise return None"""
    for root, dirs, files in os.walk(path):
        if file_name in files:
            return os.path.join(root, file_name)
    return None

def exclude_generic_imports(imports: list) -> list:
    """ Exclude generic imports from imports list """
    ret = []
    for item in imports:
        if 'java.util' not in item and '.relationship.' not in item:
            ret.append(item)
    return ret

def retrieve_class_content(class_name: str, file_path: str) -> dict:
    class_content = {}
    class_content['imports'] = []
    class_content['class_constructors'] = []
    class_content['attributes'] = []
    class_content['methods'] = []
    current_annotations = []
    with open(file_path) as f:
        for line in f:
            line = line.replace("\n", "")
            if '@' in line:
                for entry in line.split('@'):
                    entry = tidy(entry)
                    if 'private' in entry:
                        # We're dealing with java annotations and attribute declaration in one line, e.g.
                        # @Id @GeneratedValue private Long id;
                        class_content['attributes'].append((tidy(entry), sorted(current_annotations)))
                        current_annotations = []
                    elif entry != "":
                        current_annotations.append("@{}".format(tidy(entry)))
            elif line.startswith("package"):
                class_content['package'] = tidy(line)
            elif line.startswith("import"):
                class_content['imports'].append(tidy(line))
            elif line.startswith("public class {}".format(class_name)):
                class_content['class_statement'] = (tidy(line), sorted(current_annotations))
                current_annotations = []
            elif "public {}".format(class_name) in line:
                class_content['class_constructors'].append((tidy(line), sorted(current_annotations)))
                current_annotations = []
            elif 'private' in line:
                class_content['attributes'].append((tidy(line), sorted(current_annotations)))
                current_annotations = []
            elif 'public' in line:
                method_signature = tidy(tidy(line).split("{")[0])
                class_content['methods'].append((method_signature, sorted(current_annotations)))
                current_annotations = []
    return class_content

generated_class_content = {}
original_class_content = {}
pp = pprint.PrettyPrinter(indent=4)
for root, dirs, files in os.walk(generated_classes_dir):
    for dir in dirs:
        for file_name in os.listdir(os.path.join(root, dir)):
            clazz = file_name.replace(".java","")
            generated_class_file_path = os.path.join(root, dir, file_name)
            generated_class_content[file_name] = retrieve_class_content(clazz, generated_class_file_path)
            original_class_file_path = find(file_name, original_classes_dir)
            original_class_content[file_name] = retrieve_class_content(clazz, original_class_file_path)

# Compare generated and original classes' content in turn
errors = []
if sorted(list(original_class_content.keys())) != sorted(list(generated_class_content.keys())):
    errors.append("Some classes don't match between original and generated")
for clazz in generated_class_content:
    generated = generated_class_content[clazz]
    original = original_class_content[clazz]
    for key in generated:
        generated_item = generated[key]
        original_item = original[key]
        if type(generated_item) == str:
            if generated_item != original_item:
                errors.append("{} ({}): generated '{}' doesn't match the original '{}'"
                              .format(clazz, key, generated_item, original_item))
        elif type(generated_item) == list:
            if key == "imports":
                generated_item = sorted(generated_item)
                original_item = sorted(original_item)
                if generated_item != original_item:
                    filtered_generated_item = exclude_generic_imports(generated_item)
                    filtered_original_item = exclude_generic_imports(original_item)
                    if filtered_generated_item != filtered_original_item:
                        errors.append("{} ({}): generated list doesn't match the original:\n\tonly in generated: {}\n\tonly in original: {}"
                                      .format(clazz, key, set(filtered_generated_item) - set(filtered_original_item),
                                              set(filtered_original_item) - set(filtered_generated_item)))
            elif None:
                None
                # TBC
        elif None:
            None
            # TBC


if errors:
    print("\n".join(errors))
# pp.pprint(generated_class_content)
# print(generated_class_content)
# pp.pprint(original_class_content)
# print(original_class_content)
