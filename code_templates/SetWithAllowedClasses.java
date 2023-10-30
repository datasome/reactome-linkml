    public void set@Attribute@(@Clazz@ @attribute@) {
        if(@attribute@ == null) return;

        if (@allowed_test_clauses@) {
            this.@attribute@ = @attribute@;
        } else {
            throw new RuntimeException(@attribute@ + @error_msg@);
        }
    }