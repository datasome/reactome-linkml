package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeRelationship;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
public class Deleted extends MetaDatabaseObject {

    @ReactomeProperty
    private String curatorComment;

    @Relationship(type = "deletedInstance")
    private List<DeletedInstance> deletedInstance;

    @ReactomeRelationship(originName = "deletedInstanceDB_ID")
    private List<Integer> deletedInstanceDbId;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "Deleted";
    }

    @Relationship(type = "reason")
    private DeletedControlledVocabulary reason;

    @Relationship(type = "replacementInstances")
    private List<Deleteable> replacementInstances;

    public Deleted() {}

    public String getCuratorComment() { return curatorComment; }

    public void setCuratorComment(String curatorComment) {
        this.curatorComment = curatorComment;
    }

    public List<DeletedInstance> getDeletedInstance() { return deletedInstance; }

    public void setDeletedInstance(List<DeletedInstance> deletedInstance) {
        this.deletedInstance = deletedInstance;
    }

    public List<Integer> getDeletedInstanceDbId() { return deletedInstanceDbId; }

    public void setDeletedInstanceDbId(List<Integer> deletedInstanceDbId) {
        this.deletedInstanceDbId = deletedInstanceDbId;
    }

    public DeletedControlledVocabulary getReason() { return reason; }

    public void setReason(DeletedControlledVocabulary reason) {
        this.reason = reason;
    }

    public List<Deleteable> getReplacementInstances() { return replacementInstances; }

    public void setReplacementInstances(List<Deleteable> replacementInstances) {
        this.replacementInstances = replacementInstances;
    }

}
