package org.reactome.server.graph.domain.model;

import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public class ReferenceGroup extends ReferenceEntity {

    @ReactomeProperty
    private String formula;

    public ReferenceGroup() {}

    public String getFormula() { return formula; }

    public void setFormula(String formula) {
        this.formula = formula;
    }

}
