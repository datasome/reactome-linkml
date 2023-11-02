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