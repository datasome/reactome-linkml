package org.reactome.server.graph.domain.model;

import java.util.*;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class UndirectedInteraction extends Interaction {

    @Relationship(type = "interactor")
    private List<ReferenceEntity> interactor;

    public UndirectedInteraction() {}

    public List<ReferenceEntity> getInteractor() { return interactor; }

    public void setInteractor(List<ReferenceEntity> interactor) {
        this.interactor = interactor;
    }

}
