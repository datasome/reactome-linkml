package org.reactome.server.graph.domain.model;

import java.util.*;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings({"unused", "WeakerAccess"})
public abstract class ControlReference extends DatabaseObject {

    @Relationship(type = "literatureReference")
    private List<Publication> literatureReference;

    public ControlReference() {}

    public List<Publication> getLiteratureReference() { return literatureReference; }

    public void setLiteratureReference(List<Publication> literatureReference) {
        this.literatureReference = literatureReference;
    }

}
