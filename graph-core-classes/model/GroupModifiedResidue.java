package org.reactome.server.graph.domain.model;

import org.reactome.server.graph.domain.annotations.ReactomeAllowedClasses;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class GroupModifiedResidue extends TranslationalModification {

    @Relationship(type = "modification")
    @ReactomeAllowedClasses(allowed = {Polymer.class, EntitySet.class, ReferenceGroup.class})
    private DatabaseObject modification;

    public GroupModifiedResidue() {}

    @ReactomeAllowedClasses(allowed = {Polymer.class, EntitySet.class, ReferenceGroup.class})
    public DatabaseObject getModification() { return modification; }

    public void setModification(DatabaseObject modification) {
        if(modification == null) return;

        if (modification instanceof Polymer || modification instanceof EntitySet || modification instanceof ReferenceGroup) {
            this.modification = modification;
        } else {
            throw new RuntimeException(modification + " is none of: Polymer, EntitySet, ReferenceGroup");
        }
    }

}
