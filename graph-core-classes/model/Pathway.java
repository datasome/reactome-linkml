package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeRelationship;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.domain.annotations.ReactomeTransient;
import org.reactome.server.graph.domain.relationship.HasEncapsulatedEvent;
import org.reactome.server.graph.domain.relationship.HasEvent;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class Pathway extends Event {

    @ReactomeTransient
    private Integer diagramHeight;

    @ReactomeTransient
    private Integer diagramWidth;

    @ReactomeProperty
    private String doi;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "A collection of related Events. These events can be ReactionLikeEvents or Pathways";
    }

    @ReactomeProperty(addedField = true)
    private Boolean hasDiagram;

    @ReactomeProperty
    private Boolean hasEHLD = false;

    @ReactomeRelationship
    @Relationship(type = "hasEncapsulatedEvent")
    private SortedSet<HasEncapsulatedEvent> hasEncapsulatedEvent;

    @Relationship(type = "hasEvent")
    private SortedSet<HasEvent> hasEvent;

    @ReactomeProperty
    private String isCanonical;

    @Relationship(type = "normalPathway")
    private Pathway normalPathway;

    public Pathway() {}

    public Pathway(Long dbId) { super(dbId); }

    @ReactomeSchemaIgnore
    @JsonIgnore
    public Integer getDiagramHeight() { return diagramHeight; }

    public void setDiagramHeight(Integer diagramHeight) {
        this.diagramHeight = diagramHeight;
    }

    @ReactomeSchemaIgnore
    @JsonIgnore
    public Integer getDiagramWidth() { return diagramWidth; }

    public void setDiagramWidth(Integer diagramWidth) {
        this.diagramWidth = diagramWidth;
    }

    public String getDoi() { return doi; }

    public void setDoi(String doi) {
        this.doi = doi;
    }

    public Boolean getHasDiagram() { return hasDiagram; }

    public void setHasDiagram(Boolean hasDiagram) {
        this.hasDiagram = hasDiagram;
    }

    public Boolean getHasEHLD() { return hasEHLD; }

    public void setHasEHLD(Boolean hasEHLD) {
        this.hasEHLD = hasEHLD;
    }

    @ReactomeSchemaIgnore
    @JsonIgnore
    public List<Event> getHasEncapsulatedEvent(){
        List<Event> rtn = null;
        if (this.hasEncapsulatedEvent != null) {
            rtn = new ArrayList<>();
            for (HasEncapsulatedEvent hasEncapsulatedEvent : this.hasEncapsulatedEvent) {
                rtn.add(hasEncapsulatedEvent.getEvent());
            }
        }
        return rtn;
    }

    public void setHasEncapsulatedEvent(List<Event> hasEncapsulatedEvent) {
        if (hasEncapsulatedEvent == null) return;
        Map<Long, HasEncapsulatedEvent> map = new LinkedHashMap<>();
        int order = 0;
        for (Event event : hasEncapsulatedEvent) {
            relInst = new HasEncapsulatedEvent();
            relInst.setEvent(event);
            relInst.setOrder(order++);
            map.put(event.getDB_ID(), relInst);
        }
        this.hasEncapsulatedEvent = new TreeSet<>(map.values());
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


    public String getIsCanonical() { return isCanonical; }

    public void setIsCanonical(String isCanonical) {
        this.isCanonical = isCanonical;
    }

    public Pathway getNormalPathway() { return normalPathway; }

    public void setNormalPathway(Pathway normalPathway) {
        this.normalPathway = normalPathway;
    }

}
