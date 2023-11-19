package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class TranslationalModification extends AbstractModifiedResidue {

    @ReactomeProperty
    private Integer coordinate;

    @JsonIgnore
    @ReactomeProperty(addedField = true)
    private String label;

    @Relationship(type = "psiMod")
    private PsiMod psiMod;

    public TranslationalModification() {}

    public TranslationalModification(Long dbId) { super(dbId); }

    public Integer getCoordinate() { return coordinate; }

    public void setCoordinate(Integer coordinate) {
        this.coordinate = coordinate;
    }

    public String getLabel() { return label; }

    public void setLabel(String label) {
        this.label = label;
    }

    public PsiMod getPsiMod() { return psiMod; }

    public void setPsiMod(PsiMod psiMod) {
        this.psiMod = psiMod;
    }

}
