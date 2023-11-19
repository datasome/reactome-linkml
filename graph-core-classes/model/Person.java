package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonGetter;
import java.util.*;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeTransient;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class Person extends DatabaseObject {

    @Relationship(type = "affiliation")
    private List<Affiliation> affiliation;

    @Deprecated
    @Relationship(type = "crossReference")
    private List<DatabaseIdentifier> crossReference;

    @ReactomeProperty
    private String firstname;

    @ReactomeProperty(addedField = true)
    private String initial;

    @ReactomeProperty
    private String orcidId;

    @ReactomeProperty
    private String project;

    @ReactomeTransient
    @Relationship(type = "author")
    private List<AuthorPublication> publicationAuthorList;

    @ReactomeProperty
    private String surname;

    public Person() {}

    public List<Affiliation> getAffiliation() { return affiliation; }

    public void setAffiliation(List<Affiliation> affiliation) {
        this.affiliation = affiliation;
    }

    @Deprecated
    public List<DatabaseIdentifier> getCrossReference() { return crossReference; }

    @Deprecated
    public void setCrossReference(List<DatabaseIdentifier> crossReference) {
        this.crossReference = crossReference;
    }

    public String getFirstname() { return firstname; }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getInitial() { return initial; }

    public void setInitial(String initial) {
        this.initial = initial;
    }

    public String getOrcidId() { return orcidId; }

    public void setOrcidId(String orcidId) {
        this.orcidId = orcidId;
    }

    public String getProject() { return project; }

    public void setProject(String project) {
        this.project = project;
    }

    public String getSurname() { return surname; }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    @JsonGetter("publications")
    public List<Publication> getPublications() {
        if (publicationAuthorList == null) return null;
        List<Publication> rtn = new ArrayList<>();
        for (AuthorPublication publicationAuthor : publicationAuthorList) {
            rtn.add(publicationAuthor.getPublication());
        }
        return rtn;
    }

}
