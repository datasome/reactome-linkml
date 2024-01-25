#!/usr/bin/env python

import os
from re import search
from help import print_help
import pprint
import sys
import re

PK = "PRIMARY KEY"
K = "KEY"
F = "FIELD"

if len(sys.argv) < 3:
    script_name = sys.argv[0]
    print_help(script_name)
    sys.exit()
original_sql_dir = sys.argv[1]
generated_sql_dir = sys.argv[2]

def clean(label: str) -> str:
    return label.replace("`","").strip()

def get_sql_content(file_path: str) -> dict:
    ret = {}
    with open(file_path) as f:
        for line in f:
            if search('^(\/\*|DROP TABLE|\) ENGINE|$|\-\-)', line):
                # Exclude lines that are irrelevant for the comparison
                continue
            if line.startswith("CREATE TABLE"):
                table_name = clean(line.split(" ")[2])
                ret[table_name] = {}
            elif PK in line:
                if PK not in ret[table_name]:
                    ret[table_name][PK] = set()
                ret[table_name][PK].add(line.strip().replace(",",""))
            elif K in line:
                if K not in ret[table_name]:
                    ret[table_name][K] = set()
                ret[table_name][K].add(line.strip().replace(",",""))
            else:
                field_name = clean(line.strip().split(" ")[0])
                if F not in ret[table_name]:
                    ret[table_name][F] = {}
                ret[table_name][F][field_name] = line.strip().replace(",","")
    return ret

def compare_sql(first: dict, second: dict, first_desc: str, second_desc: str):
    for table in first:
        if table not in second:
            print("ERROR: {} table {} not in {}".format(first_desc, table, second_desc))
            continue
        if PK in first[table]:
            if PK not in second[table]:
                print("ERROR: {} table {} contains {} but {} table doesn't".format(first_desc, table, PK, second_desc))
            elif first[table][PK].symmetric_difference(second[table][PK]):
                print("ERROR: difference in {}'s between {} and {} table {}: {}"
                      .format(PK, first_desc, second_desc, table,
                              first[table][PK].symmetric_difference(second[table][PK])))
        if K in first[table]:
            if K not in second[table]:
                print("ERROR: {} table {} contains {} but {} table doesn't".format(first_desc, table, K, second_desc))
            elif first[table][K].symmetric_difference(second[table][K]):
                print("ERROR: difference in {}'s between {} and {} table {}: {}"
                      .format(K, first_desc, second_desc, table,
                              first[table][K].symmetric_difference(second[table][K])))
        if F in first[table]:
            if F not in second[table]:
                print("ERROR: {} table {} contains {} but {} table doesn't".format(first_desc, table, F, second_desc))
            for field in first[table][F]:
                if field not in second[table][F]:
                    print("ERROR: field {} in {} table {} not in {}"
                          .format(field, first_desc, table, second_desc))
                elif first[table][F][field] != second[table][F][field]:
                    print("ERROR: type of field {} \t{}\t\tin {} table {} different in {} \t{}"
                          .format(field, first[table][F][field], first_desc, table, second_desc, second[table][F][field]))
# Main program body
generated_sql_content = get_sql_content(generated_sql_dir)
original_sql_content = get_sql_content(original_sql_dir)

compare_sql(original_sql_content, generated_sql_content, "original", "generated")
compare_sql(generated_sql_content, original_sql_content, "generated", "original")

# pp = pprint.PrettyPrinter(indent=4)
# pp.pprint(generated_sql_content)
# pp.pprint(original_sql_content)