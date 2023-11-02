    public String getUrl() {
        if (pubMedIdentifier != null) {
            return PUBMED_URL + pubMedIdentifier;
        }
        return null;
    }