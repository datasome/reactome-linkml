    @JsonGetter("publications")
    public List<Publication> getPublications() {
        if (publicationAuthorList == null) return null;
        List<Publication> rtn = new ArrayList<>();
        for (AuthorPublication publicationAuthor : publicationAuthorList) {
            rtn.add(publicationAuthor.getPublication());
        }
        return rtn;
    }