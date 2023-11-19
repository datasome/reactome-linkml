package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class ReferenceSequence extends ReferenceEntity {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @ReactomeProperty
    private String checksum;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private List<String> comment;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private List<String> description;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private List<String> geneName;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private Boolean isSequenceChanged;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private List<String> keyword;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @ReactomeProperty
    private List<String> otherIdentifier;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private List<String> secondaryIdentifier;

    @ReactomeProperty
    private Integer sequenceLength;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "species")
    @ReactomeInstanceDefiningValue(category = "all")
    private Species species;

    public ReferenceSequence() {}

    public String getChecksum() { return checksum; }

    public void setChecksum(String checksum) {
        this.checksum = checksum;
    }

    public List<String> getComment() { return comment; }

    public void setComment(List<String> comment) {
        this.comment = comment;
    }

    public List<String> getDescription() { return description; }

    public void setDescription(List<String> description) {
        this.description = description;
    }

    public List<String> getGeneName() { return geneName; }

    public void setGeneName(List<String> geneName) {
        this.geneName = geneName;
    }

    public Boolean getIsSequenceChanged() { return isSequenceChanged; }

    public void setIsSequenceChanged(Boolean isSequenceChanged) {
        this.isSequenceChanged = isSequenceChanged;
    }

    public List<String> getKeyword() { return keyword; }

    public void setKeyword(List<String> keyword) {
        this.keyword = keyword;
    }

    public List<String> getOtherIdentifier() { return otherIdentifier; }

    public void setOtherIdentifier(List<String> otherIdentifier) {
        this.otherIdentifier = otherIdentifier;
    }

    public List<String> getSecondaryIdentifier() { return secondaryIdentifier; }

    public void setSecondaryIdentifier(List<String> secondaryIdentifier) {
        this.secondaryIdentifier = secondaryIdentifier;
    }

    public Integer getSequenceLength() { return sequenceLength; }

    public void setSequenceLength(Integer sequenceLength) {
        this.sequenceLength = sequenceLength;
    }

    public Species getSpecies() { return species; }

    public void setSpecies(Species species) {
        this.species = species;
    }

}
