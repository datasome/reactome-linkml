package org.reactome.server.graph.curator.domain.model;

import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
public class RegulationReference extends ControlReference {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "regulation")
    private Regulation regulation;

    public RegulationReference() {}

    public Regulation getRegulation() { return regulation; }

    public void setRegulation(Regulation regulation) {
        this.regulation = regulation;
    }

}
