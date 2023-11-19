package org.reactome.server.graph.domain.model;

import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings({"unused", "WeakerAccess"})
public class ReferenceDatabase extends DatabaseObject {

    @ReactomeProperty
    private String accessUrl;

    @ReactomeProperty
    private List<String> name;

    @ReactomeProperty
    private String resourceIdentifier;

    @ReactomeProperty
    private String url;

    public ReferenceDatabase() {}

    public String getAccessUrl() { return accessUrl; }

    public void setAccessUrl(String accessUrl) {
        this.accessUrl = accessUrl;
    }

    public List<String> getName() { return name; }

    public void setName(List<String> name) {
        this.name = name;
    }

    public String getResourceIdentifier() { return resourceIdentifier; }

    public void setResourceIdentifier(String resourceIdentifier) {
        this.resourceIdentifier = resourceIdentifier;
    }

    public String getUrl() { return url; }

    public void setUrl(String url) {
        this.url = url;
    }

}
