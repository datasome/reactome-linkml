package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeRelationship;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class ReferenceEntity extends DatabaseObject {

    @Relationship(type = "crossReference")
    private List<DatabaseIdentifier> crossReference;

    private String databaseName;

    @ReactomeProperty
    private String identifier;

    @ReactomeProperty
    private List<String> name;

    @ReactomeProperty
    private List<String> otherIdentifier;

    @Relationship(type = "referenceEntity")
    @ReactomeRelationship(addedField = true)
    private List<PhysicalEntity> physicalEntity;

    @Relationship(type = "referenceDatabase")
    private ReferenceDatabase referenceDatabase;

    @ReactomeProperty(addedField = true)
    private String url;

    public ReferenceEntity() {}

    public List<DatabaseIdentifier> getCrossReference() { return crossReference; }

    public void setCrossReference(List<DatabaseIdentifier> crossReference) {
        this.crossReference = crossReference;
    }

    public String getDatabaseName() { return databaseName; }

    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }

    public String getIdentifier() { return identifier; }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public List<String> getName() { return name; }

    public void setName(List<String> name) {
        this.name = name;
    }

    public List<String> getOtherIdentifier() { return otherIdentifier; }

    public void setOtherIdentifier(List<String> otherIdentifier) {
        this.otherIdentifier = otherIdentifier;
    }

    public List<PhysicalEntity> getPhysicalEntity() { return physicalEntity; }

    public void setPhysicalEntity(List<PhysicalEntity> physicalEntity) {
        this.physicalEntity = physicalEntity;
    }

    public ReferenceDatabase getReferenceDatabase() { return referenceDatabase; }

    public void setReferenceDatabase(ReferenceDatabase referenceDatabase) {
        this.referenceDatabase = referenceDatabase;
    }

    public String getUrl() { return url; }

    public void setUrl(String url) {
        this.url = url;
    }

    @ReactomeSchemaIgnore
    @JsonIgnore
    public String getSimplifiedDatabaseName() {
        return databaseName.replace(" ", "-");
    }


}
