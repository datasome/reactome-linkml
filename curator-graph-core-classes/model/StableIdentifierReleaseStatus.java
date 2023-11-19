package org.reactome.server.graph.curator.domain.model;

import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;

@Node
public class StableIdentifierReleaseStatus extends DatabaseObject {

    @ReactomeProperty
    @ReactomeInstanceDefiningValue(category = "all")
    private Integer releaseNumber;

    @ReactomeProperty
    @ReactomeInstanceDefiningValue(category = "all")
    private ReleaseStatus status;

    public Integer getReleaseNumber() { return releaseNumber; }

    public void setReleaseNumber(Integer releaseNumber) {
        this.releaseNumber = releaseNumber;
    }

    public ReleaseStatus getStatus() { return status; }

    public void setStatus(ReleaseStatus status) {
        this.status = status;
    }

    private static enum ReleaseStatus {
        EXISTS,
        CREATED,
        INCREMENTED,
        REPLACED,
        ORTHO
    }


}
