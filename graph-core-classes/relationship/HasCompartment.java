package org.reactome.server.graph.domain.relationship;

import java.util.Objects;
import org.reactome.server.graph.domain.model.Compartment;
import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.RelationshipProperties;
import org.springframework.data.neo4j.core.schema.TargetNode;

@RelationshipProperties
@SuppressWarnings("unused")
public class HasCompartment implements Comparable<HasCompartment> {

    @TargetNode
    private Compartment compartment;

    @Id
    @GeneratedValue
    private Long id;

    private Integer order;

    public HasCompartment() {}

    public Compartment getCompartment() { return compartment; }

    public void setCompartment(Compartment compartment) {
        this.compartment = compartment;
    }

    public Integer getOrder() { return order; }

    public void setOrder(Integer order) {
        this.order = order;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        return Objects.equals(physicalEntity, ((HasCompartment) o).physicalEntity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(physicalEntity);
    }

    @Override
    public int compareTo(HasCompartment o) {
        return this.order - o.order;
    }

}
