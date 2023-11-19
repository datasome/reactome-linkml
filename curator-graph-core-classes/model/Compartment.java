package org.reactome.server.graph.curator.domain.model;

import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public class Compartment extends GO_CellularComponent {

    public Compartment() {}

    public Compartment(Long dbId) { super(dbId); }

}
