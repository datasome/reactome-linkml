package org.reactome.server.graph.curator.domain.model;

import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public abstract class GeneticallyModifiedResidue extends AbstractModifiedResidue {

    public GeneticallyModifiedResidue() {}

}
