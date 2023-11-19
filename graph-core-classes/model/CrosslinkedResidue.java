package org.reactome.server.graph.domain.model;

import org.reactome.server.graph.domain.annotations.ReactomeAllowedClasses;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class CrosslinkedResidue extends TranslationalModification {

    @Relationship(type = "modification")
    @ReactomeAllowedClasses(allowed = {EntitySet.class, Polymer.class, ReferenceGroup.class})
    private DatabaseObject modification;

    @ReactomeProperty
    private Integer secondCoordinate;

    public CrosslinkedResidue() {}

    @ReactomeAllowedClasses(allowed = {EntitySet.class, Polymer.class, ReferenceGroup.class})
    public DatabaseObject getModification() { return modification; }

    public void setModification(DatabaseObject modification) {
        if(modification == null) return;

        if (modification instanceof EntitySet || modification instanceof Polymer || modification instanceof ReferenceGroup) {
            this.modification = modification;
        } else {
            throw new RuntimeException(modification + " is none of: EntitySet, Polymer, ReferenceGroup");
        }
    }

    public Integer getSecondCoordinate() { return secondCoordinate; }

    public void setSecondCoordinate(Integer secondCoordinate) {
        this.secondCoordinate = secondCoordinate;
    }

}
