package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.domain.relationship.HasMember;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class EntitySet extends PhysicalEntity {

    @ReactomeSchemaIgnore
    @Override
    public String getClassName() {
        return "Set";
    }

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "Two or more entities grouped because of a shared molecular feature. The superclass for CandidateSet and DefinedSet";
    }

    @Relationship(type = "hasMember")
    private SortedSet<HasMember> hasMember;

    @ReactomeProperty
    private Boolean isOrdered;

    @Relationship(type = "relatedSpecies")
    private List<Species> relatedSpecies;

    @Relationship(type = "species")
    private List<Species> species;

    public EntitySet() {}

    public List<PhysicalEntity> getHasMember(){
        List<PhysicalEntity> rtn = null;
        if (this.hasMember != null) {
            rtn = new ArrayList<>();
            for (HasMember hasMember : this.hasMember) {
                rtn.add(hasMember.getPhysicalEntity());
            }
        }
        return rtn;
    }

    public void setHasMember(List<PhysicalEntity> hasMember) {
        if (hasMember == null) return;
        Map<Long, HasMember> map = new LinkedHashMap<>();
        int order = 0;
        for (PhysicalEntity physicalEntity : hasMember) {
            relInst = new HasMember();
            relInst.setPhysicalEntity(physicalEntity);
            relInst.setOrder(order++);
            map.put(physicalEntity.getDB_ID(), relInst);
        }
        this.hasMember = new TreeSet<>(map.values());
    }


    public Boolean getIsOrdered() { return isOrdered; }

    public void setIsOrdered(Boolean isOrdered) {
        this.isOrdered = isOrdered;
    }

    public List<Species> getRelatedSpecies() { return relatedSpecies; }

    public void setRelatedSpecies(List<Species> relatedSpecies) {
        this.relatedSpecies = relatedSpecies;
    }

    public List<Species> getSpecies() { return species; }

    public void setSpecies(List<Species> species) {
        this.species = species;
    }

}
