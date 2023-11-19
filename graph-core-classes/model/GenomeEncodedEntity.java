package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
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

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "A peptide or polynucleotide whose sequence is unknown and thus cannot be linked to external sequence databases or used for orthology inference";
    }

    @Relationship(type = "species")
    private Taxon species;

    public GenomeEncodedEntity() {}

    public GenomeEncodedEntity(Long dbId) { super(dbId); }

    public Taxon getSpecies() { return species; }

    public void setSpecies(Taxon species) {
        this.species = species;
    }

}
