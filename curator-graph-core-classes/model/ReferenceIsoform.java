package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class ReferenceIsoform extends ReferenceGeneProduct {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "isoformParent")
    private List<ReferenceGeneProduct> isoformParent;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
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
