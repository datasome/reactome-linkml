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
DATA_MODEL_INSERT_REGEX="^INSERT INTO `DataModel` VALUES "

INDENT_0 = ""
INDENT_1 = INDENT_0 + "    "

pp = pprint.PrettyPrinter(indent=4)

if len(sys.argv) < 3:
    script_name = sys.argv[0]
    print_help(script_name)
    sys.exit()
orig_sql = sys.argv[1]
gen_sql = sys.argv[2]
generate_update_ddl = False
if len(sys.argv) == 4 and sys.argv[3] == "generate_update_ddl":
    generate_update_ddl = True

def clean(label: str) -> str:
    return label.replace("`","").strip()


def get_sql_datamodel_content(file_path: str) -> (dict, dict, dict):
    sql_content = {}
    class2superclass = {}
    superclass2subclasses = {}
    class2instance_attributes = {}
    with open(file_path) as f:
        for line in f:
            if search(DATA_MODEL_INSERT_REGEX, line):
                line = re.sub(r"" + DATA_MODEL_INSERT_REGEX,"", line)
                line = re.sub(r"^\(|\);$", "", line)
                data_model_lines = sorted(line.split("),("))
                for line in data_model_lines:
                    aux = line.split(",")
                    thing = aux[0].replace("'", "")
                    thing_class = aux[1].replace("'","")
                    property_name = aux[2].replace("'", "")
                    property_value = aux[3].replace("'","")
                    if thing_class == "SchemaClass":
                        if property_name == "super_classes":
                            clazz = aux[0].replace("'","")
                            superclass = property_value
                            class2superclass[clazz] = superclass
                            if superclass not in superclass2subclasses:
                                superclass2subclasses[superclass] = set()
                            superclass2subclasses[superclass].add(clazz)
                    elif thing_class == "SchemaClassAttribute":
                        if ":" in thing and property_name == "type" and property_value == "db_instance_type":
                            clazz = thing.split(":")[0]
                            attr = thing.split(":")[1]
                            if clazz not in class2instance_attributes:
                                class2instance_attributes[clazz] = set()
                            class2instance_attributes[clazz].add(attr)
                continue
            elif search('^(\/\*|DROP TABLE|\) ENGINE|$|\-\-)', line):
                # Exclude lines that are irrelevant for the comparison
                continue
            if line.startswith("CREATE TABLE"):
                table_name = clean(line.split(" ")[2])
                sql_content[table_name] = {}
            elif PK in line:
                if PK not in sql_content[table_name]:
                    sql_content[table_name][PK] = set()
                sql_content[table_name][PK].add(line.strip().replace(",",""))
            elif K in line:
                if K not in sql_content[table_name]:
                    sql_content[table_name][K] = set()
                sql_content[table_name][K].add(line.strip().replace(",",""))
            else:
                field_name = clean(line.strip().split(" ")[0])
                if F not in sql_content[table_name]:
                    sql_content[table_name][F] = {}
                sql_content[table_name][F][field_name] = line.strip().replace(",","")
    return (sql_content, class2superclass, superclass2subclasses, class2instance_attributes)

def get_table_ddl(clazz: str, table_dict: dict):
    fh = os.path.join("mysql_templates", "gk_table.sql")
    with open(fh, 'r') as mysql_table_template:
        ret_table = mysql_table_template.read()
        ret_table = ret_table.replace("@TABLE_NAME@", clazz)
        if clazz == "DatabaseObject":
            auto_increment = " AUTO_INCREMENT=9859833"
        else:
            auto_increment = ""
        ret_table = ret_table.replace("@AUTO_INCREMENT@", auto_increment)
        table_content_lines = []
        if F in table_dict:
            for field in list(table_dict[F]):
                table_content_lines.append(table_dict[F][field])
        for key in [K, PK]:
            if key in table_dict:
                table_content_lines += list(table_dict[key])
        ret_table = ret_table.replace("@TABLE_CONTENT@", INDENT_1 + ";\n{}".format(INDENT_1).join(table_content_lines))
    return "\n{}\n".format(ret_table)

def compare_sql(first: dict, second: dict, first_desc: str,
                ddl_creates: list, ddl_updates: list, ddl_drops: list,
                ddl_update_actions: dict, raw_diff: dict) -> dict:
    for table in first:
        if table not in second:
            if first_desc == "original":
                raw_diff["dropped"][""].add(table)
                ddl_drops.append("DROP TABLE {}".format(table))
                ddl_update_actions["dropped_tables"].add(table)
            else:
                # first_desc == "generated"
                raw_diff["created"][""].add(table)
                ddl_creates.append(get_table_ddl(table, first[table]))
                ddl_update_actions["new_tables"].add(table)
            continue
        if PK in first[table]:
            if PK not in second[table]:
                if first_desc == "generated":
                    if PK not in raw_diff["missing"]:
                        raw_diff["missing"][PK] = set()
                    raw_diff["missing"][PK].add(table)
            elif first[table][PK].symmetric_difference(second[table][PK]):
                if first_desc == "generated":
                    if PK not in raw_diff["changed"]:
                        raw_diff["changed"][PK] = set()
                    raw_diff["changed"][PK].add(table)
        if K in first[table]:
            if K not in second[table]:
                if first_desc == "generated":
                    if K not in raw_diff["missing"]:
                        raw_diff["missing"][K] = set()
                    raw_diff["missing"][K].add(table)
                if first_desc == "generated":
                    if K not in raw_diff["changed"]:
                        raw_diff["changed"][K] = set()
                    raw_diff["changed"][K].add(table)
        if F in first[table]:
            if F not in second[table]:
                # first[table] contains some columns, but second[table] doesn't at all
                if first_desc == "generated":
                    raw_diff["missing"][F].add(table)
            for field in first[table][F]:
                if field not in second[table][F]:
                    if first_desc == "generated":
                        if field not in raw_diff["created"]:
                            raw_diff["created"][field] = set()
                        raw_diff["created"][field].add(table)
                        ddl_updates.append("ALTER TABLE {} ADD COLUMN {}".format(table, first[table][F][field]))
                        if not field.endswith("_class"):
                            ddl_updates.append("ALTER TABLE {} ADD KEY {}".format(table, field))
                        if table not in ddl_update_actions["new_attributes"]:
                            ddl_update_actions["new_attributes"][table] = set([])
                        ddl_update_actions["new_attributes"][table].add(field)
                    else:
                        # first_desc == "original":
                        if field not in raw_diff["dropped"]:
                            raw_diff["dropped"][field] = set()
                        raw_diff["dropped"][field].add(table)
                        if not field.endswith("_class"):
                            ddl_updates.append("ALTER TABLE {} DROP KEY {}".format(table, field))
                        ddl_drops.append("ALTER TABLE {} DROP COLUMN {}".format(table, field))
                        if table not in ddl_update_actions["dropped_attributes"]:
                            ddl_update_actions["dropped_attributes"][table] = set([])
                        ddl_update_actions["dropped_attributes"][table].add(field)

                elif first[table][F][field] != second[table][F][field]:
                    if field not in raw_diff["changed"]:
                        raw_diff["changed"][field] = set()
                    raw_diff["changed"][field].add(table)

                    if first_desc == "generated":
                        if not field.endswith("_class"):
                            ddl_updates.append("ALTER TABLE {} DROP KEY {}".format(table, field))
                        ddl_updates.append("ALTER TABLE {} MODIFY COLUMN {} {}".format(table, field, first[table][F][field]))
                        if not field.endswith("_class"):
                            ddl_updates.append("ALTER TABLE {} ADD KEY {}".format(table, field))
    return raw_diff

def contains_multivalued_table_for_attr(tables: list, attr: str) -> bool:
    ret = False
    for table in tables:
        if table.endswith("_2_{}".format(attr)):
            ret = True
            break
    return ret

def collect_attributes(raw_diff_key: str, opposite_raw_diff_key: str,
                       raw_diff: str, processed_diff_key: str, processed_diff: dict):
    # Process single-valued attributes
    for attr in raw_diff[raw_diff_key]:
        if attr == "" or attr.endswith("_class"):
            continue
        if attr not in raw_diff[opposite_raw_diff_key] and \
            ("" not in raw_diff[opposite_raw_diff_key] or \
             not contains_multivalued_table_for_attr(raw_diff[opposite_raw_diff_key][""], attr)):
            # If attr name doesn't end with "_class", attr itself was not dropped and
            # a table *_2_attr was not dropped, report it as new attribute for each table it was created in
            for table in raw_diff[raw_diff_key][attr]:
                if table not in processed_diff[processed_diff_key]:
                    processed_diff[processed_diff_key][table] = set()
                processed_diff[processed_diff_key][table].add(attr)

    # Process multi-valued attributes
    for t in raw_diff[raw_diff_key][""]:
        if "_2_" in t:
            table = t.split("_")[0]
            attr = t.split("_")[-1]
            if attr not in raw_diff[opposite_raw_diff_key] and \
                ("" not in raw_diff[opposite_raw_diff_key] or \
                not contains_multivalued_table_for_attr(raw_diff[opposite_raw_diff_key][""], attr)):
                if table not in processed_diff[processed_diff_key]:
                    processed_diff[processed_diff_key][table] = set()
                processed_diff[processed_diff_key][table].add(attr)


def process_raw_diff(raw_diff: dict, superclass2subclasses: dict, class2superclass: dict) -> dict:
    # raw_diff = { "created": {}, "dropped": {}, "changed": {}, "missing": {}}
    processed_diff = { "new_classes": {}, "dropped_classes": [],
                       "new_attributes": {}, "dropped_attributes": {},
                       "moved_attributes" : {"same_class": {}, "class2superclass": {}, "superclass2subclass": {}}
                     }
    # Collected new classes
    for table in raw_diff["created"][""]:
        if "_2_" not in table:
            if table not in superclass2subclasses:
                subclasses = []
            else:
                subclasses = list(superclass2subclasses[table])
            processed_diff["new_classes"][table] = subclasses

    # Collect dropped classes
    for table in raw_diff["dropped"][""]:
        if "_2_" not in table:
            processed_diff["dropped_classes"].append(table)

    # Collect new attributes
    collect_attributes("created", "dropped", raw_diff, "new_attributes", processed_diff)
    # Collect dropped attributes
    collect_attributes("dropped", "created", raw_diff, "dropped_attributes", processed_diff)

    # Collect moved single-value (SV) attributes
    for attr in raw_diff["dropped"]:
        if attr == "" or attr.endswith("_class"):
            continue
        for t in raw_diff["dropped"][attr]:
            if t in processed_diff["dropped_classes"]:
                continue
            for t1 in raw_diff["created"][""]:
                base_table_t1 = t1.split("_")[0]
                if t1 == "{}_2_{}".format(t, attr):
                    processed_diff["moved_attributes"]["same_class"][attr] = ((t, "sv"), (t, "mv"))
                elif class2superclass[t] == base_table_t1:
                    processed_diff["moved_attributes"]["class2superclass"][attr] = ((t, "sv"), (base_table_t1, "mv"))
                elif class2superclass[base_table_t1] == t:
                    # TODO: Assumption: it's the user's responsibility to make sure that an attribute
                    # that is moved from a superclass to a subclass is moved (in linkml) to all subclasses of superclass
                    # Here, we just process what we're given in linkml
                    processed_diff["moved_attributes"]["superclass2subclass"][attr] = ((t, "sv"), (base_table_t1, "mv"))
            if attr in raw_diff["created"]:
                for t1 in raw_diff["created"][attr]:
                    base_table_t1 = t1.split("_")[0]
                    attr1 = t1.split("_")[-1]
                    if attr == attr1:
                        if class2superclass[t] == base_table_t1:
                            processed_diff["moved_attributes"]["class2superclass"][attr] = ((t, "sv"), (base_table_t1, "sv"))
                        elif class2superclass[base_table_t1] == t:
                            processed_diff["moved_attributes"]["superclass2subclass"][attr] = ((t, "sv"), (base_table_t1, "sv"))

    # Collect moved multi-value (MV) attributes
    for t in raw_diff["dropped"][""]:
        base_table_t = t.split("_")[0]
        if base_table_t in processed_diff["dropped_classes"]:
            continue
        attr = t.split("_")[-1]
        if attr in raw_diff["created"]:
            for t1 in raw_diff["created"][attr]:
                # TODO: Move the below into method - c.f. above
                base_table_t1 = t1.split("_")[0]
                if base_table_t == base_table_t1:
                    processed_diff["moved_attributes"]["same_class"][attr] = ((t, "mv"), (t, "sv"))
                elif class2superclass[base_table_t] == base_table_t1:
                    processed_diff["moved_attributes"]["class2superclass"][attr] = ((base_table_t, "mv"), (base_table_t1, "sv"))
                elif class2superclass[base_table_t1] == base_table_t:
                    processed_diff["moved_attributes"]["superclass2subclass"][attr] = ((base_table_t, "mv"), (base_table_t1, "sv"))
        for t1 in raw_diff["created"][""]:
            base_table_t1 = t1.split("_")[0]
            attr1 = t1.split("_")[-1]
            if attr == attr1:
                if class2superclass[base_table_t] == base_table_t1:
                    processed_diff["moved_attributes"]["class2superclass"][attr] = ((base_table_t, "mv"), (base_table_t1, "mv"))
                elif class2superclass[base_table_t1] == base_table_t:
                    processed_diff["moved_attributes"]["superclass2subclass"][attr] = ((base_table_t, "mv"), (base_table_t1, "mv"))

    return processed_diff

# Main program body
gen_sql_content, gen_class2superclass, gen_superclass2subclasses, gen_class2instance_attributes = get_sql_datamodel_content(gen_sql)
orig_sql_content, orig_class2superclass, orig_superclass2subclasses, orig_class2instance_attributes = get_sql_datamodel_content(orig_sql)

ddl_creates = []
ddl_populates = []
ddl_updates = []
ddl_drops = []

# Generate raw diff output
ddl_update_actions = { "dropped_tables" : set([]), "new_tables" : set([]), "new_attributes" : {}, "dropped_attributes" : {} }
raw_diff = {"created": {"": set()}, "dropped": {"": set()}, "changed": {"": set()}, "missing": {"": set()}}
compare_sql(orig_sql_content, gen_sql_content, "original",
            ddl_creates, ddl_updates, ddl_drops, ddl_update_actions, raw_diff)
compare_sql(gen_sql_content, orig_sql_content, "generated",
            ddl_creates, ddl_updates, ddl_drops, ddl_update_actions, raw_diff)
print("******** RAW DIFF: *********\n")
pp.pprint(raw_diff)

# Generate processed diff output
processed_diff = process_raw_diff(raw_diff, gen_superclass2subclasses, gen_class2superclass)
print("\n******** PROCESSED DIFF: *********\n")
pp.pprint(processed_diff)

# pp = pprint.PrettyPrinter(indent=4)
# pp.pprint(gen_sql_content)
# pp.pprint(orig_sql_content)

# for table in ddl_update_actions["dropped_tables"]:
#     new_attrs = ddl_update_actions["new_attributes"]
#     if "_2_" in table:
#         # Multi-valued attribute may have been dropped altogether or changed to single-valued
#         base_table = table.split("_")[0]
#         attr = table.split("_")[-1]
#         if base_table in new_attrs and attr in new_attrs[base_table]:
#                 # Multi-valued attribute has indeed been changed to single-valued
#                 if "{}_class".format(attr) in new_attrs[base_table]:
#                     # Instance: Multi-valued -> single-valued
#                     ddl_populates.append(
#                         "UPDATE {} N, {} O SET N.{}=O.{}, N.{}_class=O.{}_class WHERE N.DB_ID = O.DB_ID"
#                         .format(base_table, table, attr, attr, attr, attr))
#                 else:
#                     # Primitive: Multi-valued -> single-valued
#                     ddl_populates.append(
#                         "UPDATE {} N, {} O SET N.{}=O.{} WHERE N.DB_ID = O.DB_ID"
#                             .format(base_table, table, attr, attr))
#
#         else:
#             # Check if attr is in new_attributes of either superclass or subclass of base_table
#             # If so, this attribute has been moved from superclass to all its subclasses, or from a subclass to superclass,
#             # possibly with an additional change from single-valued to multi-valued ot vice versa
#             # &&&&
#             found = False
#             for table1 in ddl_update_actions["new_tables"]:
#                 if table1 != table and "_2_" in table1:
#                     base_table1 = table1.split("_")[0]
#                     attr1 = table1.split("_")[-1]
#                     if attr1 == attr:
#                         if base_table in gen_class2superclass and base_table1 == gen_class2superclass[base_table]:
#                             # Multi-valued attr was moved from subclass: base_table to its superclass: base_table1"
#                             if attr in gen_class2instance_attributes[base_table1]:
#                                 print("*Multi-valued Instance attr: {} was moved from subclass: {} to its superclass: {}".format(attr, base_table, base_table1))
#                             else:
#                                 print("**Multi-valued primitive attr: {} was moved from subclass: {} to its superclass: {}".format(attr, base_table, base_table1))
#                             # &&&&
#                             break
#                             # if base_table1 in new_attrs and attr in new_attrs[base_table1]:
#                             #         print("*** Multi-valued attr was moved from subclass: base_table to its superclass: base_table1")
#                             #         # TODO: TBC .. and therefore needs/has to be moved to all subclass tables?
#                             #         found = True
#                             #         break
#                         elif base_table1 in gen_class2superclass and base_table == gen_class2superclass[base_table1]:
#                             # Multi-valued attr was moved from superclass: base_table to its subclass: base_table1"
#                             if attr in gen_class2instance_attributes[base_table1]:
#                                 print("-Multi-valued Instance attr: {} was moved from subclass: {} to its superclass: {}".format(attr, base_table, base_table1))
#                             else:
#                                 print("--Multi-valued primitive attr: {} was moved from subclass: {} to its superclass: {}".format(attr, base_table, base_table1))
#                             # &&&&
#                             break
#                             # if base_table1 in new_attrs and attr in new_attrs[base_table1]:
#                             #         print("*** Multi-valued attr was moved from superclass: base_table to its subclass: base_table1")
#                             #         # TODO: TBC .. and therefore needs/has to be moved from all subclass tables of base_table?
#                             #         found = True
#                             #         break
#             if not found:
#                 # TODO: Check attr is in new_attributes for base_table1 that is either a superclass or a subclass of base_table
#                 if base_table in gen_class2superclass:
#                     base_table1 = gen_class2superclass[base_table]
#                     if base_table1 in new_attrs and attr in new_attrs[base_table1]:
#                         if attr in gen_class2instance_attributes[base_table1]:
#                             print("&Multi-valued Instance {} was moved from subclass: {} to a single-value attr in its superclass: {}".format(attr, base_table, base_table1))
#                         else:
#                             print("&Multi-valued Primitive {} was moved from subclass: {} to a single-value attr in its superclass: {}".format(attr, base_table, base_table1))
#                         found = True
#                 else:
#                     for base_table1 in gen_class2superclass:
#                         if base_table == gen_class2superclass[base_table1]:
#                             if base_table1 in new_attrs and attr in new_attrs[base_table1]:
#                                 if attr in gen_class2instance_attributes[base_table1]:
#                                     print("&&Multi-valued Instance {} was moved from superclass: {} to a single-value attr in its subclass: {}".format(attr, base_table, base_table1))
#                                 else:
#                                     print(
#                                         "&&Multi-valued Primitive {} was moved from superclass: {} to a single-value attr in its subclass: {}".format(
#                                             attr, base_table, base_table1))
#
#                                 found = True
#                                 break
#
#
# for table in ddl_update_actions["new_tables"]:
#     dropped_attrs = ddl_update_actions["dropped_attributes"]
#     if "_2_" in table:
#         # A new multi-valued attribute was added, or
#         # A single-valued attribute was converted to multi-valued, or
#         # A single/multivalued instance/primitive attribute was moved to all its subclasses or its superclass
#         base_table = table.split("_")[0]
#         attr = table.split("_")[-1]
#         if base_table in dropped_attrs and attr in dropped_attrs[base_table]:
#                 # A single-valued attribute has indeed been converted to multi-valued
#                 if "{}_class".format(attr) in dropped_attrs[base_table]:
#                     # Instance: Single-valued -> multi-valued
#                     ddl_populates.append(
#                         "INSERT INTO {} (DB_ID, {}, {}_class, {}_rank) SELECT DB_ID, {}, {}_class, 0 FROM {} O WHERE O.{} IS NOT NULL"
#                             .format(table, attr, attr, attr, attr, attr, base_table, attr))
#                 else:
#                     # Primitive: Single-valued -> multi-valued
#                     ddl_populates.append(
#                         "INSERT INTO {} (DB_ID, {}, {}_rank) SELECT DB_ID, {}, 0 FROM {} O WHERE O.{} IS NOT NULL"
#                             .format(table, attr, attr, attr, base_table, attr))
#
#         else:
#             # Check if attr is in dropped_attributes of either superclass or subclass of base_table
#             # If so, this attribute has been moved from superclass to all its subclasses, or from a subclass to superclass,
#             # possibly with an additional change from single-valued to multi-valued ot vice versa
#             # &&&&
#             found = False
#             for table1 in ddl_update_actions["dropped_tables"]:
#                 if table1 != table and "_2_" in table1:
#                     base_table1 = table1.split("_")[0]
#                     attr1 = table1.split("_")[-1]
#                     if attr1 == attr:
#                         if base_table in gen_class2superclass and base_table1 == gen_class2superclass[base_table]:
#                             if base_table1 in dropped_attrs and attr in dropped_attrs[base_table1]:
#                                     # Multi-valued attr was moved from superclass: base_table1 to its subclass: base_table
#                                     # TODO: TBC .. and therefore needs/has to be moved to all subclass tables?
#                                     found = True
#                                     break
#                         elif base_table1 in gen_class2superclass and base_table == gen_class2superclass[base_table1]:
#                             if base_table1 in dropped_attrs and attr in dropped_attrs[base_table1]:
#                                     # Multi-valued attr was moved from subclass: base_table1 to its superclass: base_table
#                                     # TODO: TBC .. and therefore needs/has to be moved from all subclass tables pf base_table?
#                                     found = True
#                                     break
#             if not found:
#                 # TODO: Check attr is in dropped_attributes for base_table1 that is either a superclass or a subclass of base_table
#                 if base_table in gen_class2superclass:
#                     base_table1 = gen_class2superclass[base_table]
#                     if base_table1 in dropped_attrs and attr in dropped_attrs[base_table1]:
#                         # Single-valued attr was moved from subclass: base_table to a multi-valued attr in its superclass: base_table1
#                         found = True
#                 else:
#                     for base_table1 in gen_class2superclass:
#                         if base_table == gen_class2superclass[base_table1]:
#                             if base_table1 in dropped_attrs and attr in dropped_attrs[base_table1]:
#                                 # Single-valued attr was moved from superclass: base_table to a multi-valued attr in its subclass: base_table1
#                                 found = True
#                                 break
#
#                 # TODO: Check attr is in dropped_attributes for base_table1 that is either a superclass or a subclass of base_table
#                 None
#     else:
#         # A new table has been created.
#         # If it is a superclass of some already existing tables/classes,
#         # it needs to be populated with DB_IDs from all its subclasses:
#         # 1. Find all subclasses of table
#         for clazz in gen_class2superclass:
#             subclasses = []
#             if table == gen_class2superclass[clazz]:
#                 subclasses.append[clazz]
#         if subclasses:
#             # 2. Now insert into table DB_IDs from all existing tables corresponding to clazzes in subclasses
#             ddl_populates.append("INSERT INTO {} (DB_ID) SELECT DB_ID FROM DatabaseObject WHERE _class IN ('{}');"\
#                                  .format(table, "','".join(subclasses)))

# TODO: Save the following to gk_central.update.sql file
print("\n\nddl_update_content:")
if ddl_creates:
    print("\n--- Create new tables:")
    print("\n".join(ddl_creates))
if ddl_updates:
    print("--- Add new columns or modify column definitions:\n")
    print(";\n".join(ddl_updates) + ";")
if ddl_populates:
    print("\n--- Populate data:\n")
    print(";\n".join(ddl_populates) + ";")
if ddl_drops:
    print("\n--- Drop columns/tables:\n")
    print(";\n".join(ddl_drops) + ";")
