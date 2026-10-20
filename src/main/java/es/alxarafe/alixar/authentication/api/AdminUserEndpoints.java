package es.alxarafe.alixar.authentication.api;

/**
 * Reserved namespace for the administrative user routes introduced by
 * ALIXAR-DEV-003F. No administrative controller exists yet; the security
 * matcher protects this namespace with the {@code users.manage} permission so
 * the future routes inherit the authorization boundary.
 */
public final class AdminUserEndpoints {

    public static final String BASE_PATH = "/api/admin/users";
    public static final String PATH_PATTERN = BASE_PATH + "/**";

    private AdminUserEndpoints() {
    }
}
