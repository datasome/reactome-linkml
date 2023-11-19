package org.reactome.server.graph.domain.model;

import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public class PsiMod extends ExternalOntology {

    @ReactomeProperty
    private String label;

    public PsiMod() {}

    public String getLabel() { return label; }

    public void setLabel(String label) {
        this.label = label;
    }

}
