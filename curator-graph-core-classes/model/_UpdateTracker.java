package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeAllowedClasses;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Relationship;

public class _UpdateTracker extends DatabaseObject {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @Relationship(type = "_release")
    private _Release _release;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @ReactomeProperty
    private List<String> action;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @Relationship(type = "updatedInstance")
    @ReactomeAllowedClasses(allowed = {Event.class, PhysicalEntity.class})
    private List<DatabaseObject> updatedInstance;

    public _UpdateTracker() {}

    public _Release get_release() { return _release; }

    public void set_release(_Release _release) {
        this._release = _release;
    }

    public List<String> getAction() { return action; }

    public void setAction(List<String> action) {
        this.action = action;
    }

    @ReactomeAllowedClasses(allowed = {Event.class, PhysicalEntity.class})
    public List<DatabaseObject> getUpdatedInstance() { return updatedInstance; }

    public void setUpdatedInstance(List<DatabaseObject> updatedInstance) {
        if(updatedInstance == null) return;

        if (updatedInstance instanceof Event || updatedInstance instanceof PhysicalEntity) {
            this.updatedInstance = updatedInstance;
        } else {
            throw new RuntimeException(updatedInstance + " is none of: Event, PhysicalEntity");
        }
    }

}
