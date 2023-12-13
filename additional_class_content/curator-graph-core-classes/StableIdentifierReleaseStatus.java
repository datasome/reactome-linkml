    private static enum ReleaseStatus {
        EXISTS,
        CREATED,
        INCREMENTED,
        REPLACED,
        ORTHO
    }

    public String getStatus() {
        return status.toString();
    }

    public void setStatus(String status) {
        this.status = ReleaseStatus.valueOf(status);
    }
