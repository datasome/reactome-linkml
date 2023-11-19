package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
public class StableIdentifier extends DatabaseObject {

    @Relationship(type = "history")
    private List<StableIdentifierHistory> history;

    @ReactomeProperty
    private String identifier;

    @ReactomeProperty
    private String identifierVersion;

    @ReactomeProperty
    private String oldIdentifier;

    @ReactomeProperty
    private String oldIdentifierVersion;

    @ReactomeProperty
    private Boolean released;

    public StableIdentifier() {}

    public List<StableIdentifierHistory> getHistory() { return history; }

    public void setHistory(List<StableIdentifierHistory> history) {
        this.history = history;
    }

    public String getIdentifier() { return identifier; }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public String getIdentifierVersion() { return identifierVersion; }

    public void setIdentifierVersion(String identifierVersion) {
        this.identifierVersion = identifierVersion;
    }

    public String getOldIdentifier() { return oldIdentifier; }

    public void setOldIdentifier(String oldIdentifier) {
        this.oldIdentifier = oldIdentifier;
    }

    public String getOldIdentifierVersion() { return oldIdentifierVersion; }

    public void setOldIdentifierVersion(String oldIdentifierVersion) {
        this.oldIdentifierVersion = oldIdentifierVersion;
    }

    public Boolean getReleased() { return released; }

    public void setReleased(Boolean released) {
        this.released = released;
    }

}
