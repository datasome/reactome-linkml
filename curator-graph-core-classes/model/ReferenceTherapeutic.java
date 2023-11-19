package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;

@Node
public class ReferenceTherapeutic extends ReferenceEntity {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private String abbreviation;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private List<String> activeDrugIds;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private List<String> approvalSource;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeProperty
    private Boolean approved;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @ReactomeProperty
    private String inn;

    @ReactomeProperty
    private List<String> proDrugIds;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @ReactomeProperty
    private String type;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private Boolean withdrawn;

    public ReferenceTherapeutic() {}

    public String getAbbreviation() { return abbreviation; }

    public void setAbbreviation(String abbreviation) {
        this.abbreviation = abbreviation;
    }

    public List<String> getActiveDrugIds() { return activeDrugIds; }

    public void setActiveDrugIds(List<String> activeDrugIds) {
        this.activeDrugIds = activeDrugIds;
    }

    public List<String> getApprovalSource() { return approvalSource; }

    public void setApprovalSource(List<String> approvalSource) {
        this.approvalSource = approvalSource;
    }

    public Boolean getApproved() { return approved; }

    public void setApproved(Boolean approved) {
        this.approved = approved;
    }

    public String getInn() { return inn; }

    public void setInn(String inn) {
        this.inn = inn;
    }

    public List<String> getProDrugIds() { return proDrugIds; }

    public void setProDrugIds(List<String> proDrugIds) {
        this.proDrugIds = proDrugIds;
    }

    public String getType() { return type; }

    public void setType(String type) {
        this.type = type;
    }

    public Boolean getWithdrawn() { return withdrawn; }

    public void setWithdrawn(Boolean withdrawn) {
        this.withdrawn = withdrawn;
    }

}
