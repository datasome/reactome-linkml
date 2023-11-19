package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.curator.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.curator.domain.relationship.Input;
import org.reactome.server.graph.curator.domain.relationship.Output;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class ReactionlikeEvent extends Event {

    @Relationship(type = "catalystActivity")
    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @ReactomeInstanceDefiningValue(category = "all")
    private List<CatalystActivity> catalystActivity;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "catalystActivityReference")
    private CatalystActivityReference catalystActivityReference;

    @ReactomeSchemaIgnore
    @Override
    public String getClassName() {
        return "Reaction";
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "compartment")
    private List<Compartment> compartment;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "entityFunctionalStatus")
    private List<EntityFunctionalStatus> entityFunctionalStatus;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "entityOnOtherCell")
    private List<PhysicalEntity> entityOnOtherCell;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "hasInteraction")
    private List<InteractionEvent> hasInteraction;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "input")
    private Set<Input> input;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private Boolean isChimeric;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "normalReaction")
    private ReactionlikeEvent normalReaction;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "output")
    private Set<Output> output;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "reactionType")
    private List<ReactionType> reactionType;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "regulatedBy")
    private List<Regulation> regulatedBy;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "regulationReference")
    private List<RegulationReference> regulationReference;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "requiredInputComponent")
    private Set<PhysicalEntity> requiredInputComponent;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private String systematicName;

    public ReactionlikeEvent() {}

    public ReactionlikeEvent(Long dbId) { super(dbId); }

    public List<CatalystActivity> getCatalystActivity() { return catalystActivity; }

    public void setCatalystActivity(List<CatalystActivity> catalystActivity) {
        this.catalystActivity = catalystActivity;
    }

    public CatalystActivityReference getCatalystActivityReference() { return catalystActivityReference; }

    public void setCatalystActivityReference(CatalystActivityReference catalystActivityReference) {
        this.catalystActivityReference = catalystActivityReference;
    }

    public List<Compartment> getCompartment() { return compartment; }

    public void setCompartment(List<Compartment> compartment) {
        this.compartment = compartment;
    }

    public List<EntityFunctionalStatus> getEntityFunctionalStatus() { return entityFunctionalStatus; }

    public void setEntityFunctionalStatus(List<EntityFunctionalStatus> entityFunctionalStatus) {
        this.entityFunctionalStatus = entityFunctionalStatus;
    }

    public List<PhysicalEntity> getEntityOnOtherCell() { return entityOnOtherCell; }

    public void setEntityOnOtherCell(List<PhysicalEntity> entityOnOtherCell) {
        this.entityOnOtherCell = entityOnOtherCell;
    }

    public List<InteractionEvent> getHasInteraction() { return hasInteraction; }

    public void setHasInteraction(List<InteractionEvent> hasInteraction) {
        this.hasInteraction = hasInteraction;
    }

    public List<PhysicalEntity> getInput(){
        List<PhysicalEntity> rtn = null;
        if (this.input != null) {
            rtn = new ArrayList<>();
            for (Input input : this.input) {
                for (int i = 0; i < input.getStoichiometry(); i++) {
                    rtn.add(input.getPhysicalEntity());
                }
            }
        }
        return rtn;
    }

    public void setInput(List<PhysicalEntity> input) {
        if (input == null) return;
        Map<Long, Input> map = new LinkedHashMap<>();
        int order = 0;
        for (PhysicalEntity physicalEntity : input) {
            PhysicalEntity relInst = map.get(physicalEntity.getDB_ID());
            if (relInst != null) {
                relInst.setStoichiometry(relInst.getStoichiometry() + 1);
            } else {
                relInst = new Input();
                relInst.setPhysicalEntity(physicalEntity);
                relInst.setOrder(order++);
                map.put(physicalEntity.getDB_ID(), relInst);
            }
        }
        this.input = new TreeSet<>(map.values());
    }

    public Boolean getIsChimeric() { return isChimeric; }

    public void setIsChimeric(Boolean isChimeric) {
        this.isChimeric = isChimeric;
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
                for (int i = 0; i < output.getStoichiometry(); i++) {
                    rtn.add(output.getPhysicalEntity());
                }
            }
        }
        return rtn;
    }

    public List<ReactionType> getReactionType() { return reactionType; }

    public void setReactionType(List<ReactionType> reactionType) {
        this.reactionType = reactionType;
    }

    public List<Regulation> getRegulatedBy() { return regulatedBy; }

    public void setRegulatedBy(List<Regulation> regulatedBy) {
        this.regulatedBy = regulatedBy;
    }

    public List<RegulationReference> getRegulationReference() { return regulationReference; }

    public void setRegulationReference(List<RegulationReference> regulationReference) {
        this.regulationReference = regulationReference;
    }

    public Set<PhysicalEntity> getRequiredInputComponent() { return requiredInputComponent; }

    public void setRequiredInputComponent(Set<PhysicalEntity> requiredInputComponent) {
        this.requiredInputComponent = requiredInputComponent;
    }

    public String getSystematicName() { return systematicName; }

    public void setSystematicName(String systematicName) {
        this.systematicName = systematicName;
    }

}
