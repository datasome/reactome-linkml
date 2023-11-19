package org.reactome.server.graph.domain.model;

import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public class DrugType extends DatabaseObject {

    @ReactomeProperty
    private String definition;

    @ReactomeProperty
    private List<String> name;

    public DrugType() {}

    public String getDefinition() { return definition; }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    public List<String> getName() { return name; }

    public void setName(List<String> name) {
        this.name = name;
    }

}
