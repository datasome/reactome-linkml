package org.reactome.server.graph.domain.relationship;

import java.util.Objects;
import org.reactome.server.graph.domain.model.Polymer;
import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.RelationshipProperties;
import org.springframework.data.neo4j.core.schema.TargetNode;

@RelationshipProperties
public class RepeatedUnitForPhysicalEntity implements Comparable<RepeatedUnitForPhysicalEntity> {

    @Id
    @GeneratedValue
    private Long id;

    private Integer order;

    @TargetNode
    private Polymer polymer;

    private Integer stoichiometry = 1;

    public RepeatedUnitForPhysicalEntity() {}

    public Integer getOrder() { return order; }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Polymer getPolymer() { return polymer; }

    public void setPolymer(Polymer polymer) {
        this.polymer = polymer;
    }

    public Integer getStoichiometry() { return stoichiometry; }

    public void setStoichiometry(Integer stoichiometry) {
        this.stoichiometry = stoichiometry;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        return Objects.equals(physicalEntity, ((RepeatedUnitForPhysicalEntity) o).physicalEntity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(physicalEntity);
    }

    @Override
    public int compareTo(RepeatedUnitForPhysicalEntity o) {
        return this.order - o.order;
    }

}
