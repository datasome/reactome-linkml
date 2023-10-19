#!/usr/bin/env python

import yaml
import json
import pprint

def generate_json_for_clazz(clazz: str, clazz_to_children: dict):
    children = []
    if clazz in clazz_to_children:
        for child_clazz in clazz_to_children[clazz]:
            child_entry = {}
            child_entry['name'] = child_clazz
            list_of_children = generate_json_for_clazz(child_clazz, clazz_to_children)
            if list_of_children:
                child_entry['children'] = list_of_children
            children.append(child_entry)
    return children
        
with open("schema.web.yaml", "r") as stream:
    try:
        data = yaml.safe_load(stream)
        pp = pprint.PrettyPrinter(indent=4)
        # pp.pprint(data['classes'])
        clazz_to_children = {}
        clazz2attributes = data['classes']
        for clazz in clazz2attributes:
            if clazz2attributes[clazz] is not None:
                if 'is_a' in clazz2attributes[clazz]:
                    parent = clazz2attributes[clazz]['is_a']
                    if parent in clazz_to_children:
                        clazz_to_children[parent].append(clazz)
                    else:
                        clazz_to_children[parent] = [clazz]
        top_parent = 'DatabaseObject'
        ret = {}
        ret['name'] = top_parent
        ret['children'] = generate_json_for_clazz(top_parent, clazz_to_children)
        print(json.dumps(ret))
        # pp.pprint(ret)
    except yaml.YAMLError as exc:
        print(exc)

