package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.curator.domain.relationship.PublicationAuthor;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public abstract class Publication extends DatabaseObject {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "all")
    @Relationship(type = "author", direction = Relationship.Direction.INCOMING)
    private SortedSet<PublicationAuthor> author;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeInstanceDefiningValue(category = "any")
    @ReactomeProperty
    private String title;

    public Publication() {}

    public Publication(Long dbId) { super(dbId); }

    public String getTitle() { return title; }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Person> getAuthor() {
        if (author == null) return null;
        List<Person> rtn = new ArrayList<>();
        for (PublicationAuthor author : author) {
            rtn.add(author.getAuthor());
        }
        return rtn;
    }


    public void setAuthor(List<Person> author) {
        this.author = new TreeSet<>();
        int order = 0;
        for (Person person : author) {
            PublicationAuthor aux = new PublicationAuthor();
            aux.setAuthor(person);
            aux.setOrder(order++);
            this.author.add(aux);
        }
    }


}
