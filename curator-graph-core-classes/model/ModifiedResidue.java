package org.reactome.server.graph.curator.domain.model;

import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public class ModifiedResidue extends TranslationalModification {

    public ModifiedResidue() {}

    public ModifiedResidue(Long dbId) { super(dbId); }

}
