package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class Taxon extends DatabaseObject {

    @Deprecated
    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "crossReference")
    private List<DatabaseIdentifier> crossReference;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeProperty
    @ReactomeInstanceDefiningValue(category = "any")
    private List<String> name;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "superTaxon")
    private Taxon superTaxon;

    public Taxon() {}

    @Deprecated
    public List<DatabaseIdentifier> getCrossReference() { return crossReference; }

    @Deprecated
    public void setCrossReference(List<DatabaseIdentifier> crossReference) {
        this.crossReference = crossReference;
    }

    public List<String> getName() { return name; }

    public void setName(List<String> name) {
        this.name = name;
    }

    public Taxon getSuperTaxon() { return superTaxon; }

    public void setSuperTaxon(Taxon superTaxon) {
        this.superTaxon = superTaxon;
    }

}
