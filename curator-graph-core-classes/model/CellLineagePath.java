package org.reactome.server.graph.curator.domain.model;

import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
public class CellLineagePath extends Pathway {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "tissue")
    private Anatomy tissue;

    public CellLineagePath() {}

    public Anatomy getTissue() { return tissue; }

    public void setTissue(Anatomy tissue) {
        this.tissue = tissue;
    }

}
