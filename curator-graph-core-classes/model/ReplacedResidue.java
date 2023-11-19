package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class ReplacedResidue extends GeneticallyModifiedResidue {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.REQUIRED)
    @ReactomeInstanceDefiningValue(category = "all")
    @ReactomeProperty
    private Integer coordinate;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "psiMod")
    private List<PsiMod> psiMod;

    public ReplacedResidue() {}

    public Integer getCoordinate() { return coordinate; }

    public void setCoordinate(Integer coordinate) {
        this.coordinate = coordinate;
    }

    public List<PsiMod> getPsiMod() { return psiMod; }

    public void setPsiMod(List<PsiMod> psiMod) {
        this.psiMod = psiMod;
    }

}
