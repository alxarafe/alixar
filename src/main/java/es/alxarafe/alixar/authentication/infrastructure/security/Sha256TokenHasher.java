package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.authentication.application.TokenHasher;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HexFormat;

public class Sha256TokenHasher implements TokenHasher {

    private static final String ALGORITHM = "SHA-256";
    private static final HexFormat HEX_FORMAT = HexFormat.of().withUpperCase();

    @Override
    public String hash(String token) {
        try {
            MessageDigest digest = MessageDigest.getInstance(ALGORITHM);
            byte[] hashBytes = digest.digest(token.getBytes(StandardCharsets.UTF_8));
            return HEX_FORMAT.formatHex(hashBytes);
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("SHA-256 algorithm not available", e);
        }
    }

    @Override
    public boolean matches(String token, String tokenHash) {
        return hash(token).equals(tokenHash);
    }
}