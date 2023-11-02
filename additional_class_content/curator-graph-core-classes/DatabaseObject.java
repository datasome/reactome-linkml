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
