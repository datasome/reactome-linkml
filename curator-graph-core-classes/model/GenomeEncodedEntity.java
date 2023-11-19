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
public class GenomeEncodedEntity extends PhysicalEntity {

    @ReactomeSchemaIgnore
    @Override
    public String getClassName() {
        return "Genes and Transcripts";
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "compartment")
    @ReactomeInstanceDefiningValue(category = "all")
    private List<Compartment> compartment;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "A peptide or polynucleotide whose sequence is unknown and thus cannot be linked to external sequence databases or used for orthology inference";
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "species")
    @ReactomeInstanceDefiningValue(category = "all")
    private Taxon species;

    public GenomeEncodedEntity() {}

    public GenomeEncodedEntity(Long dbId) { super(dbId); }

    public List<Compartment> getCompartment() { return compartment; }

    public void setCompartment(List<Compartment> compartment) {
        this.compartment = compartment;
    }

    public Taxon getSpecies() { return species; }

    public void setSpecies(Taxon species) {
        this.species = species;
    }

}
