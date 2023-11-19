package org.reactome.server.graph.curator.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.curator.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.curator.domain.relationship.HasEvent;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class Pathway extends Event {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "authored", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> authored;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "compartment")
    private List<Compartment> compartment;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private String doi;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "edited", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> edited;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "A collection of related Events. These events can be ReactionLikeEvents or Pathways";
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "goBiologicalProcess")
    private GO_BiologicalProcess goBiologicalProcess;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private Boolean hasEHLD = false;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "hasEvent")
    private SortedSet<HasEvent> hasEvent;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private Boolean isCanonical;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "normalPathway")
    private Pathway normalPathway;

    public Pathway() {}

    public Pathway(Long dbId) { super(dbId); }

    public List<InstanceEdit> getAuthored() { return authored; }

    public void setAuthored(List<InstanceEdit> authored) {
        this.authored = authored;
    }

    public List<Compartment> getCompartment() { return compartment; }

    public void setCompartment(List<Compartment> compartment) {
        this.compartment = compartment;
    }

    public String getDoi() { return doi; }

    public void setDoi(String doi) {
        this.doi = doi;
    }

    public List<InstanceEdit> getEdited() { return edited; }

    public void setEdited(List<InstanceEdit> edited) {
        this.edited = edited;
    }

    public GO_BiologicalProcess getGoBiologicalProcess() { return goBiologicalProcess; }

    public void setGoBiologicalProcess(GO_BiologicalProcess goBiologicalProcess) {
        this.goBiologicalProcess = goBiologicalProcess;
    }

    public Boolean getHasEHLD() { return hasEHLD; }

    public void setHasEHLD(Boolean hasEHLD) {
        this.hasEHLD = hasEHLD;
    }

    public List<Event> getHasEvent(){
        List<Event> rtn = null;
        if (this.hasEvent != null) {
            rtn = new ArrayList<>();
            for (HasEvent hasEvent : this.hasEvent) {
                rtn.add(hasEvent.getEvent());
            }
        }
        return rtn;
    }

    public void setHasEvent(List<Event> hasEvent) {
        if (hasEvent == null) return;
        Map<Long, HasEvent> map = new LinkedHashMap<>();
        int order = 0;
        for (Event event : hasEvent) {
            relInst = new HasEvent();
            relInst.setEvent(event);
            relInst.setOrder(order++);
            map.put(event.getDB_ID(), relInst);
        }
        this.hasEvent = new TreeSet<>(map.values());
    }


    public Boolean getIsCanonical() { return isCanonical; }

    public void setIsCanonical(Boolean isCanonical) {
        this.isCanonical = isCanonical;
    }

    public Pathway getNormalPathway() { return normalPathway; }

    public void setNormalPathway(Pathway normalPathway) {
        this.normalPathway = normalPathway;
    }

}
