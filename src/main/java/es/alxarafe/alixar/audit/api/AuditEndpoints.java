package es.alxarafe.alixar.audit.api;

public final class AuditEndpoints {

    public static final String BASE_PATH = "/api/admin/audit-events";
    public static final String CONFIGURATION_PATH = "/api/admin/audit-configuration";
    public static final String READ_POLICY_RELATIVE_PATH = "/read-policy";
    public static final String READ_POLICY_PATH = CONFIGURATION_PATH + READ_POLICY_RELATIVE_PATH;
    public static final String VERIFICATION_RELATIVE_PATH = "/verification";
    public static final String VERIFICATION_PATH = BASE_PATH + VERIFICATION_RELATIVE_PATH;

    private AuditEndpoints() {
    }
}
