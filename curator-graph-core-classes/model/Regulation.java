package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class Regulation extends DatabaseObject {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "activeUnit")
    @ReactomeProperty
    private List<PhysicalEntity> activeUnit;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "activity")
    @ReactomeProperty
    private GO_MolecularFunction activity;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "goBiologicalProcess")
    private GO_BiologicalProcess goBiologicalProcess;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "regulator")
    private PhysicalEntity regulator;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "summation")
    private List<Summation> summation;

    public Regulation() {}

    public List<PhysicalEntity> getActiveUnit() { return activeUnit; }

    public void setActiveUnit(List<PhysicalEntity> activeUnit) {
        this.activeUnit = activeUnit;
    }

    public GO_MolecularFunction getActivity() { return activity; }

    public void setActivity(GO_MolecularFunction activity) {
        this.activity = activity;
    }

    public GO_BiologicalProcess getGoBiologicalProcess() { return goBiologicalProcess; }

    public void setGoBiologicalProcess(GO_BiologicalProcess goBiologicalProcess) {
        this.goBiologicalProcess = goBiologicalProcess;
    }

    public PhysicalEntity getRegulator() { return regulator; }

    public void setRegulator(PhysicalEntity regulator) {
        this.regulator = regulator;
    }

    public List<Summation> getSummation() { return summation; }

    public void setSummation(List<Summation> summation) {
        this.summation = summation;
    }

}
