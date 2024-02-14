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
if len(sys.argv) > 3:
    output_dir = sys.argv[3]
if len(sys.argv) > 4 and sys.argv[4] == "generate_update_ddl":
    generate_update_ddl = True


# TODO: Document functions

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
        ret_table = ret_table.replace("@TABLE_CONTENT@", INDENT_1 + ",\n{}".format(INDENT_1).join(table_content_lines))
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
                        ddl_updates.append("ALTER TABLE {} MODIFY COLUMN {}".format(table, first[table][F][field]))
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
                    """
                    TODO: Assumption: it's the user's responsibility to make sure that an attribute
                    that is moved from a superclass to a subclass is moved (in linkml) to all subclasses of superclass
                    Here, we just process what we're given in linkml
                    """
                    processed_diff["moved_attributes"]["superclass2subclass"][attr] = ((t, "sv"), (base_table_t1, "mv"))
            if attr in raw_diff["created"]:
                for t1 in raw_diff["created"][attr]:
                    if class2superclass[t] == t1:
                        processed_diff["moved_attributes"]["class2superclass"][attr] = ((t, "sv"), (t1, "sv"))
                    elif class2superclass[t1] == t:
                        processed_diff["moved_attributes"]["superclass2subclass"][attr] = ((t, "sv"), (t1, "sv"))

    # Collect moved multi-value (MV) attributes
    for t in raw_diff["dropped"][""]:
        base_table_t = t.split("_")[0]
        if base_table_t in processed_diff["dropped_classes"]:
            continue
        attr = t.split("_")[-1]
        if attr in raw_diff["created"]:
            for t1 in raw_diff["created"][attr]:
                base_table_t1 = t1.split("_")[0]
                if base_table_t == base_table_t1:
                    processed_diff["moved_attributes"]["same_class"][attr] = ((base_table_t, "mv"), (base_table_t1, "sv"))
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

def is_instance_attr(attr: str, table: str, gen_class2instance_attributes: dict):
    if table in gen_class2instance_attributes and attr in gen_class2instance_attributes[table]:
        return True
    return False

def populate_data_transfer_statements(processed_diff: dict, ddl_populates: dict, gen_class2instance_attributes: dict):
    for key in processed_diff["moved_attributes"]:
        for attr in processed_diff["moved_attributes"][key]:
            tuple = processed_diff["moved_attributes"][key][attr]
            from_tuple = tuple[0]
            attr_from_type = from_tuple[1]
            from_table = from_tuple[0]
            to_tuple = tuple[1]
            attr_to_type = to_tuple[1]
            to_table = to_tuple[0]
            if attr_from_type == "sv" and attr_to_type == "mv":
                if is_instance_attr(attr, from_table, gen_class2instance_attributes):
                    # TODO: It may be that we don't want 'WHERE O.{} IS NOT NULL' below if we're transferring between subclass/superclass
                    ddl_populates.append(
                        "INSERT INTO {}_2_{} (DB_ID, {}, {}_class, {}_rank) SELECT DB_ID, {}, {}_class, 0 FROM {} O WHERE O.{} IS NOT NULL"
                            .format(to_table, attr, attr, attr, attr, attr, attr, from_table, attr))
                else:
                    ddl_populates.append(
                        "INSERT INTO {}_2_{} (DB_ID, {}, {}_rank) SELECT DB_ID, {}, 0 FROM {} O WHERE O.{} IS NOT NULL"
                            .format(to_table, attr, attr, attr, attr, from_table, attr))
            elif attr_from_type == "mv" and attr_to_type == "sv":
                if is_instance_attr(attr, from_table, gen_class2instance_attributes):
                    ddl_populates.append(
                        "UPDATE {} N, {}_2_{} O SET N.{}=O.{}, N.{}_class=O.{}_class WHERE N.DB_ID = O.DB_ID"
                        .format(to_table, from_table, attr, attr, attr, attr, attr))
                else:
                    ddl_populates.append(
                        "UPDATE {} N, {}_2_{} O SET N.{}=O.{} WHERE N.DB_ID = O.DB_ID"
                            .format(to_table, from_table, attr, attr, attr))
            elif attr_from_type == "sv" and attr_to_type == "sv":
                if from_table != to_table:
                    if is_instance_attr(attr, from_table, gen_class2instance_attributes):
                        ddl_populates.append(
                            "UPDATE {} N, {} O SET N.{}=O.{}, N.{}_class=O.{}_class WHERE N.DB_ID = O.DB_ID"
                                .format(to_table, from_table, attr, attr, attr, attr))
                    else:
                        ddl_populates.append(
                            "UPDATE {} N, {} O SET N.{}=O.{} WHERE N.DB_ID = O.DB_ID"
                                .format(to_table, from_table, attr, attr))
            elif attr_from_type == "mv" and attr_to_type == "mv":
                if from_table != to_table:
                    ddl_populates.append(
                        "INSERT INTO {}_2_{} (DB_ID, {}, {}_class, {}_rank) SELECT DB_ID, {}, {}_class, 0 FROM {}_2_{} O WHERE O.{} IS NOT NULL"
                            .format(to_table, attr, attr, attr, attr, attr, attr, from_table, attr, attr))
                else:
                    ddl_populates.append(
                        "INSERT INTO {}_2_{} (DB_ID, {}, {}_rank) SELECT DB_ID, {}, 0 FROM {}_2_{} O WHERE O.{} IS NOT NULL"
                            .format(to_table, attr, attr, attr, attr, from_table, attr, attr))

    for clazz in processed_diff["new_classes"]:
        subclasses = processed_diff["new_classes"][clazz]
        if subclasses:
            # If (a new) clazz is a superclass of some already existing tables/classes,
            # it needs to be populated with DB_IDs from all its subclasses
            ddl_populates.append("INSERT INTO {} (DB_ID) SELECT DB_ID FROM DatabaseObject WHERE _class IN ('{}')" \
                    .format(clazz, "','".join(subclasses)))

# Main program body
gen_sql_content, gen_class2superclass, gen_superclass2subclasses, gen_class2instance_attributes = get_sql_datamodel_content(gen_sql)
orig_sql_content, orig_class2superclass, orig_superclass2subclasses, orig_class2instance_attributes = get_sql_datamodel_content(orig_sql)

# pp = pprint.PrettyPrinter(indent=4)
# pp.pprint(gen_sql_content)
# pp.pprint(orig_sql_content)

# Prepare data structures for the SQL update content
ddl_creates, ddl_populates, ddl_updates, ddl_drops = ([], [], [], [])

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

# Populate data transfer statements into ddl_populates, based on processed_diff["moved_attributes"]
populate_data_transfer_statements(processed_diff, ddl_populates, gen_class2instance_attributes)

if generate_update_ddl:
    fp = open(os.path.join(output_dir, "gk_central.update.sql"), 'w')
    if ddl_creates:
        fp.write("\n\n-- Create new tables:\n")
        fp.write("\n".join(ddl_creates))
    if ddl_updates:
        fp.write("\n\n-- Add new columns or modify column definitions:\n")
        fp.write(";\n".join(ddl_updates) + ";")
    if ddl_populates:
        fp.write("\n\n-- Populate data:\n")
        fp.write(";\n".join(ddl_populates) + ";")
    if ddl_drops:
        fp.write("\n\n-- Drop columns/tables:\n")
        fp.write(";\n".join(ddl_drops) + ";")
    fp.close()
