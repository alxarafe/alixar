package es.alxarafe.alixar.authentication.application;

import java.security.SecureRandom;
import java.util.Base64;

public class PasswordResetTokenGenerator {

    private static final SecureRandom SECURE_RANDOM = new SecureRandom();
    private static final int TOKEN_BYTES = 32; // 256 bits
    private static final Base64.Encoder URL_ENCODER = Base64.getUrlEncoder().withoutPadding();

    private PasswordResetTokenGenerator() {
    }

    public static String generate() {
        byte[] randomBytes = new byte[TOKEN_BYTES];
        SECURE_RANDOM.nextBytes(randomBytes);
        return URL_ENCODER.encodeToString(randomBytes);
    }
}