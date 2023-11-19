package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public class Polymerisation extends ReactionLikeEvent {

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "Reactions that follow the pattern: Polymer + Unit -> Polymer (there may be a catalyst involved). Used to describe the mechanistic detail of a polymerisation";
    }

    public Polymerisation() {}

}
