package org.reactome.server.graph.domain.model;

import org.springframework.data.neo4j.core.schema.Node;

@Node
public class DBInfo extends Release {

    private Long checksum;

    private String name;

    public DBInfo() {}

    public Long getChecksum() { return checksum; }

    public void setChecksum(Long checksum) {
        this.checksum = checksum;
    }

    public String getName() { return name; }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * @deprecated
     * Use {@link Release#getReleaseNumber()} instead
     * @return Database version
     */
    @Deprecated
    public int getVersion() {
        return this.getReleaseNumber();
    }


}
