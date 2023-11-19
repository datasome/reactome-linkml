package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Relationship;

public class _Deleted extends DatabaseObject {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @ReactomeProperty
    private String curatorComment;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @Relationship(type = "deletedInstance")
    private List<_DeletedInstance> deletedInstance;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @ReactomeProperty
    private List<Long> deletedInstanceDB_ID;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @Relationship(type = "reason")
    private DeletedControlledVocabulary reason;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @Relationship(type = "replacementInstances")
    private List<DatabaseObject> replacementInstances;

    public _Deleted() {}

    public String getCuratorComment() { return curatorComment; }

    public void setCuratorComment(String curatorComment) {
        this.curatorComment = curatorComment;
    }

    public List<_DeletedInstance> getDeletedInstance() { return deletedInstance; }

    public void setDeletedInstance(List<_DeletedInstance> deletedInstance) {
        this.deletedInstance = deletedInstance;
    }

    public List<Long> getDeletedInstanceDB_ID() { return deletedInstanceDB_ID; }

    public void setDeletedInstanceDB_ID(List<Long> deletedInstanceDB_ID) {
        this.deletedInstanceDB_ID = deletedInstanceDB_ID;
    }

    public DeletedControlledVocabulary getReason() { return reason; }

    public void setReason(DeletedControlledVocabulary reason) {
        this.reason = reason;
    }

    public List<DatabaseObject> getReplacementInstances() { return replacementInstances; }

    public void setReplacementInstances(List<DatabaseObject> replacementInstances) {
        this.replacementInstances = replacementInstances;
    }

}
