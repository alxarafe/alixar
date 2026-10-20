package es.alxarafe.alixar.authentication.api;

public final class AdminUserEndpoints {

    public static final String ADMIN_BASE_PATH = "/api/admin";
    public static final String BASE_PATH = ADMIN_BASE_PATH + "/users";
    public static final String PATH_PATTERN = ADMIN_BASE_PATH + "/**";
    public static final String ROLES_BASE_PATH = ADMIN_BASE_PATH + "/roles";
    public static final String USER_RELATIVE_PATH = "/{id}";
    public static final String ID_PATH_VARIABLE = "id";
    public static final String PAGE_PARAM = "page";
    public static final String SIZE_PARAM = "size";
    public static final String QUERY_PARAM = "q";
    public static final String ENABLED_PARAM = "enabled";

    private AdminUserEndpoints() {
    }
}
