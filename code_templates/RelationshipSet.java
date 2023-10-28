    public void set@Attribute@(List<PhysicalEntity> hasComponent) {
        if (@attribute@ == null) return;
        Map<Long, @RelationshipClass@> map = new LinkedHashMap<>();
        int order = 0;
        for (PhysicalEntity physicalEntity : @attribute@) {
            @RelationshipClass@ component = map.get(physicalEntity.getDbId());
            if (component != null) {
                component.setStoichiometry(component.getStoichiometry() + 1);
            } else {
                component = new @RelationshipClass@();
                component.setPhysicalEntity(physicalEntity);
                component.setOrder(order++);
                map.put(physicalEntity.getDbId(), component);
            }
        }
        this.@attribute@ = new TreeSet<>(map.values());
    }