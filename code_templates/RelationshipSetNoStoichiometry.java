    public void set@Attribute@(List<@TargetNodeClass@> hasComponent) {
        if (@attribute@ == null) return;
        Map<Long, @RelationshipClass@> map = new LinkedHashMap<>();
        int order = 0;
        for (@TargetNodeClass@ @targetNodeClass@ : @attribute@) {
            relInst = new @RelationshipClass@();
            relInst.set@TargetNodeClass@(@targetNodeClass@);
            relInst.setOrder(order++);
            map.put(@targetNodeClass@.get@DbId@(), relInst);
        }
        this.@attribute@ = new TreeSet<>(map.values());
    }