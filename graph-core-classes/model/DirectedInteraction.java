package org.reactome.server.graph.domain.model;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class DirectedInteraction extends Interaction {

    @Relationship(type = "source")
    private ReferenceEntity source;

    @Relationship(type = "target")
    private ReferenceEntity target;

    public DirectedInteraction() {}

    public ReferenceEntity getSource() { return source; }

    public void setSource(ReferenceEntity source) {
        this.source = source;
    }

    public ReferenceEntity getTarget() { return target; }

    public void setTarget(ReferenceEntity target) {
        this.target = target;
    }

}
