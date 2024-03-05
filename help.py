#!/usr/bin/env python

help_content = {}
help_content['./generate.py'] = [
    ("./generate.py java", "Generate graph-core-curator java classes into curator-graph-core-classes directory"),
    ("./generate.py java schema.web.diff.yaml", "Generate graph-core java classes into graph-core-classes directory"),
    ("./generate.py graphql", "Generate curator-graph-core-classes/schema.graphql from schema.yaml"),
    ("./generate.py graphql schema.web.diff.yaml",
        "Generate graph-core-classes/schema.web.graphql from schema.yaml merged with schema.web.diff.yaml"),
    ("./generate.py yaml schema.web.diff.yaml",
        "Generate schema.web.yaml by merging schema.yaml and schema.web.diff.yaml - so that schema.web.yaml's syntax can be validated")
    ("./generate.py mysql",
        "Generate the full SQL DDL/DataModel content - based on schema.yaml"
    )
]
help_content['gen-json-schema'] = [
    ("gen-json-schema schema.yaml", "Generate json schema from schema.yaml - can be used to validate linkml syntax of schema.yaml"),
    ("gen-json-schema schema.web.yaml", "Generate json schema from schema.web.yaml - can be used to validate linkml syntax of schema.web.yaml")
]
help_content['./compare_java.py'] = [
    ("./compare_java.py curator-graph-core-classes <graph-core-curator clone dir>/src/main/java/org/reactome/server/graph/curator/",
        "Compare generated classes to those in graph-core-curator repo"),
    ("./compare_java.py graph-core-classes <graph-core clone dir>/src/main/java/org/reactome/server/graph/curator/",
        "Compare generated classes to those in graph-core repo")
]

help_content['./compare_sql.py'] = [
    ("./compare_sql.py <gk_central.create_schema.sql before change> <gk_central.create_schema.sql after change>",
     "Compare the DDL schema before and after the change, and 1. Save a file called gk_central.update.sql that contains the content of the SQL DDL/DataModel content update; and 2. Print out a summary of the difference to the user."
     )
]

def print_help(script_name):
    print("\nThe following functionality is available:")
    for key in help_content:
        if script_name is None or key == script_name:
            for tuple in help_content[key]:
                print("- " + tuple[0] + "\n\t" + tuple[1])

if __name__ == '__main__':
    print_help(None)