package org.reactome.server.graph.domain.model;

import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class ReferenceIsoform extends ReferenceGeneProduct {

    @Relationship(type = "isoformParent")
    private List<ReferenceGeneProduct> isoformParent;

    @ReactomeProperty
    private String variantIdentifier;

    public ReferenceIsoform() {}

    public List<ReferenceGeneProduct> getIsoformParent() { return isoformParent; }

    public void setIsoformParent(List<ReferenceGeneProduct> isoformParent) {
        this.isoformParent = isoformParent;
    }

    public String getVariantIdentifier() { return variantIdentifier; }

    public void setVariantIdentifier(String variantIdentifier) {
        this.variantIdentifier = variantIdentifier;
    }

}
