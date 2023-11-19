package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public class FailedReaction extends ReactionLikeEvent {

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "Defines an event where genetic mutations in the nucleotide sequence produces a protein with a very little or no activity. The consequence of this is that substrates are not converted to products and can therefore build up to cause pathological conditions. It could also mean entities are not moved between compartments again causing imbalances in entity concentrations which can lead to pathological conditions.";
    }

    public FailedReaction() {}

}
