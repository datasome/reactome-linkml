    @JsonIgnore
    public List<StoichiometryObject> fetch@RelationshipClass@() {
        List<StoichiometryObject> objects = new ArrayList<>();
        if(@attribute@!=null) {
            for (@RelationshipClass@ aux : @attribute@) {
                objects.add(new StoichiometryObject(aux.getStoichiometry(), aux.getPhysicalEntity()));
            }
            Collections.sort(objects);
        }
        return objects;
    }