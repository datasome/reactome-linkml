package org.reactome.server.graph.domain.model;

import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class GO_Term extends DatabaseObject {

    @ReactomeProperty
    private String accession;

    private String databaseName;

    @ReactomeProperty
    private String definition;

    @ReactomeProperty
    private String name;

    @Relationship(type = "referenceDatabase")
    private ReferenceDatabase referenceDatabase;

    @ReactomeProperty(addedField = true)
    private String url;

    public GO_Term() {}

    public GO_Term(Long dbId) { super(dbId); }

    public String getAccession() { return accession; }

    public void setAccession(String accession) {
        this.accession = accession;
    }

    public String getDatabaseName() { return databaseName; }

    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }

    public String getDefinition() { return definition; }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    public String getName() { return name; }

    public void setName(String name) {
        this.name = name;
    }

    public ReferenceDatabase getReferenceDatabase() { return referenceDatabase; }

    public void setReferenceDatabase(ReferenceDatabase referenceDatabase) {
        this.referenceDatabase = referenceDatabase;
    }

    public String getUrl() { return url; }

    public void setUrl(String url) {
        this.url = url;
    }

}
