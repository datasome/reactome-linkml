package org.reactome.server.graph.curator.domain.model;

import org.reactome.server.graph.curator.domain.annotations.ReactomeAllowedClasses;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class GroupModifiedResidue extends TranslationalModification {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "modification")
    @ReactomeAllowedClasses(allowed = {EntitySet.class, Polymer.class, ReferenceMolecule.class, ReferenceGroup.class})
    private DatabaseObject modification;

    public GroupModifiedResidue() {}

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

}
