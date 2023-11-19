package org.reactome.server.graph.domain.model;

import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class Taxon extends DatabaseObject {

    @Deprecated
    @Relationship(type = "crossReference")
    private List<DatabaseIdentifier> crossReference;

    @ReactomeProperty
    private List<String> name;

    @Relationship(type = "superTaxon")
    private Taxon superTaxon;

    @ReactomeProperty(addedField = true)
    private String taxId;

    public Taxon() {}

    @Deprecated
    public List<DatabaseIdentifier> getCrossReference() { return crossReference; }

    @Deprecated
    public void setCrossReference(List<DatabaseIdentifier> crossReference) {
        this.crossReference = crossReference;
    }

    public List<String> getName() { return name; }

    public void setName(List<String> name) {
        this.name = name;
    }

    public Taxon getSuperTaxon() { return superTaxon; }

    public void setSuperTaxon(Taxon superTaxon) {
        this.superTaxon = superTaxon;
    }

    public String getTaxId() { return taxId; }

    public void setTaxId(String taxId) {
        this.taxId = taxId;
    }

}
