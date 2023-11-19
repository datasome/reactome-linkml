package org.reactome.server.graph.domain.model;

import org.springframework.data.neo4j.core.schema.Node;

@Deprecated
@Node
@SuppressWarnings("unused")
public class Ontology extends DatabaseObject {

    private byte[] ontology;

    public Ontology() {}

    public Ontology(byte[] ontology) { this.ontology = ontology; }

    public byte[] getOntology() { return ontology; }

    public void setOntology(byte[] ontology) {
        this.ontology = ontology;
    }

}
