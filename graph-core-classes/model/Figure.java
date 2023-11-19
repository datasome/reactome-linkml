package org.reactome.server.graph.domain.model;

import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Property;

@Node
@SuppressWarnings("unused")
public class Figure extends DatabaseObject {

    @ReactomeProperty
    @Property
    private String url;

    public Figure() {}

    public String getUrl() { return url; }

    public void setUrl(String url) {
        this.url = url;
    }

}
