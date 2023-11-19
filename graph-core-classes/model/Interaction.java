package org.reactome.server.graph.domain.model;

import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings({"unused", "WeakerAccess"})
public abstract class Interaction extends DatabaseObject {

    @ReactomeProperty
    private List<String> accession;

    @ReactomeProperty
    private String databaseName;

    @ReactomeProperty
    private List<String> pubmed;

    @Relationship(type = "referenceDatabase")
    private ReferenceDatabase referenceDatabase;

    @ReactomeProperty
    private Double score;

    @ReactomeProperty
    private String url;

    public Interaction() {}

    public List<String> getAccession() { return accession; }

    public void setAccession(List<String> accession) {
        this.accession = accession;
    }

    public String getDatabaseName() { return databaseName; }

    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }

    public List<String> getPubmed() { return pubmed; }

    public void setPubmed(List<String> pubmed) {
        this.pubmed = pubmed;
    }

    public ReferenceDatabase getReferenceDatabase() { return referenceDatabase; }

    public void setReferenceDatabase(ReferenceDatabase referenceDatabase) {
        this.referenceDatabase = referenceDatabase;
    }

    public Double getScore() { return score; }

    public void setScore(Double score) {
        this.score = score;
    }

    public String getUrl() { return url; }

    public void setUrl(String url) {
        this.url = url;
    }

}
