package es.alxarafe.alixar.authentication.api;

public final class UserEndpoints {

    public static final String BASE_PATH = "/api/users";
    public static final String ME_RELATIVE_PATH = "/me";
    public static final String PASSWORD_RELATIVE_PATH = "/me/password";
    public static final String ME_PATH = BASE_PATH + ME_RELATIVE_PATH;
    public static final String PASSWORD_PATH = BASE_PATH + PASSWORD_RELATIVE_PATH;

    private UserEndpoints() {
    }
}
