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
public class SimpleEntity extends PhysicalEntity {

    @ReactomeSchemaIgnore
    @Override
    public String getClassName() {
        return "Chemical Compound";
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "compartment")
    @ReactomeInstanceDefiningValue(category = "all")
    private List<Compartment> compartment;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "A chemical species not encoded directly or indirectly in the genome, typically small molecules such as ATP or ethanol. The detailed structure of a simpleEntity is specified by linking it to details of the molecule in the ChEBI or KEGG databases via the referenceEntity slot. Use of KEGG is deprecated";
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "referenceEntity")
    private ReferenceMolecule referenceEntity;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "species")
    @ReactomeInstanceDefiningValue(category = "all")
    private Species species;

    public SimpleEntity() {}

    public List<Compartment> getCompartment() { return compartment; }

    public void setCompartment(List<Compartment> compartment) {
        this.compartment = compartment;
    }

    public ReferenceMolecule getReferenceEntity() { return referenceEntity; }

    public void setReferenceEntity(ReferenceMolecule referenceEntity) {
        this.referenceEntity = referenceEntity;
    }

    public Species getSpecies() { return species; }

    public void setSpecies(Species species) {
        this.species = species;
    }

}
