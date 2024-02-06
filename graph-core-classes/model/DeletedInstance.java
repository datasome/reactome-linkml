package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeAllowedClasses;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeRelationship;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
public class DeletedInstance extends MetaDatabaseObject {

    @ReactomeRelationship(originName = "class")
    private String clazz;

    @ReactomeRelationship(originName = "deletedInstanceDB_ID")
    private Integer deletedInstanceDbId;

    @ReactomeProperty(addedField = true)
    private String deletedStId;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "DeletedInstance";
    }

    @ReactomeProperty
    private String name;

    @Relationship(type = "species")
    @ReactomeAllowedClasses(allowed = {Taxon.class, Species.class})
    private List<Taxon> species;

    public DeletedInstance() {}

    public String getClazz() { return clazz; }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    public Integer getDeletedInstanceDbId() { return deletedInstanceDbId; }

    public void setDeletedInstanceDbId(Integer deletedInstanceDbId) {
        this.deletedInstanceDbId = deletedInstanceDbId;
    }

    public String getDeletedStId() { return deletedStId; }

    public void setDeletedStId(String deletedStId) {
        this.deletedStId = deletedStId;
    }

    public String getName() { return name; }

    public void setName(String name) {
        this.name = name;
    }

    @ReactomeAllowedClasses(allowed = {Taxon.class, Species.class})
    public List<Taxon> getSpecies() { return species; }

    public void setSpecies(List<Taxon> species) {
        if(species == null) return;

        if (species instanceof Taxon || species instanceof Species) {
            this.species = species;
        } else {
            throw new RuntimeException(species + " is none of: Taxon, Species");
        }
    }

}
