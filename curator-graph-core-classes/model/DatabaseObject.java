package org.reactome.server.graph.curator.domain.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import org.reactome.server.graph.curator.domain.annotations.ReactomeConstraint;
import org.reactome.server.graph.curator.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.curator.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.curator.domain.annotations.ReactomeTransient;
import org.reactome.server.graph.curator.domain.result.DatabaseObjectLike;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;
import org.springframework.lang.NonNull;

@Node
@SuppressWarnings("unused")
@JsonIdentityInfo(generator = ObjectIdGenerators, property = "DB_ID")
public abstract class DatabaseObject implements Serializable, Comparable<DatabaseObject>, DatabaseObjectLike {

    @Id
    protected Long DB_ID;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @ReactomeProperty
    private String _displayName;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @ReactomeProperty
    private String _timestamp;

    @ReactomeSchemaIgnore
    public String getClassName() {
        return getClass().getSimpleName();
    }

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @Relationship(type = "created", direction = Relationship.Direction.INCOMING)
    private InstanceEdit created;

    @ReactomeSchemaIgnore
    @JsonIgnore
    public String getExplanation() {
        return "Not available";
    }

    @ReactomeTransient
    public transient Boolean isLoaded = false;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @Relationship(type = "modified", direction = Relationship.Direction.INCOMING)
    private InstanceEdit modified;

    @ReactomeTransient
    public transient Boolean preventLazyLoading = false;

    @ReactomeConstraint(constraint = ReactomeConstraint.Constraint.NOMANUALEDIT)
    @Relationship(type = "stableIdentifier")
    private StableIdentifier stableIdentifier;

    public DatabaseObject() {}

    public DatabaseObject(Long DB_ID) { this.DB_ID = DB_ID; }

    @JsonProperty("DB_ID")
    public Long getDB_ID() { return DB_ID; }

    public void setDB_ID(Long DB_ID) {
        this.DB_ID = DB_ID;
    }

    public String get_displayName() { return _displayName; }

    public void set_displayName(String _displayName) {
        this._displayName = _displayName;
    }

    public String get_timestamp() { return _timestamp; }

    public void set_timestamp(String _timestamp) {
        this._timestamp = _timestamp;
    }

    public InstanceEdit getCreated() { return created; }

    public void setCreated(InstanceEdit created) {
        this.created = created;
    }

    public InstanceEdit getModified() { return modified; }

    public void setModified(InstanceEdit modified) {
        this.modified = modified;
    }

    public StableIdentifier getStableIdentifier() { return stableIdentifier; }

    public void setStableIdentifier(StableIdentifier stableIdentifier) {
        this.stableIdentifier = stableIdentifier;
    }

    @Override
    public String toString() {
        return getClass().getSimpleName() +
                " {DB_ID=" + DB_ID +
                ", displayName='" + _displayName + '\'' +
                "}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DatabaseObject that = (DatabaseObject) o;
        return DB_ID != null ? DB_ID.equals(that.DB_ID) : that.DB_ID == null &&
               Objects.equals(_displayName, that._displayName);
    }

    @Override
    public int hashCode() {
        int result = DB_ID != null ? DB_ID.hashCode() : 0;
        result = 31 * result + (_displayName != null ? _displayName.hashCode() : 0);
        return result;
    }

    @Override
    public int compareTo(@NonNull DatabaseObject o) {
        return this.DB_ID.compareTo(o.DB_ID);
    }

    public static DatabaseObject emptyObject() {
        return new Pathway();
    }

    @ReactomeSchemaIgnore
    @JsonIgnore
    public String getExplanation() {
        return "Not available";
    }

    @ReactomeSchemaIgnore //In some classes it is overridden to provide an easier-to-understand name
    public String getClassName() {
        return getClass().getSimpleName();
    }

    public <T> T fetchSingleValue(String methodName) {
        try {
            Method method = getClass().getMethod(methodName);
            //noinspection unchecked
            return (T) method.invoke(this);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            return null;
        }
    }

    public <T> Collection<T> fetchMultiValue(String methodName) {
        try {
            Method method = this.getClass().getMethod(methodName);
            //noinspection unchecked
            return (Collection<T>) method.invoke(this);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            return new ArrayList<>();
        }
    }

    @ReactomeSchemaIgnore
    @JsonIgnore
    public <T extends DatabaseObject> T preventLazyLoading() {
        return preventLazyLoading(true);
    }

    @SuppressWarnings({"unchecked", "WeakerAccess", "UnusedReturnValue"})
    @ReactomeSchemaIgnore
    @JsonIgnore
    public <T extends DatabaseObject> T preventLazyLoading(boolean preventLazyLoading) {
        if (this.preventLazyLoading == null) this.preventLazyLoading = false;
        if (this.preventLazyLoading == preventLazyLoading) return (T) this;

        this.preventLazyLoading = preventLazyLoading;

        //Here we go through all the getters and prevent LazyLoading for all the objects
        Method[] methods = getClass().getMethods();
        for (Method method : methods) {
            if (!method.getName().startsWith("get")) continue;
            try {
                Class<?> methodReturnClazz = method.getReturnType();

                if (DatabaseObject.class.isAssignableFrom(methodReturnClazz)) {
                    DatabaseObject object = (DatabaseObject) method.invoke(this);
                    if (object != null) {
                        if (object.preventLazyLoading == null) {
                            object.preventLazyLoading = false;
                        }
                        if (object.preventLazyLoading != preventLazyLoading) {
                            object.preventLazyLoading(preventLazyLoading);
                        }
                    }
                }

                if (Collection.class.isAssignableFrom(methodReturnClazz)) {
                    ParameterizedType stringListType = (ParameterizedType) method.getGenericReturnType();
                    Class<?> type = (Class<?>) stringListType.getActualTypeArguments()[0];
                    String clazz = type.getSimpleName();
                    if (DatabaseObject.class.isAssignableFrom(type)) {
                        Collection<T> collection = (Collection<T>) method.invoke(this);
                        if (collection != null) {
                            for (DatabaseObject obj : collection) {
                                DatabaseObject object = obj;
                                if (object != null) {
                                    if (object.preventLazyLoading == null) {
                                        object.preventLazyLoading = false;
                                    }
                                    if (object.preventLazyLoading != preventLazyLoading) {
                                        object.preventLazyLoading(preventLazyLoading);
                                    }
                                }
                            }
                        }
                    }
                }

            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }
        }
        return (T) this;
    }


}
