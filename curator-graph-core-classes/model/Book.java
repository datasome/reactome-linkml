package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeInstanceDefiningValue;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class Book extends Publication {

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeInstanceDefiningValue(category = "any")
    @ReactomeProperty
    private String ISBN;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "chapterAuthors")
    private List<Person> chapterAuthors;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeInstanceDefiningValue(category = "any")
    @ReactomeProperty
    private String chapterTitle;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @ReactomeProperty
    private String pages;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.OPTIONAL)
    @Relationship(type = "publisher")
    private Affiliation publisher;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.MANDATORY)
    @ReactomeProperty
    private Integer year;

    public Book() {}

    public String getISBN() { return ISBN; }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public List<Person> getChapterAuthors() { return chapterAuthors; }

    public void setChapterAuthors(List<Person> chapterAuthors) {
        this.chapterAuthors = chapterAuthors;
    }

    public String getChapterTitle() { return chapterTitle; }

    public void setChapterTitle(String chapterTitle) {
        this.chapterTitle = chapterTitle;
    }

    public String getPages() { return pages; }

    public void setPages(String pages) {
        this.pages = pages;
    }

    public Affiliation getPublisher() { return publisher; }

    public void setPublisher(Affiliation publisher) {
        this.publisher = publisher;
    }

    public Integer getYear() { return year; }

    public void setYear(Integer year) {
        this.year = year;
    }

}
