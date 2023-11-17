    @ReactomeSchemaIgnore
    @JsonIgnore
    public String getSimplifiedDatabaseName() {
        return databaseName.replace(" ", "-");
    }
