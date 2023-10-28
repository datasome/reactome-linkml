    public List<PhysicalEntity> get@Attribute@(){
        List<PhysicalEntity> rtn = null;
        if (this.@attribute@ != null) {
            rtn = new ArrayList<>();
            for (@RelationshipClass@ @attribute@ : this.@attribute@) {
                for (int i = 0; i < @attribute@.getStoichiometry(); i++) {
                    rtn.add(@attribute@.getPhysicalEntity());
                }
            }
        }
        return rtn;
    }