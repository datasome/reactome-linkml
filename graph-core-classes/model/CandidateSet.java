package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.domain.relationship.HasCandidate;
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

    @Relationship(type = "hasCandidate")
    private SortedSet<HasCandidate> hasCandidate;

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


}
