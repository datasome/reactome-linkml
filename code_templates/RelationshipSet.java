    public void set@Attribute@(List<@TargetNodeClass@> @attribute@) {
        if (@attribute@ == null) return;
        Map<Long, @RelationshipClass@> map = new LinkedHashMap<>();
        int order = 0;
        for (@TargetNodeClass@ @targetNodeClass@ : @attribute@) {
            @TargetNodeClass@ relInst = map.get(@targetNodeClass@.get@DbId@());
            if (relInst != null) {
                relInst.setStoichiometry(relInst.getStoichiometry() + 1);
            } else {
                relInst = new @RelationshipClass@();
                relInst.set@TargetNodeClass@(@targetNodeClass@);
                relInst.setOrder(order++);
                map.put(@targetNodeClass@.get@DbId@(), relInst);
            }
        }
        this.@attribute@ = new TreeSet<>(map.values());
    }