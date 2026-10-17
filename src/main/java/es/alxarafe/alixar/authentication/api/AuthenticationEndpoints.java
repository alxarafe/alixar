package es.alxarafe.alixar.authentication.api;

public final class AuthenticationEndpoints {

    public static final String BASE_PATH = "/api/auth";
    public static final String LOGIN_RELATIVE_PATH = "/login";
    public static final String LOGOUT_RELATIVE_PATH = "/logout";
    public static final String ME_RELATIVE_PATH = "/me";
    public static final String LOGIN_PATH = BASE_PATH + LOGIN_RELATIVE_PATH;
    public static final String LOGOUT_PATH = BASE_PATH + LOGOUT_RELATIVE_PATH;
    public static final String ME_PATH = BASE_PATH + ME_RELATIVE_PATH;

    private AuthenticationEndpoints() {
    }
}
