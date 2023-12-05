package org.reactome.server.graph.domain.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import org.reactome.server.graph.domain.annotations.ReactomeProperty;
import org.reactome.server.graph.domain.annotations.ReactomeSchemaIgnore;
import org.reactome.server.graph.domain.annotations.ReactomeTransient;
import org.reactome.server.graph.domain.result.DatabaseObjectLike;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;
import org.springframework.lang.NonNull;

@Node
@SuppressWarnings("unused")
@JsonIdentityInfo(generator = ObjectIdGenerators, property = "dbId")
public abstract class DatabaseObject implements Serializable, Comparable<DatabaseObject>, DatabaseObjectLike {

    @ReactomeSchemaIgnore
    public String getClassName() {
        return getClass().getSimpleName();
    }

    @Relationship(type = "created", direction = Relationship.Direction.INCOMING)
    private InstanceEdit created;

    @Id
    protected Long dbId;

    private String displayName;

    @ReactomeSchemaIgnore
    @JsonIgnore
    public String getExplanation() {
        return "Not available";
    }

    @ReactomeTransient
    public transient Boolean isLoaded = false;

    @Relationship(type = "modified", direction = Relationship.Direction.INCOMING)
    private InstanceEdit modified;

    @JsonIgnore
    private transient String oldStId;

    @ReactomeTransient
    public transient Boolean preventLazyLoading = false;

    @ReactomeProperty(addedField = true)
    private String stId;

    private String stIdVersion;

    public DatabaseObject() {}

    public DatabaseObject(Long dbId) { this.dbId = dbId; }

    public InstanceEdit getCreated() { return created; }

    public void setCreated(InstanceEdit created) {
        this.created = created;
    }

    public Long getDbId() { return dbId; }

    public void setDbId(Long dbId) {
        this.dbId = dbId;
    }

    public String getDisplayName() { return displayName; }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public InstanceEdit getModified() { return modified; }

    public void setModified(InstanceEdit modified) {
        this.modified = modified;
    }

    public String getStId() { return stId; }

    public void setStId(String stId) {
        this.stId = stId;
    }

    public String getStIdVersion() { return stIdVersion; }

    public void setStIdVersion(String stIdVersion) {
        this.stIdVersion = stIdVersion;
    }

    @Override
    public String toString() {
        return getClass().getSimpleName() + " {" +
                (stId == null ? "dbId=" + dbId : "dbId=" + dbId + ", stId='" + stId + '\'') +
                ", displayName='" + displayName + '\'' +
                "}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DatabaseObject that = (DatabaseObject) o;
        return dbId != null ? dbId.equals(that.dbId) : that.dbId == null && (stId != null ? stId.equals(that.stId) : that.stId == null && Objects.equals(displayName, that.displayName));
    }

    @Override
    public int hashCode() {
        int result = dbId != null ? dbId.hashCode() : 0;
        result = 31 * result + (stId != null ? stId.hashCode() : 0);
        result = 31 * result + (displayName != null ? displayName.hashCode() : 0);
        return result;
    }

    @Override
    public int compareTo(@NonNull DatabaseObject o) {
        return this.dbId.compareTo(o.dbId);
    }

    public final String getSchemaClass() {
        return getClass().getSimpleName();
    }

    public static DatabaseObject emptyObject() {
        return new Pathway();
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
