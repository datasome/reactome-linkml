package org.reactome.server.graph.domain.model;

import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeTransient;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class Regulation extends DatabaseObject implements Deletable {

    @Relationship(type = "activeUnit")
    @ReactomeProperty
    private List<PhysicalEntity> activeUnit;

    @Relationship(type = "activity")
    @ReactomeProperty
    private GO_MolecularFunction activity;

    @Relationship(type = "authored", direction = Relationship.Direction.INCOMING)
    private InstanceEdit authored;

    @Relationship(type = "edited", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> edited;

    @Relationship(type = "goBiologicalProcess")
    private GO_BiologicalProcess goBiologicalProcess;

    @Relationship(type = "inferredTo", direction = Relationship.Direction.INCOMING)
    private List<Regulation> inferredFrom;

    @Relationship(type = "inferredTo")
    private List<Regulation> inferredTo;

    @Relationship(type = "literatureReference")
    private List<Publication> literatureReference;

    @ReactomeTransient
    @Relationship(type = "regulatedBy", direction = Relationship.Direction.INCOMING)
    private List<ReactionLikeEvent> regulatedEntity;

    @Relationship(type = "regulator")
    private PhysicalEntity regulator;

    @ReactomeProperty
    private String releaseDate;

    @Relationship(type = "reviewed", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> reviewed;

    @Relationship(type = "revised", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> revised;

    public Regulation() {}

    public List<PhysicalEntity> getActiveUnit() { return activeUnit; }

    public void setActiveUnit(List<PhysicalEntity> activeUnit) {
        this.activeUnit = activeUnit;
    }

    public GO_MolecularFunction getActivity() { return activity; }

    public void setActivity(GO_MolecularFunction activity) {
        this.activity = activity;
    }

    public InstanceEdit getAuthored() { return authored; }

    public void setAuthored(InstanceEdit authored) {
        this.authored = authored;
    }

    public List<InstanceEdit> getEdited() { return edited; }

    public void setEdited(List<InstanceEdit> edited) {
        this.edited = edited;
    }

    public GO_BiologicalProcess getGoBiologicalProcess() { return goBiologicalProcess; }

    public void setGoBiologicalProcess(GO_BiologicalProcess goBiologicalProcess) {
        this.goBiologicalProcess = goBiologicalProcess;
    }

    public List<Regulation> getInferredFrom() { return inferredFrom; }

    public void setInferredFrom(List<Regulation> inferredFrom) {
        this.inferredFrom = inferredFrom;
    }

    public List<Regulation> getInferredTo() { return inferredTo; }

    public void setInferredTo(List<Regulation> inferredTo) {
        this.inferredTo = inferredTo;
    }

    public List<Publication> getLiteratureReference() { return literatureReference; }

    public void setLiteratureReference(List<Publication> literatureReference) {
        this.literatureReference = literatureReference;
    }

    public List<ReactionLikeEvent> getRegulatedEntity() { return regulatedEntity; }

    public void setRegulatedEntity(List<ReactionLikeEvent> regulatedEntity) {
        this.regulatedEntity = regulatedEntity;
    }

    public PhysicalEntity getRegulator() { return regulator; }

    public void setRegulator(PhysicalEntity regulator) {
        this.regulator = regulator;
    }

    public String getReleaseDate() { return releaseDate; }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public List<InstanceEdit> getReviewed() { return reviewed; }

    public void setReviewed(List<InstanceEdit> reviewed) {
        this.reviewed = reviewed;
    }

    public List<InstanceEdit> getRevised() { return revised; }

    public void setRevised(List<InstanceEdit> revised) {
        this.revised = revised;
    }

}
