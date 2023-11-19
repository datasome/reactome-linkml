package org.reactome.server.graph.domain.relationship;

import java.util.Objects;
import org.reactome.server.graph.domain.model.Event;
import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.RelationshipProperties;
import org.springframework.data.neo4j.core.schema.TargetNode;

@RelationshipProperties
public class HasEncapsulatedEvent implements Comparable<HasEncapsulatedEvent> {

    @TargetNode
    private Event event;

    @Id
    @GeneratedValue
    private Long id;

    private Integer order;

    public Event getEvent() { return event; }

    public void setEvent(Event event) {
        this.event = event;
    }

    public Integer getOrder() { return order; }

    public void setOrder(Integer order) {
        this.order = order;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        return Objects.equals(physicalEntity, ((HasEncapsulatedEvent) o).physicalEntity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(physicalEntity);
    }

    @Override
    public int compareTo(HasEncapsulatedEvent o) {
        return this.order - o.order;
    }

}
