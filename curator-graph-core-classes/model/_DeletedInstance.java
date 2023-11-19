package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Relationship;

public class _DeletedInstance extends DatabaseObject {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @ReactomeProperty
    private String className;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @ReactomeInstanceDefiningValue(category = "all")
    @ReactomeProperty
    private Long deletedInstanceDB_ID;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "deletedStableIdentifier")
    private StableIdentifier deletedStableIdentifier;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @ReactomeProperty
    @ReactomeInstanceDefiningValue(category = "all")
    private String name;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @Relationship(type = "species")
    @ReactomeInstanceDefiningValue(category = "all")
    private List<Taxon> species;

    public _DeletedInstance() {}

    public String getClassName() { return className; }

    public void setClassName(String className) {
        this.className = className;
    }

    public Long getDeletedInstanceDB_ID() { return deletedInstanceDB_ID; }

    public void setDeletedInstanceDB_ID(Long deletedInstanceDB_ID) {
        this.deletedInstanceDB_ID = deletedInstanceDB_ID;
    }

    public StableIdentifier getDeletedStableIdentifier() { return deletedStableIdentifier; }

    public void setDeletedStableIdentifier(StableIdentifier deletedStableIdentifier) {
        this.deletedStableIdentifier = deletedStableIdentifier;
    }

    public String getName() { return name; }

    public void setName(String name) {
        this.name = name;
    }

    public List<Taxon> getSpecies() { return species; }

    public void setSpecies(List<Taxon> species) {
        this.species = species;
    }

}
