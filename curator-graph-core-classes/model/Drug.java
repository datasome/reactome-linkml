package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings({"unused", "WeakerAccess"})
public abstract class Drug extends PhysicalEntity {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "compartment")
    @ReactomeInstanceDefiningValue(category = "all")
    private List<Compartment> compartment;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "disease")
    private List<Disease> disease;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "referenceEntity")
    private ReferenceTherapeutic referenceEntity;

    public Drug() {}

    public List<Compartment> getCompartment() { return compartment; }

    public void setCompartment(List<Compartment> compartment) {
        this.compartment = compartment;
    }

    public List<Disease> getDisease() { return disease; }

    public void setDisease(List<Disease> disease) {
        this.disease = disease;
    }

    public ReferenceTherapeutic getReferenceEntity() { return referenceEntity; }

    public void setReferenceEntity(ReferenceTherapeutic referenceEntity) {
        this.referenceEntity = referenceEntity;
    }

}
