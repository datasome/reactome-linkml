package org.reactome.server.graph.curator.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.curator.domain.relationship.HasCandidate;
import org.reactome.server.graph.curator.domain.relationship.HasMember;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class CandidateSet extends EntitySet {

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "A set of entities that are interchangeable in function, with two subclasses, members that are hypothetical and members that have been demonstrated. Hypothetical members are identified as values of the hasCandidate slot. Members that have been demonstrated are identified in the hasMember slot. At least one hasCandidate value is required; hasMember values are optional";
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "hasCandidate")
    private SortedSet<HasCandidate> hasCandidate;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "hasMember")
    private SortedSet<HasMember> hasMember;

    public CandidateSet() {}

    public List<PhysicalEntity> getHasCandidate(){
        List<PhysicalEntity> rtn = null;
        if (this.hasCandidate != null) {
            rtn = new ArrayList<>();
            for (HasCandidate hasCandidate : this.hasCandidate) {
                rtn.add(hasCandidate.getPhysicalEntity());
            }
        }
        return rtn;
    }

    public void setHasCandidate(List<PhysicalEntity> hasCandidate) {
        if (hasCandidate == null) return;
        Map<Long, HasCandidate> map = new LinkedHashMap<>();
        int order = 0;
        for (PhysicalEntity physicalEntity : hasCandidate) {
            relInst = new HasCandidate();
            relInst.setPhysicalEntity(physicalEntity);
            relInst.setOrder(order++);
            map.put(physicalEntity.getDB_ID(), relInst);
        }
        this.hasCandidate = new TreeSet<>(map.values());
    }


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


}
