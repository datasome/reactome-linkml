package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
public class DrugActionType extends ReactionType {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "instanceOf")
    private List<DrugActionType> instanceOf;

    public DrugActionType() {}

    public List<DrugActionType> getInstanceOf() { return instanceOf; }

    public void setInstanceOf(List<DrugActionType> instanceOf) {
        this.instanceOf = instanceOf;
    }

}
