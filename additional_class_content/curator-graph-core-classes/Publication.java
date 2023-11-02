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
