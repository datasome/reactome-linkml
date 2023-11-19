package org.reactome.server.graph.curator.domain.model;

import org.reactome.server.graph.curator.domain.annotations.ReactomeAllowedClasses;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class CrosslinkedResidue extends TranslationalModification {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "modification")
    @ReactomeAllowedClasses(allowed = {EntitySet.class, Polymer.class, ReferenceMolecule.class, ReferenceGroup.class})
    private DatabaseObject modification;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @ReactomeInstanceDefiningValue(category = "all")
    @ReactomeProperty
    private Integer secondCoordinate;

    public CrosslinkedResidue() {}

    @ReactomeAllowedClasses(allowed = {EntitySet.class, Polymer.class, ReferenceMolecule.class, ReferenceGroup.class})
    public DatabaseObject getModification() { return modification; }

    public void setModification(DatabaseObject modification) {
        if(modification == null) return;

        if (modification instanceof EntitySet || modification instanceof Polymer || modification instanceof ReferenceMolecule || modification instanceof ReferenceGroup) {
            this.modification = modification;
        } else {
            throw new RuntimeException(modification + " is none of: EntitySet, Polymer, ReferenceMolecule, ReferenceGroup");
        }
    }

    public Integer getSecondCoordinate() { return secondCoordinate; }

    public void setSecondCoordinate(Integer secondCoordinate) {
        this.secondCoordinate = secondCoordinate;
    }

}
