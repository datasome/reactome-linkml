package org.reactome.server.graph.domain.model;

import java.util.*;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class ReferenceRNASequence extends ReferenceSequence {

    @Relationship(type = "referenceGene")
    private List<ReferenceDNASequence> referenceGene;

    public ReferenceRNASequence() {}

    public List<ReferenceDNASequence> getReferenceGene() { return referenceGene; }

    public void setReferenceGene(List<ReferenceDNASequence> referenceGene) {
        this.referenceGene = referenceGene;
    }

}
