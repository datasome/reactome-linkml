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

    private static enum ReleaseStatus {
        EXISTS,
        CREATED,
        INCREMENTED,
        REPLACED,
        ORTHO
    }

    public String getStatus() {
        return status.toString();
    }

    public void setStatus(String status) {
        this.status = ReleaseStatus.valueOf(status);
    }


}
