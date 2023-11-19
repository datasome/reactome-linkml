package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.curator.domain.relationship.RepresentedPathway;
import org.springframework.data.neo4j.core.schema.Relationship;

public class PathwayDiagram extends DatabaseObject {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @ReactomeProperty
    private Integer height;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "representedPathway")
    private SortedSet<RepresentedPathway> representedPathway;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @ReactomeProperty
    private String storedATXML;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @ReactomeProperty
    private Integer width;

    public PathwayDiagram() {}

    public Integer getHeight() { return height; }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public List<Pathway> getRepresentedPathway(){
        List<Pathway> rtn = null;
        if (this.representedPathway != null) {
            rtn = new ArrayList<>();
            for (RepresentedPathway representedPathway : this.representedPathway) {
                rtn.add(representedPathway.getPathway());
            }
        }
        return rtn;
    }

    public void setRepresentedPathway(List<Pathway> representedPathway) {
        if (representedPathway == null) return;
        Map<Long, RepresentedPathway> map = new LinkedHashMap<>();
        int order = 0;
        for (Pathway pathway : representedPathway) {
            relInst = new RepresentedPathway();
            relInst.setPathway(pathway);
            relInst.setOrder(order++);
            map.put(pathway.getDB_ID(), relInst);
        }
        this.representedPathway = new TreeSet<>(map.values());
    }


    public String getStoredATXML() { return storedATXML; }

    public void setStoredATXML(String storedATXML) {
        this.storedATXML = storedATXML;
    }

    public Integer getWidth() { return width; }

    public void setWidth(Integer width) {
        this.width = width;
    }

}
