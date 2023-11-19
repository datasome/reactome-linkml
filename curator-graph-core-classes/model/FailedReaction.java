package org.reactome.server.graph.curator.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.curator.domain.relationship.Output;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class FailedReaction extends ReactionlikeEvent {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "authored", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> authored;

    @Relationship(type = "catalystActivity")
    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeInstanceDefiningValue(category = "all")
    private List<CatalystActivity> catalystActivity;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "edited", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> edited;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "Defines an event where genetic mutations in the nucleotide sequence produces a protein with a very little or no activity. The consequence of this is that substrates are not converted to products and can therefore build up to cause pathological conditions. It could also mean entities are not moved between compartments again causing imbalances in entity concentrations which can lead to pathological conditions.";
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "goBiologicalProcess")
    private GO_BiologicalProcess goBiologicalProcess;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "literatureReference")
    private List<Publication> literatureReference;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "normalReaction")
    private ReactionlikeEvent normalReaction;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "output")
    private Set<Output> output;

    public FailedReaction() {}

    public List<InstanceEdit> getAuthored() { return authored; }

    public void setAuthored(List<InstanceEdit> authored) {
        this.authored = authored;
    }

    public List<CatalystActivity> getCatalystActivity() { return catalystActivity; }

    public void setCatalystActivity(List<CatalystActivity> catalystActivity) {
        this.catalystActivity = catalystActivity;
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

    public ReactionlikeEvent getNormalReaction() { return normalReaction; }

    public void setNormalReaction(ReactionlikeEvent normalReaction) {
        this.normalReaction = normalReaction;
    }

    public List<PhysicalEntity> getOutput(){
        List<PhysicalEntity> rtn = null;
        if (this.output != null) {
            rtn = new ArrayList<>();
            for (Output output : this.output) {
                rtn.add(output.getPhysicalEntity());
            }
        }
        return rtn;
    }

    public void setOutput(Set<Output> output) {
        this.output = output;
    }

}
