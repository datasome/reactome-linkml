package org.reactome.server.graph.curator.domain.model;

import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public abstract class FragmentModification extends GeneticallyModifiedResidue {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @ReactomeProperty
    private Integer endPositionInReferenceSequence;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @ReactomeProperty
    private Integer startPositionInReferenceSequence;

    public FragmentModification() {}

    public Integer getEndPositionInReferenceSequence() { return endPositionInReferenceSequence; }

    public void setEndPositionInReferenceSequence(Integer endPositionInReferenceSequence) {
        this.endPositionInReferenceSequence = endPositionInReferenceSequence;
    }

    public Integer getStartPositionInReferenceSequence() { return startPositionInReferenceSequence; }

    public void setStartPositionInReferenceSequence(Integer startPositionInReferenceSequence) {
        this.startPositionInReferenceSequence = startPositionInReferenceSequence;
    }

}
