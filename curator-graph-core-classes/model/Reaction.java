package org.reactome.server.graph.curator.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeSchemaIgnore;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class Reaction extends ReactionlikeEvent {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "authored", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> authored;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "edited", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> edited;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "Defines a change of state for one or more molecular entities. Most reactions in Reactome involve either a) the interaction of entities to form a complex, or b) the movement of entities between compartments, or c) the chemical conversion of entities as part of a metabolic process. Reactions have a molecular balance between input and output entities";
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "goBiologicalProcess")
    private GO_BiologicalProcess goBiologicalProcess;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "literatureReference")
    private List<Publication> literatureReference;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "reverseReaction")
    private Reaction reverseReaction;

    public Reaction() {}

    public Reaction(Long dbId) { super(dbId); }

    public List<InstanceEdit> getAuthored() { return authored; }

    public void setAuthored(List<InstanceEdit> authored) {
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

    public List<Publication> getLiteratureReference() { return literatureReference; }

    public void setLiteratureReference(List<Publication> literatureReference) {
        this.literatureReference = literatureReference;
    }

    public Reaction getReverseReaction() { return reverseReaction; }

    public void setReverseReaction(Reaction reverseReaction) {
        this.reverseReaction = reverseReaction;
    }

}
