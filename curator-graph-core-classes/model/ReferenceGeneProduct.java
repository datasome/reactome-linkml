package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class ReferenceGeneProduct extends ReferenceSequence {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private String _chainChangeLog;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private List<String> chain;

    @Relationship(type = "referenceGene")
    private List<ReferenceDNASequence> referenceGene;

    @Relationship(type = "referenceTranscript")
    private List<ReferenceRNASequence> referenceTranscript;

    public ReferenceGeneProduct() {}

    public String get_chainChangeLog() { return _chainChangeLog; }

    public void set_chainChangeLog(String _chainChangeLog) {
        this._chainChangeLog = _chainChangeLog;
    }

    public List<String> getChain() { return chain; }

    public void setChain(List<String> chain) {
        this.chain = chain;
    }

    public List<ReferenceDNASequence> getReferenceGene() { return referenceGene; }

    public void setReferenceGene(List<ReferenceDNASequence> referenceGene) {
        this.referenceGene = referenceGene;
    }

    public List<ReferenceRNASequence> getReferenceTranscript() { return referenceTranscript; }

    public void setReferenceTranscript(List<ReferenceRNASequence> referenceTranscript) {
        this.referenceTranscript = referenceTranscript;
    }

}
