package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.curator.domain.relationship.Input;
import org.reactome.server.graph.curator.domain.relationship.Output;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class BlackBoxEvent extends ReactionlikeEvent {

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
    @Override
    public String getExplanation() {
        return "Shortcut reactions that make the connection between input and output, but don't provide complete mechanistic detail. Used for reactions that do not balance, or complicated processes for which we either don't know all the details, or we choose not to represent every step. (e.g. degradation of a protein)";
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "goBiologicalProcess")
    private GO_BiologicalProcess goBiologicalProcess;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "input")
    private Set<Input> input;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "literatureReference")
    private List<Publication> literatureReference;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "output")
    private Set<Output> output;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "templateEvent")
    private Event templateEvent;

    public BlackBoxEvent() {}

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

    public List<PhysicalEntity> getInput(){
        List<PhysicalEntity> rtn = null;
        if (this.input != null) {
            rtn = new ArrayList<>();
            for (Input input : this.input) {
                rtn.add(input.getPhysicalEntity());
            }
        }
        return rtn;
    }

    public void setInput(List<PhysicalEntity> input) {
        if (input == null) return;
        Map<Long, Input> map = new LinkedHashMap<>();
        int order = 0;
        for (PhysicalEntity physicalEntity : input) {
            relInst = new Input();
            relInst.setPhysicalEntity(physicalEntity);
            relInst.setOrder(order++);
            map.put(physicalEntity.getDB_ID(), relInst);
        }
        this.input = new TreeSet<>(map.values());
    }


    public List<Publication> getLiteratureReference() { return literatureReference; }

    public void setLiteratureReference(List<Publication> literatureReference) {
        this.literatureReference = literatureReference;
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

    public Event getTemplateEvent() { return templateEvent; }

    public void setTemplateEvent(Event templateEvent) {
        this.templateEvent = templateEvent;
    }

}
