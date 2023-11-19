package org.reactome.server.graph.curator.domain.model;

import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;

@Node
@SuppressWarnings("unused")
public class FragmentReplacedModification extends FragmentModification {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeInstanceDefiningValue(category = "all")
    @ReactomeProperty
    private String alteredAminoAcidFragment;

    public FragmentReplacedModification() {}

    public String getAlteredAminoAcidFragment() { return alteredAminoAcidFragment; }

    public void setAlteredAminoAcidFragment(String alteredAminoAcidFragment) {
        this.alteredAminoAcidFragment = alteredAminoAcidFragment;
    }

}
