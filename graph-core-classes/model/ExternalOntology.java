package org.reactome.server.graph.domain.model;

import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class ExternalOntology extends DatabaseObject {

    @ReactomeProperty
    private String databaseName;

    @ReactomeProperty
    private String definition;

    @ReactomeProperty
    private String identifier;

    @Relationship(type = "instanceOf")
    private List<ExternalOntology> instanceOf;

    @ReactomeProperty
    private List<String> name;

    @Relationship(type = "referenceDatabase")
    private ReferenceDatabase referenceDatabase;

    @ReactomeProperty
    private List<String> synonym;

    public ExternalOntology() {}

    public String getDatabaseName() { return databaseName; }

    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }

    public String getDefinition() { return definition; }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    public String getIdentifier() { return identifier; }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public List<ExternalOntology> getInstanceOf() { return instanceOf; }

    public void setInstanceOf(List<ExternalOntology> instanceOf) {
        this.instanceOf = instanceOf;
    }

    public List<String> getName() { return name; }

    public void setName(List<String> name) {
        this.name = name;
    }

    public ReferenceDatabase getReferenceDatabase() { return referenceDatabase; }

    public void setReferenceDatabase(ReferenceDatabase referenceDatabase) {
        this.referenceDatabase = referenceDatabase;
    }

    public List<String> getSynonym() { return synonym; }

    public void setSynonym(List<String> synonym) {
        this.synonym = synonym;
    }

}
