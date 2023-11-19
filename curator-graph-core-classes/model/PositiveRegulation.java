package org.reactome.server.graph.curator.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.reactome.server.graph.curator.domain.annotations.ReactomeSchemaIgnore;
import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public class PositiveRegulation extends Regulation {

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return "This describes an Event/CatalystActivity that is positively regulated by the Regulator (e.g., allosteric activation)";
    }

    public PositiveRegulation() {}

}
