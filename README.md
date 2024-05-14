This project contains [LinkML representation of Reactome schema](https://github.com/reactome/reactome-schemas/blob/main/schema.yaml) and functionality to generate the following from it:
- [graph-core Java classes](https://github.com/reactome/graph-core/) 
- GraphQL representation
- JSON schema representation (e.g. in order to validate the syntax of schema.yaml)
- MySQL DDL and data update statements for Reactome MySQL gk_central instance

The virtual environment needed to run the above functionality is as follows:

    conda create -n linkml python=3.9
    conda activate linkml
    pip install linkml
    pip install pytz 
    pip install pyyaml
    # The following command displays the available options
    ./help.py

Please see the presentations under https://github.com/reactome/reactome-schemas/tree/main/doc for more information about the project.
