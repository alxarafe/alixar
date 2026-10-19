package es.alxarafe.alixar.authentication.application;

public final class PasswordPolicy {

    public static final int MIN_LENGTH = 12;

    private PasswordPolicy() {
    }

    public static void ensureValid(String password) {
        if (password == null || password.length() < MIN_LENGTH) {
            throw new InvalidPasswordException();
        }
    }
}
