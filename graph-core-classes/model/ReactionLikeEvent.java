package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.domain.relationship.Input;
import org.reactome.server.graph.domain.relationship.Output;
import org.reactome.server.graph.service.helper.StoichiometryObject;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class ReactionLikeEvent extends Event {

    @Relationship(type = "catalystActivity")
    private List<CatalystActivity> catalystActivity;

    @Relationship(type = "catalystActivityReference")
    private CatalystActivityReference catalystActivityReference;

    @ReactomeSchemaIgnore
    @Override
    public String getClassName() {
        return "Reaction";
    }

    @Relationship(type = "entityFunctionalStatus")
    private List<EntityFunctionalStatus> entityFunctionalStatus;

    @Relationship(type = "entityOnOtherCell")
    private List<PhysicalEntity> entityOnOtherCell;

    @Relationship(type = "hasInteraction")
    private List<InteractionEvent> hasInteraction;

    @Relationship(type = "input")
    private Set<Input> input;

    @ReactomeProperty
    private Boolean isChimeric;

    @Relationship(type = "normalReaction")
    private ReactionLikeEvent normalReaction;

    @Relationship(type = "output")
    private Set<Output> output;

    @Relationship(type = "reactionType")
    private List<ReactionType> reactionType;

    @Relationship(type = "regulatedBy")
    private List<Regulation> regulatedBy;

    @Relationship(type = "regulationReference")
    private List<RegulationReference> regulationReference;

    @Relationship(type = "requiredInputComponent")
    private Set<PhysicalEntity> requiredInputComponent;

    @ReactomeProperty
    private String systematicName;

    public ReactionLikeEvent() {}

    public ReactionLikeEvent(Long dbId) { super(dbId); }

    public List<CatalystActivity> getCatalystActivity() { return catalystActivity; }

    public void setCatalystActivity(List<CatalystActivity> catalystActivity) {
        this.catalystActivity = catalystActivity;
    }

    public CatalystActivityReference getCatalystActivityReference() { return catalystActivityReference; }

    public void setCatalystActivityReference(CatalystActivityReference catalystActivityReference) {
        this.catalystActivityReference = catalystActivityReference;
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

    @JsonIgnore
    public List<StoichiometryObject> fetchInput() {
        List<StoichiometryObject> objects = new ArrayList<>();
        if(input!=null) {
            for (Input aux : input) {
                objects.add(new StoichiometryObject(aux.getStoichiometry(), aux.getPhysicalEntity()));
            }
            Collections.sort(objects);
        }
        return objects;
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

    public ReactionLikeEvent getNormalReaction() { return normalReaction; }

    public void setNormalReaction(ReactionLikeEvent normalReaction) {
        this.normalReaction = normalReaction;
    }

    @JsonIgnore
    public List<StoichiometryObject> fetchOutput() {
        List<StoichiometryObject> objects = new ArrayList<>();
        if(output!=null) {
            for (Output aux : output) {
                objects.add(new StoichiometryObject(aux.getStoichiometry(), aux.getPhysicalEntity()));
            }
            Collections.sort(objects);
        }
        return objects;
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

    public void setOutput(Set<Output> output) {
        this.output = output;
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
