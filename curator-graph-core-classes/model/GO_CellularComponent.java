package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class GO_CellularComponent extends DatabaseObject {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "any")
    @ReactomeProperty
    private String accession;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "componentOf")
    private List<GO_CellularComponent> componentOf;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private String definition;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "hasPart")
    private List<GO_CellularComponent> hasPart;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "instanceOf")
    private List<GO_CellularComponent> instanceOf;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeProperty
    private List<String> name;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "referenceDatabase")
    private ReferenceDatabase referenceDatabase;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "surroundedBy")
    private List<GO_CellularComponent> surroundedBy;

    public GO_CellularComponent() {}

    public GO_CellularComponent(Long dbId) { super(dbId); }

    public String getAccession() { return accession; }

    public void setAccession(String accession) {
        this.accession = accession;
    }

    public List<GO_CellularComponent> getComponentOf() { return componentOf; }

    public void setComponentOf(List<GO_CellularComponent> componentOf) {
        this.componentOf = componentOf;
    }

    public String getDefinition() { return definition; }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    public List<GO_CellularComponent> getHasPart() { return hasPart; }

    public void setHasPart(List<GO_CellularComponent> hasPart) {
        this.hasPart = hasPart;
    }

    public List<GO_CellularComponent> getInstanceOf() { return instanceOf; }

    public void setInstanceOf(List<GO_CellularComponent> instanceOf) {
        this.instanceOf = instanceOf;
    }

    public List<String> getName() { return name; }

    public void setName(List<String> name) {
        this.name = name;
    }

    public ReferenceDatabase getReferenceDatabase() { return referenceDatabase; }

    public void setReferenceDatabase(ReferenceDatabase referenceDatabase) {
        this.referenceDatabase = referenceDatabase;
    }

    public List<GO_CellularComponent> getSurroundedBy() { return surroundedBy; }

    public void setSurroundedBy(List<GO_CellularComponent> surroundedBy) {
        this.surroundedBy = surroundedBy;
    }

}
