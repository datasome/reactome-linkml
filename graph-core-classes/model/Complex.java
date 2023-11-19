package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.domain.relationship.HasCompartment;
import org.reactome.server.graph.domain.relationship.HasComponent;
import org.reactome.server.graph.service.helper.StoichiometryObject;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class Complex extends PhysicalEntity {

    @Relationship(type = "entityOnOtherCell")
    private List<PhysicalEntity> entityOnOtherCell;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "An entity formed by the association of two or more component entities (these components can themselves be complexes). At least one component must be specified. Complexes represent all experimentally verified components and their stoichiometry where this is known but may not include as yet unidentified components";
    }

    @Relationship(type = "hasComponent")
    private SortedSet<HasComponent> hasComponent;

    @Relationship(type = "includedLocation")
    private SortedSet<HasCompartment> includedLocation;

    @ReactomeProperty
    private Boolean isChimeric;

    @Relationship(type = "relatedSpecies")
    private List<Species> relatedSpecies;

    @Relationship(type = "species")
    private List<Species> species;

    @ReactomeProperty
    private Boolean stoichiometryKnown;

    public Complex() {}

    public Complex(Long dbId) { super(dbId); }

    public List<PhysicalEntity> getEntityOnOtherCell() { return entityOnOtherCell; }

    public void setEntityOnOtherCell(List<PhysicalEntity> entityOnOtherCell) {
        this.entityOnOtherCell = entityOnOtherCell;
    }

    @JsonIgnore
    public List<StoichiometryObject> fetchHasComponent() {
        List<StoichiometryObject> objects = new ArrayList<>();
        if(hasComponent!=null) {
            for (HasComponent aux : hasComponent) {
                objects.add(new StoichiometryObject(aux.getStoichiometry(), aux.getPhysicalEntity()));
            }
            Collections.sort(objects);
        }
        return objects;
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
