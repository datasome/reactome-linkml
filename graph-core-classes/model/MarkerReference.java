package org.reactome.server.graph.domain.model;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
public class MarkerReference extends ControlReference {

    @Relationship(type = "marker")
    private EntityWithAccessionedSequence marker;

    public MarkerReference() {}

    public EntityWithAccessionedSequence getMarker() { return marker; }

    public void setMarker(EntityWithAccessionedSequence marker) {
        this.marker = marker;
    }

}
