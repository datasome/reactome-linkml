package org.reactome.server.graph.domain.relationship;

import java.util.Objects;
import org.reactome.server.graph.domain.model.Event;
import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.RelationshipProperties;
import org.springframework.data.neo4j.core.schema.TargetNode;

@RelationshipProperties
public class HasEvent implements Comparable<HasEvent> {

    @TargetNode
    private Event event;

    @Id
    @GeneratedValue
    private Long id;

    private Integer order;

    private Integer stoichiometry;

    public Event getEvent() { return event; }

    public void setEvent(Event event) {
        this.event = event;
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
        return Objects.equals(physicalEntity, ((HasEvent) o).physicalEntity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(physicalEntity);
    }

    @Override
    public int compareTo(HasEvent o) {
        return this.order - o.order;
    }

}
