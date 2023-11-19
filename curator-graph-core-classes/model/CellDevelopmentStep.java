package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
public class CellDevelopmentStep extends ReactionlikeEvent {

    @Relationship(type = "catalystActivity")
    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeInstanceDefiningValue(category = "all")
    private List<CatalystActivity> catalystActivity;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "requiredInputComponent")
    private Set<PhysicalEntity> requiredInputComponent;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @Relationship(type = "tissue")
    private Anatomy tissue;

    public CellDevelopmentStep() {}

    public List<CatalystActivity> getCatalystActivity() { return catalystActivity; }

    public void setCatalystActivity(List<CatalystActivity> catalystActivity) {
        this.catalystActivity = catalystActivity;
    }

    public Set<PhysicalEntity> getRequiredInputComponent() { return requiredInputComponent; }

    public void setRequiredInputComponent(Set<PhysicalEntity> requiredInputComponent) {
        this.requiredInputComponent = requiredInputComponent;
    }

    public Anatomy getTissue() { return tissue; }

    public void setTissue(Anatomy tissue) {
        this.tissue = tissue;
    }

}
