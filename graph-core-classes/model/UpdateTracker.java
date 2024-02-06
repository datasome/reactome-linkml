package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeRelationship;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
public class UpdateTracker extends MetaDatabaseObject {

    @ReactomeProperty
    private List<String> action;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "updateTracker";
    }

    @ReactomeRelationship(originName = "_release")
    @Relationship(type = "release")
    private Release release;

    @Relationship(type = "updatedInstance")
    private List<Trackable> updatedInstance;

    public UpdateTracker() {}

    public List<String> getAction() { return action; }

    public void setAction(List<String> action) {
        this.action = action;
    }

    public Release getRelease() { return release; }

    public void setRelease(Release release) {
        this.release = release;
    }

    public List<Trackable> getUpdatedInstance() { return updatedInstance; }

    public void setUpdatedInstance(List<Trackable> updatedInstance) {
        this.updatedInstance = updatedInstance;
    }

}
