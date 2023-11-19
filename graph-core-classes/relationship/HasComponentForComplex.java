package org.reactome.server.graph.domain.relationship;

import java.util.Objects;
import org.reactome.server.graph.domain.model.Complex;
import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.RelationshipProperties;
import org.springframework.data.neo4j.core.schema.TargetNode;

@RelationshipProperties
@SuppressWarnings("unused")
public class HasComponentForComplex implements Comparable<HasComponentForComplex> {

    @TargetNode
    private Complex complex;

    @Id
    @GeneratedValue
    private Long id;

    private Integer order;

    private Integer stoichiometry = 1;

    public HasComponentForComplex() {}

    public Complex getComplex() { return complex; }

    public void setComplex(Complex complex) {
        this.complex = complex;
    }

    public Integer getOrder() { return order; }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Integer getStoichiometry() { return stoichiometry; }

    public void setStoichiometry(Integer stoichiometry) {
        this.stoichiometry = stoichiometry;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        return Objects.equals(physicalEntity, ((HasComponentForComplex) o).physicalEntity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(physicalEntity);
    }

    @Override
    public int compareTo(HasComponentForComplex o) {
        return this.order - o.order;
    }

}
