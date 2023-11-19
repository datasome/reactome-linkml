package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.domain.annotations.ReactomeTransient;
import org.reactome.server.graph.domain.relationship.HasCompartment;
import org.reactome.server.graph.domain.relationship.HasComponentForComplex;
import org.reactome.server.graph.domain.relationship.InputForReactionLikeEvent;
import org.reactome.server.graph.domain.relationship.OutputForReactionLikeEvent;
import org.reactome.server.graph.domain.relationship.RepeatedUnitForPhysicalEntity;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class PhysicalEntity extends DatabaseObject {

    @Relationship(type = "authored", direction = Relationship.Direction.INCOMING)
    private InstanceEdit authored;

    @ReactomeTransient
    @JsonIgnore
    @Relationship(type = "physicalEntity", direction = Relationship.Direction.INCOMING)
    private List<CatalystActivity> catalystActivities;

    @Relationship(type = "cellType")
    private List<CellType> cellType;

    @Relationship(type = "compartment")
    private SortedSet<HasCompartment> compartment;

    @ReactomeTransient
    @JsonIgnore
    @Relationship(type = "hasComponent", direction = Relationship.Direction.INCOMING)
    private SortedSet<HasComponentForComplex> componentOf;

    @ReactomeTransient
    @Relationship(type = "input", direction = Relationship.Direction.INCOMING)
    private List<InputForReactionLikeEvent> consumedByEvent;

    @Relationship(type = "crossReference")
    private List<DatabaseIdentifier> crossReference;

    @ReactomeProperty
    private String definition;

    @Relationship(type = "disease")
    private List<Disease> disease;

    @Relationship(type = "edited", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> edited;

    @Relationship(type = "figure")
    private List<Figure> figure;

    @Relationship(type = "goCellularComponent")
    private GO_CellularComponent goCellularComponent;

    @ReactomeTransient
    @Relationship(type = "inferredTo", direction = Relationship.Direction.INCOMING)
    private List<PhysicalEntity> inferredFrom;

    @Relationship(type = "inferredTo")
    private List<PhysicalEntity> inferredTo;

    @ReactomeProperty(addedField = true)
    private Boolean isInDisease;

    @ReactomeTransient
    @JsonIgnore
    @Relationship(type = "regulator", direction = Relationship.Direction.INCOMING)
    private List<Requirement> isRequired;

    @Relationship(type = "literatureReference")
    private List<Publication> literatureReference;

    @ReactomeTransient
    @Relationship(type = "marker", direction = Relationship.Direction.INCOMING)
    private List<MarkerReference> markingReferences;

    @ReactomeTransient
    @JsonIgnore
    @Relationship(type = "hasMember", direction = Relationship.Direction.INCOMING)
    private List<PhysicalEntity> memberOf;

    @ReactomeProperty
    private List<String> name;

    @ReactomeTransient
    @JsonIgnore
    @Relationship(type = "regulator", direction = Relationship.Direction.INCOMING)
    private List<NegativeRegulation> negativelyRegulates;

    @ReactomeTransient
    @JsonIgnore
    @Relationship(type = "regulator", direction = Relationship.Direction.INCOMING)
    private List<PositiveRegulation> positivelyRegulates;

    @ReactomeTransient
    @Relationship(type = "output", direction = Relationship.Direction.INCOMING)
    private List<OutputForReactionLikeEvent> producedByEvent;

    @ReactomeTransient
    @JsonIgnore
    @Relationship(type = "repeatedUnit", direction = Relationship.Direction.INCOMING)
    private Set<RepeatedUnitForPhysicalEntity> repeatedUnitOf;

    @Relationship(type = "reviewed", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> reviewed;

    @Relationship(type = "revised", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> revised;

    @ReactomeProperty(addedField = true)
    private String speciesName;

    @Relationship(type = "summation")
    private List<Summation> summation;

    @ReactomeProperty
    private String systematicName;

    public PhysicalEntity() {}

    public PhysicalEntity(Long dbId) { super(dbId); }

    public InstanceEdit getAuthored() { return authored; }

    public void setAuthored(InstanceEdit authored) {
        this.authored = authored;
    }

    public List<CatalystActivity> getCatalystActivities() { return catalystActivities; }

    public void setCatalystActivities(List<CatalystActivity> catalystActivities) {
        this.catalystActivities = catalystActivities;
    }

    public List<CellType> getCellType() { return cellType; }

    public void setCellType(List<CellType> cellType) {
        this.cellType = cellType;
    }

    public List<Compartment> getCompartment(){
        List<Compartment> rtn = null;
        if (this.compartment != null) {
            rtn = new ArrayList<>();
            for (HasCompartment compartment : this.compartment) {
                rtn.add(compartment.getCompartment());
            }
        }
        return rtn;
    }

    public void setCompartment(List<Compartment> compartment) {
        if (compartment == null) return;
        Map<Long, HasCompartment> map = new LinkedHashMap<>();
        int order = 0;
        for (Compartment compartment : compartment) {
            relInst = new HasCompartment();
            relInst.setCompartment(compartment);
            relInst.setOrder(order++);
            map.put(compartment.getDB_ID(), relInst);
        }
        this.compartment = new TreeSet<>(map.values());
    }


    public void setComponentOf(SortedSet<HasComponentForComplex> componentOf) {
        this.componentOf = componentOf;
    }

    public List<ReactionLikeEvent> getConsumedByEvent(){
        List<ReactionLikeEvent> rtn = null;
        if (this.consumedByEvent != null) {
            rtn = new ArrayList<>();
            for (InputForReactionLikeEvent consumedByEvent : this.consumedByEvent) {
                rtn.add(consumedByEvent.getReactionLikeEvent());
            }
        }
        return rtn;
    }

    public List<DatabaseIdentifier> getCrossReference() { return crossReference; }

    public void setCrossReference(List<DatabaseIdentifier> crossReference) {
        this.crossReference = crossReference;
    }

    public String getDefinition() { return definition; }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    public List<Disease> getDisease() { return disease; }

    public void setDisease(List<Disease> disease) {
        this.disease = disease;
    }

    public List<InstanceEdit> getEdited() { return edited; }

    public void setEdited(List<InstanceEdit> edited) {
        this.edited = edited;
    }

    public List<Figure> getFigure() { return figure; }

    public void setFigure(List<Figure> figure) {
        this.figure = figure;
    }

    public GO_CellularComponent getGoCellularComponent() { return goCellularComponent; }

    public void setGoCellularComponent(GO_CellularComponent goCellularComponent) {
        this.goCellularComponent = goCellularComponent;
    }

    public List<PhysicalEntity> getInferredFrom() { return inferredFrom; }

    public void setInferredFrom(List<PhysicalEntity> inferredFrom) {
        this.inferredFrom = inferredFrom;
    }

    public List<PhysicalEntity> getInferredTo() { return inferredTo; }

    public void setInferredTo(List<PhysicalEntity> inferredTo) {
        this.inferredTo = inferredTo;
    }

    public Boolean getIsInDisease() { return isInDisease; }

    public void setIsInDisease(Boolean isInDisease) {
        this.isInDisease = isInDisease;
    }

    public List<Requirement> getIsRequired() { return isRequired; }

    public void setIsRequired(List<Requirement> isRequired) {
        this.isRequired = isRequired;
    }

    public List<Publication> getLiteratureReference() { return literatureReference; }

    public void setLiteratureReference(List<Publication> literatureReference) {
        this.literatureReference = literatureReference;
    }

    public List<MarkerReference> getMarkingReferences() { return markingReferences; }

    public void setMarkingReferences(List<MarkerReference> markingReferences) {
        this.markingReferences = markingReferences;
    }

    public List<PhysicalEntity> getMemberOf() { return memberOf; }

    public void setMemberOf(List<PhysicalEntity> memberOf) {
        this.memberOf = memberOf;
    }

    public List<String> getName() { return name; }

    public void setName(List<String> name) {
        this.name = name;
    }

    public List<NegativeRegulation> getNegativelyRegulates() { return negativelyRegulates; }

    public void setNegativelyRegulates(List<NegativeRegulation> negativelyRegulates) {
        this.negativelyRegulates = negativelyRegulates;
    }

    public List<PositiveRegulation> getPositivelyRegulates() { return positivelyRegulates; }

    public void setPositivelyRegulates(List<PositiveRegulation> positivelyRegulates) {
        this.positivelyRegulates = positivelyRegulates;
    }

    public List<ReactionLikeEvent> getProducedByEvent(){
        List<ReactionLikeEvent> rtn = null;
        if (this.producedByEvent != null) {
            rtn = new ArrayList<>();
            for (OutputForReactionLikeEvent producedByEvent : this.producedByEvent) {
                rtn.add(producedByEvent.getReactionLikeEvent());
            }
        }
        return rtn;
    }

    public List<Polymer> getRepeatedUnitOf(){
        List<Polymer> rtn = null;
        if (this.repeatedUnitOf != null) {
            rtn = new ArrayList<>();
            for (RepeatedUnitForPhysicalEntity repeatedUnitOf : this.repeatedUnitOf) {
                rtn.add(repeatedUnitOf.getPolymer());
            }
        }
        return rtn;
    }

    public void setRepeatedUnitOf(List<Polymer> repeatedUnitOf) {
        if (repeatedUnitOf == null) return;
        Map<Long, RepeatedUnitForPhysicalEntity> map = new LinkedHashMap<>();
        int order = 0;
        for (Polymer polymer : repeatedUnitOf) {
            relInst = new RepeatedUnitForPhysicalEntity();
            relInst.setPolymer(polymer);
            relInst.setOrder(order++);
            map.put(polymer.getDB_ID(), relInst);
        }
        this.repeatedUnitOf = new TreeSet<>(map.values());
    }


    public List<InstanceEdit> getReviewed() { return reviewed; }

    public void setReviewed(List<InstanceEdit> reviewed) {
        this.reviewed = reviewed;
    }

    public List<InstanceEdit> getRevised() { return revised; }

    public void setRevised(List<InstanceEdit> revised) {
        this.revised = revised;
    }

    @ReactomeSchemaIgnore
    public String getSpeciesName() { return speciesName; }

    public void setSpeciesName(String speciesName) {
        this.speciesName = speciesName;
    }

    public List<Summation> getSummation() { return summation; }

    public void setSummation(List<Summation> summation) {
        this.summation = summation;
    }

    public String getSystematicName() { return systematicName; }

    public void setSystematicName(String systematicName) {
        this.systematicName = systematicName;
    }

}
