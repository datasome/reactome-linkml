package org.reactome.server.graph.curator.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeSchemaIgnore;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class OtherEntity extends PhysicalEntity {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "compartment")
    @ReactomeInstanceDefiningValue(category = "all")
    private List<Compartment> compartment;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "Entities that we are unable or unwilling to describe in chemical detail and cannot be put in any other class. Can be used to represent complex structures in the cell that take part in a reaction but which we cannot or do not want to define molecularly, e.g. cell membrane, Holliday structure";
    }

    public OtherEntity() {}

    public List<Compartment> getCompartment() { return compartment; }

    public void setCompartment(List<Compartment> compartment) {
        this.compartment = compartment;
    }

}
