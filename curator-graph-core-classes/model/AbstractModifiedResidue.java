package org.reactome.server.graph.curator.domain.model;

import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class AbstractModifiedResidue extends DatabaseObject {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "referenceSequence")
    private ReferenceSequence referenceSequence;

    public AbstractModifiedResidue() {}

    public AbstractModifiedResidue(Long dbId) { super(dbId); }

    public ReferenceSequence getReferenceSequence() { return referenceSequence; }

    public void setReferenceSequence(ReferenceSequence referenceSequence) {
        this.referenceSequence = referenceSequence;
    }

}
