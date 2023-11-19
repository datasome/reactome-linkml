package org.reactome.server.graph.curator.domain.relationship;

import java.util.Objects;
import org.reactome.server.graph.curator.domain.model.Pathway;
import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.RelationshipProperties;
import org.springframework.data.neo4j.core.schema.TargetNode;

@RelationshipProperties
public class RepresentedPathway implements Comparable<RepresentedPathway> {

    @Id
    @GeneratedValue
    private Long id;

    private Integer order;

    @TargetNode
    private Pathway pathway;

    private Integer stoichiometry = 1;

    public RepresentedPathway() {}

    public Integer getOrder() { return order; }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Pathway getPathway() { return pathway; }

    public void setPathway(Pathway pathway) {
        this.pathway = pathway;
    }

    public Integer getStoichiometry() { return stoichiometry; }

    public void setStoichiometry(Integer stoichiometry) {
        this.stoichiometry = stoichiometry;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        return Objects.equals(physicalEntity, ((RepresentedPathway) o).physicalEntity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(physicalEntity);
    }

    @Override
    public int compareTo(RepresentedPathway o) {
        return this.order - o.order;
    }

}
