package org.reactome.server.graph.curator.domain.relationship;

import java.util.Objects;
import org.reactome.server.graph.curator.domain.model.Person;
import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.RelationshipProperties;
import org.springframework.data.neo4j.core.schema.TargetNode;

@RelationshipProperties
public class PublicationAuthor implements Comparable<PublicationAuthor> {

    @TargetNode
    private Person author;

    @Id
    @GeneratedValue
    private Long id;

    private Integer order;

    public Person getAuthor() { return author; }

    public void setAuthor(Person author) {
        this.author = author;
    }

    public Integer getOrder() { return order; }

    public void setOrder(Integer order) {
        this.order = order;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        return Objects.equals(physicalEntity, ((PublicationAuthor) o).physicalEntity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(physicalEntity);
    }

    @Override
    public int compareTo(PublicationAuthor o) {
        return this.order - o.order;
    }

}
