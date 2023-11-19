package org.reactome.server.graph.domain.model;

import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class Summation extends DatabaseObject {

    @Relationship(type = "literatureReference")
    private List<Publication> literatureReference;

    @ReactomeProperty
    private String text;

    public Summation() {}

    public List<Publication> getLiteratureReference() { return literatureReference; }

    public void setLiteratureReference(List<Publication> literatureReference) {
        this.literatureReference = literatureReference;
    }

    public String getText() { return text; }

    public void setText(String text) {
        this.text = text;
    }

}
