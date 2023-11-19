package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
public class NegativePrecedingEvent extends DatabaseObject {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private String comment;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "negativePrecedingEvent", direction = Relationship.Direction.INCOMING)
    private List<Event> precedingEvent;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "reason")
    private NegativePrecedingEventReason reason;

    public NegativePrecedingEvent() {}

    public String getComment() { return comment; }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public List<Event> getPrecedingEvent() { return precedingEvent; }

    public void setPrecedingEvent(List<Event> precedingEvent) {
        this.precedingEvent = precedingEvent;
    }

    public NegativePrecedingEventReason getReason() { return reason; }

    public void setReason(NegativePrecedingEventReason reason) {
        this.reason = reason;
    }

}
