package org.reactome.server.graph.curator.domain.model;

import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public class Species extends Taxon {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeProperty
    private String abbreviation;

    public Species() {}

    public String getAbbreviation() { return abbreviation; }

    public void setAbbreviation(String abbreviation) {
        this.abbreviation = abbreviation;
    }

}
