package org.reactome.server.graph.curator.domain.model;

import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public class PsiMod extends ExternalOntology {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @ReactomeProperty
    private String label;

    public PsiMod() {}

    public String getLabel() { return label; }

    public void setLabel(String label) {
        this.label = label;
    }

}
