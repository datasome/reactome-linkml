package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.domain.annotations.ReactomeTransient;
import org.reactome.server.graph.domain.relationship.HasCompartment;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class Event extends DatabaseObject implements Trackable, Deletable {

    @Relationship(type = "authored", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> authored;

    @Relationship(type = "compartment")
    private SortedSet<HasCompartment> compartment;

    @Relationship(type = "crossReference")
    private List<DatabaseIdentifier> crossReference;

    @ReactomeProperty
    private String definition;

    @Relationship(type = "disease")
    private List<Disease> disease;

    @Relationship(type = "edited", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> edited;

    @ReactomeTransient
    @JsonIgnore
    @Relationship(type = "hasEvent", direction = Relationship.Direction.INCOMING)
    private List<Pathway> eventOf;

    @Relationship(type = "evidenceType")
    private EvidenceType evidenceType;

    @Relationship(type = "figure")
    private List<Figure> figure;

    @ReactomeTransient
    @JsonIgnore
    @Relationship(type = "precedingEvent", direction = Relationship.Direction.INCOMING)
    private List<Event> followingEvent;

    @Relationship(type = "goBiologicalProcess")
    private GO_BiologicalProcess goBiologicalProcess;

    @Relationship(type = "inferredFrom")
    private Set<Event> inferredFrom;

    @ReactomeProperty(addedField = true)
    private Boolean isInDisease;

    @ReactomeProperty(addedField = true)
    private Boolean isInferred;

    @Relationship(type = "literatureReference")
    private List<Publication> literatureReference;

    @ReactomeProperty
    private List<String> name;

    @Relationship(type = "negativePrecedingEvent")
    private List<NegativePrecedingEvent> negativePrecedingEvent;

    @Relationship(type = "inferredTo")
    private Set<Event> orthologousEvent;

    @Relationship(type = "precedingEvent")
    private List<Event> precedingEvent;

    @Relationship(type = "relatedSpecies")
    private List<Species> relatedSpecies;

    @ReactomeProperty
    private String releaseDate;

    @ReactomeProperty
    private String releaseStatus;

    @Relationship(type = "reviewed", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> reviewed;

    @Relationship(type = "revised", direction = Relationship.Direction.INCOMING)
    private List<InstanceEdit> revised;

    @Relationship(type = "species")
    private List<Species> species;

    @ReactomeProperty(addedField = true)
    private String speciesName;

    @Relationship(type = "summation")
    private List<Summation> summation;

    public Event() {}

    public Event(Long dbId) { super(dbId); }

    public List<InstanceEdit> getAuthored() { return authored; }

    public void setAuthored(List<InstanceEdit> authored) {
        this.authored = authored;
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

    public List<Pathway> getEventOf() { return eventOf; }

    public void setEventOf(List<Pathway> eventOf) {
        this.eventOf = eventOf;
    }

    public EvidenceType getEvidenceType() { return evidenceType; }

    public void setEvidenceType(EvidenceType evidenceType) {
        this.evidenceType = evidenceType;
    }

    public List<Figure> getFigure() { return figure; }

    public void setFigure(List<Figure> figure) {
        this.figure = figure;
    }

    public List<Event> getFollowingEvent() { return followingEvent; }

    public void setFollowingEvent(List<Event> followingEvent) {
        this.followingEvent = followingEvent;
    }

    public GO_BiologicalProcess getGoBiologicalProcess() { return goBiologicalProcess; }

    public void setGoBiologicalProcess(GO_BiologicalProcess goBiologicalProcess) {
        this.goBiologicalProcess = goBiologicalProcess;
    }

    public Set<Event> getInferredFrom() { return inferredFrom; }

    public void setInferredFrom(Set<Event> inferredFrom) {
        this.inferredFrom = inferredFrom;
    }

    public Boolean getIsInDisease() { return isInDisease; }

    public void setIsInDisease(Boolean isInDisease) {
        this.isInDisease = isInDisease;
    }

    public Boolean getIsInferred() { return isInferred; }

    public void setIsInferred(Boolean isInferred) {
        this.isInferred = isInferred;
    }

    public List<Publication> getLiteratureReference() { return literatureReference; }

    public void setLiteratureReference(List<Publication> literatureReference) {
        this.literatureReference = literatureReference;
    }

    public List<String> getName() { return name; }

    public void setName(List<String> name) {
        this.name = name;
    }

    public List<NegativePrecedingEvent> getNegativePrecedingEvent() { return negativePrecedingEvent; }

    public void setNegativePrecedingEvent(List<NegativePrecedingEvent> negativePrecedingEvent) {
        this.negativePrecedingEvent = negativePrecedingEvent;
    }

    public Set<Event> getOrthologousEvent() { return orthologousEvent; }

    public void setOrthologousEvent(Set<Event> orthologousEvent) {
        this.orthologousEvent = orthologousEvent;
    }

    public List<Event> getPrecedingEvent() { return precedingEvent; }

    public void setPrecedingEvent(List<Event> precedingEvent) {
        this.precedingEvent = precedingEvent;
    }

    public List<Species> getRelatedSpecies() { return relatedSpecies; }

    public void setRelatedSpecies(List<Species> relatedSpecies) {
        this.relatedSpecies = relatedSpecies;
    }

    public String getReleaseDate() { return releaseDate; }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getReleaseStatus() { return releaseStatus; }

    public void setReleaseStatus(String releaseStatus) {
        this.releaseStatus = releaseStatus;
    }

    public List<InstanceEdit> getReviewed() { return reviewed; }

    public void setReviewed(List<InstanceEdit> reviewed) {
        this.reviewed = reviewed;
    }

    public List<InstanceEdit> getRevised() { return revised; }

    public void setRevised(List<InstanceEdit> revised) {
        this.revised = revised;
    }

    public List<Species> getSpecies() { return species; }

    public void setSpecies(List<Species> species) {
        this.species = species;
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

}
