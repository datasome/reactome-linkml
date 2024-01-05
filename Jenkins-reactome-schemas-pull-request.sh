#!/bin/sh
docker build --tag reactome-schemas-pull-request .
# Validate syntax of curator schema
docker run reactome-schemas-pull-request:latest sh -c 'gen-json-schema schema.yaml 1> /dev/null 2> err.log; if [ "$?" -ne "0" ]; then echo "schema.yaml syntax is not valid:"`cat err.log`; exit 1; fi'
# Generate web schema and then validate its syntax
docker run reactome-schemas-pull-request:latest sh -c './generate.py yaml schema.web.diff.yaml; if [ "$?" -ne "0" ]; then exit 1; fi; gen-json-schema schema.web.yaml 1> /dev/null 2> err.log; if [ "$?" -ne "0" ]; then echo "schema.web.yaml syntax is not valid: "`cat err.log`; exit 1; fi'
