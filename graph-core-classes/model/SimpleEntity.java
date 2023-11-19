package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
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

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "A chemical species not encoded directly or indirectly in the genome, typically small molecules such as ATP or ethanol. The detailed structure of a simpleEntity is specified by linking it to details of the molecule in the ChEBI or KEGG databases via the referenceEntity slot. Use of KEGG is deprecated";
    }

    @Relationship(type = "referenceEntity")
    private ReferenceMolecule referenceEntity;

    @ReactomeProperty(addedField = true)
    private String referenceType;

    @Relationship(type = "species")
    private Species species;

    public SimpleEntity() {}

    public ReferenceMolecule getReferenceEntity() { return referenceEntity; }

    public void setReferenceEntity(ReferenceMolecule referenceEntity) {
        this.referenceEntity = referenceEntity;
    }

    public String getReferenceType() { return referenceType; }

    public void setReferenceType(String referenceType) {
        this.referenceType = referenceType;
    }

    public Species getSpecies() { return species; }

    public void setSpecies(Species species) {
        this.species = species;
    }

}
