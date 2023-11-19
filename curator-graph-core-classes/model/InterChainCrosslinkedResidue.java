package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class InterChainCrosslinkedResidue extends CrosslinkedResidue {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "equivalentTo")
    private List<InterChainCrosslinkedResidue> equivalentTo;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "secondReferenceSequence")
    private Set<ReferenceSequence> secondReferenceSequence;

    public InterChainCrosslinkedResidue() {}

    public List<InterChainCrosslinkedResidue> getEquivalentTo() { return equivalentTo; }

    public void setEquivalentTo(List<InterChainCrosslinkedResidue> equivalentTo) {
        this.equivalentTo = equivalentTo;
    }

    public Set<ReferenceSequence> getSecondReferenceSequence() { return secondReferenceSequence; }

    public void setSecondReferenceSequence(Set<ReferenceSequence> secondReferenceSequence) {
        this.secondReferenceSequence = secondReferenceSequence;
    }

}
