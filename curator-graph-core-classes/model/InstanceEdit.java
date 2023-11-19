package org.reactome.server.graph.curator.domain.model;

import java.util.*;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

@Node
@SuppressWarnings("unused")
public class InstanceEdit extends DatabaseObject {

    @ReactomeProperty
    private String _applyToAllEditedInstances;

    @Relationship(type = "author", direction = Relationship.Direction.INCOMING)
    private List<Person> author;

    @ReactomeProperty
    private String dateTime;

    @ReactomeProperty
    private String note;

    public InstanceEdit() {}

    public InstanceEdit(Long dbId) { super(dbId); }

    public String get_applyToAllEditedInstances() { return _applyToAllEditedInstances; }

    public void set_applyToAllEditedInstances(String _applyToAllEditedInstances) {
        this._applyToAllEditedInstances = _applyToAllEditedInstances;
    }

    public List<Person> getAuthor() { return author; }

    public void setAuthor(List<Person> author) {
        this.author = author;
    }

    public String getDateTime() { return dateTime; }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getNote() { return note; }

    public void setNote(String note) {
        this.note = note;
    }

}
