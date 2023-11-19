package org.reactome.server.graph.curator.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.curator.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.curator.domain.relationship.RepeatedUnit;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class Polymer extends PhysicalEntity {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @Relationship(type = "compartment")
    private List<Compartment> compartment;

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "Molecules that consist of an indeterminate number of repeated units. Includes complexes whose stoichiometry is variable or unknown. The repeated unit(s) is(are) identified in the repeatedUnit slot";
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private Integer maxUnitCount;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private Integer minUnitCount;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "repeatedUnit")
    private SortedSet<RepeatedUnit> repeatedUnit;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "species")
    private List<Species> species;

    public Polymer() {}

    public Polymer(Long dbId) { super(dbId); }

    public List<Compartment> getCompartment() { return compartment; }

    public void setCompartment(List<Compartment> compartment) {
        this.compartment = compartment;
    }

    public Integer getMaxUnitCount() { return maxUnitCount; }

    public void setMaxUnitCount(Integer maxUnitCount) {
        this.maxUnitCount = maxUnitCount;
    }

    public Integer getMinUnitCount() { return minUnitCount; }

    public void setMinUnitCount(Integer minUnitCount) {
        this.minUnitCount = minUnitCount;
    }

    public List<PhysicalEntity> getRepeatedUnit(){
        List<PhysicalEntity> rtn = null;
        if (this.repeatedUnit != null) {
            rtn = new ArrayList<>();
            for (RepeatedUnit repeatedUnit : this.repeatedUnit) {
                for (int i = 0; i < repeatedUnit.getStoichiometry(); i++) {
                    rtn.add(repeatedUnit.getPhysicalEntity());
                }
            }
        }
        return rtn;
    }

    public void setRepeatedUnit(List<PhysicalEntity> repeatedUnit) {
        if (repeatedUnit == null) return;
        Map<Long, RepeatedUnit> map = new LinkedHashMap<>();
        int order = 0;
        for (PhysicalEntity physicalEntity : repeatedUnit) {
            PhysicalEntity relInst = map.get(physicalEntity.getDB_ID());
            if (relInst != null) {
                relInst.setStoichiometry(relInst.getStoichiometry() + 1);
            } else {
                relInst = new RepeatedUnit();
                relInst.setPhysicalEntity(physicalEntity);
                relInst.setOrder(order++);
                map.put(physicalEntity.getDB_ID(), relInst);
            }
        }
        this.repeatedUnit = new TreeSet<>(map.values());
    }

    public List<Species> getSpecies() { return species; }

    public void setSpecies(List<Species> species) {
        this.species = species;
    }

}
