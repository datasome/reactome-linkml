package org.reactome.server.graph.curator.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.curator.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.curator.domain.relationship.HasCompartment;
import org.reactome.server.graph.curator.domain.relationship.HasComponent;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class Complex extends PhysicalEntity {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "compartment")
    private Compartment compartment;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "entityOnOtherCell")
    private List<PhysicalEntity> entityOnOtherCell;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "An entity formed by the association of two or more component entities (these components can themselves be complexes). At least one component must be specified. Complexes represent all experimentally verified components and their stoichiometry where this is known but may not include as yet unidentified components";
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "hasComponent")
    private SortedSet<HasComponent> hasComponent;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @Relationship(type = "includedLocation")
    private SortedSet<HasCompartment> includedLocation;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private Boolean isChimeric;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "relatedSpecies")
    private List<Species> relatedSpecies;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "species")
    private List<Species> species;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private Boolean stoichiometryKnown;

    public Complex() {}

    public Complex(Long dbId) { super(dbId); }

    public Compartment getCompartment() { return compartment; }

    public void setCompartment(Compartment compartment) {
        this.compartment = compartment;
    }

    public List<PhysicalEntity> getEntityOnOtherCell() { return entityOnOtherCell; }

    public void setEntityOnOtherCell(List<PhysicalEntity> entityOnOtherCell) {
        this.entityOnOtherCell = entityOnOtherCell;
    }

    public List<PhysicalEntity> getHasComponent(){
        List<PhysicalEntity> rtn = null;
        if (this.hasComponent != null) {
            rtn = new ArrayList<>();
            for (HasComponent hasComponent : this.hasComponent) {
                for (int i = 0; i < hasComponent.getStoichiometry(); i++) {
                    rtn.add(hasComponent.getPhysicalEntity());
                }
            }
        }
        return rtn;
    }

    public void setHasComponent(List<PhysicalEntity> hasComponent) {
        if (hasComponent == null) return;
        Map<Long, HasComponent> map = new LinkedHashMap<>();
        int order = 0;
        for (PhysicalEntity physicalEntity : hasComponent) {
            PhysicalEntity relInst = map.get(physicalEntity.getDB_ID());
            if (relInst != null) {
                relInst.setStoichiometry(relInst.getStoichiometry() + 1);
            } else {
                relInst = new HasComponent();
                relInst.setPhysicalEntity(physicalEntity);
                relInst.setOrder(order++);
                map.put(physicalEntity.getDB_ID(), relInst);
            }
        }
        this.hasComponent = new TreeSet<>(map.values());
    }

    public List<Compartment> getIncludedLocation(){
        List<Compartment> rtn = null;
        if (this.includedLocation != null) {
            rtn = new ArrayList<>();
            for (HasCompartment includedLocation : this.includedLocation) {
                rtn.add(includedLocation.getCompartment());
            }
        }
        return rtn;
    }

    public void setIncludedLocation(SortedSet<HasCompartment> includedLocation) {
        this.includedLocation = includedLocation;
    }

    public Boolean getIsChimeric() { return isChimeric; }

    public void setIsChimeric(Boolean isChimeric) {
        this.isChimeric = isChimeric;
    }

    public List<Species> getRelatedSpecies() { return relatedSpecies; }

    public void setRelatedSpecies(List<Species> relatedSpecies) {
        this.relatedSpecies = relatedSpecies;
    }

    public List<Species> getSpecies() { return species; }

    public void setSpecies(List<Species> species) {
        this.species = species;
    }

    public Boolean getStoichiometryKnown() { return stoichiometryKnown; }

    public void setStoichiometryKnown(Boolean stoichiometryKnown) {
        this.stoichiometryKnown = stoichiometryKnown;
    }

}
