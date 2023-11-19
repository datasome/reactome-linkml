package org.reactome.server.graph.domain.model;

import java.util.*;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class EntityFunctionalStatus extends DatabaseObject {

    @Relationship(type = "diseaseEntity")
    private PhysicalEntity diseaseEntity;

    @Relationship(type = "functionalStatus")
    private List<FunctionalStatus> functionalStatus;

    @Relationship(type = "normalEntity")
    private PhysicalEntity normalEntity;

    public EntityFunctionalStatus() {}

    public PhysicalEntity getDiseaseEntity() { return diseaseEntity; }

    public void setDiseaseEntity(PhysicalEntity diseaseEntity) {
        this.diseaseEntity = diseaseEntity;
    }

    public List<FunctionalStatus> getFunctionalStatus() { return functionalStatus; }

    public void setFunctionalStatus(List<FunctionalStatus> functionalStatus) {
        this.functionalStatus = functionalStatus;
    }

    public PhysicalEntity getNormalEntity() { return normalEntity; }

    public void setNormalEntity(PhysicalEntity normalEntity) {
        this.normalEntity = normalEntity;
    }

}
