package es.alxarafe.alixar.audit.api;

public final class AuditEndpoints {

    public static final String BASE_PATH = "/api/admin/audit-events";
    public static final String VERIFICATION_RELATIVE_PATH = "/verification";
    public static final String VERIFICATION_PATH = BASE_PATH + VERIFICATION_RELATIVE_PATH;

    private AuditEndpoints() {
    }
}
