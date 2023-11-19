package org.reactome.server.graph.curator.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.reactome.server.graph.curator.domain.annotations.ReactomeSchemaIgnore;
import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public class NegativeRegulation extends Regulation {

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "This describes an Event/CatalystActivity that is negatively regulated by the Regulator (e.g., allosteric inhibition, competitive inhibition";
    }

    public NegativeRegulation() {}

}
