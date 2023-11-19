package org.reactome.server.graph.domain.relationship;

import java.util.Objects;
import org.reactome.server.graph.domain.model.ReactionLikeEvent;
import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.RelationshipProperties;
import org.springframework.data.neo4j.core.schema.TargetNode;

@RelationshipProperties
public class OutputForReactionLikeEvent implements Comparable<OutputForReactionLikeEvent> {

    @Id
    @GeneratedValue
    private Long id;

    private Integer order;

    @TargetNode
    private ReactionLikeEvent reactionLikeEvent;

    private Integer stoichiometry = 1;

    public OutputForReactionLikeEvent() {}

    public Integer getOrder() { return order; }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public ReactionLikeEvent getReactionLikeEvent() { return reactionLikeEvent; }

    public void setReactionLikeEvent(ReactionLikeEvent reactionLikeEvent) {
        this.reactionLikeEvent = reactionLikeEvent;
    }

    public Integer getStoichiometry() { return stoichiometry; }

    public void setStoichiometry(Integer stoichiometry) {
        this.stoichiometry = stoichiometry;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        return Objects.equals(physicalEntity, ((OutputForReactionLikeEvent) o).physicalEntity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(physicalEntity);
    }

    @Override
    public int compareTo(OutputForReactionLikeEvent o) {
        return this.order - o.order;
    }

}
