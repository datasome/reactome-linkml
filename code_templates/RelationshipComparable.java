    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        return Objects.equals(physicalEntity, ((@RelationshipClass@) o).physicalEntity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(physicalEntity);
    }

    @Override
    public int compareTo(@RelationshipClass@ o) {
        return this.order - o.order;
    }