package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
public class CellLineagePath extends Pathway {

    @ReactomeSchemaIgnore
    @JsonIgnore
    @Override
    public String getExplanation() {
        return ;
    }

    @Relationship(type = "tissue")
    private Anatomy tissue;

    public CellLineagePath() {}

    public Anatomy getTissue() { return tissue; }

    public void setTissue(Anatomy tissue) {
        this.tissue = tissue;
    }

}
