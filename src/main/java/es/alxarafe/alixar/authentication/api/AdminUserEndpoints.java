package es.alxarafe.alixar.authentication.api;

public final class AdminUserEndpoints {

    public static final String ADMIN_BASE_PATH = "/api/admin";
    public static final String BASE_PATH = ADMIN_BASE_PATH + "/users";
    public static final String USERS_PATH_PATTERN = BASE_PATH + "/**";
    public static final String ROLES_BASE_PATH = ADMIN_BASE_PATH + "/roles";
    public static final String ROLES_PATH_PATTERN = ROLES_BASE_PATH + "/**";
    public static final String ROLE_RELATIVE_PATH = "/{code}";
    public static final String ROLE_CODE_PATH_VARIABLE = "code";
    public static final String PERMISSIONS_BASE_PATH = ADMIN_BASE_PATH + "/permissions";
    public static final String USER_RELATIVE_PATH = "/{id}";
    public static final String ENABLED_RELATIVE_PATH = USER_RELATIVE_PATH + "/enabled";
    public static final String PASSWORD_RESET_RELATIVE_PATH = USER_RELATIVE_PATH + "/password-reset";
    public static final String ROLES_RELATIVE_PATH = USER_RELATIVE_PATH + "/roles";
    public static final String ID_PATH_VARIABLE = "id";
    public static final String PAGE_PARAM = "page";
    public static final String SIZE_PARAM = "size";
    public static final String QUERY_PARAM = "q";
    public static final String ENABLED_PARAM = "enabled";

    private AdminUserEndpoints() {
    }
}
