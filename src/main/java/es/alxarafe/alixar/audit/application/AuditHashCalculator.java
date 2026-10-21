package es.alxarafe.alixar.audit.application;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HexFormat;

public class AuditHashCalculator {

    public static final String ALGORITHM = "SHA-256";
    public static final int HASH_HEX_LENGTH = 64;

    public String sha256Hex(byte[] input) {
        try {
            byte[] digest = MessageDigest.getInstance(ALGORITHM).digest(input);
            return HexFormat.of().formatHex(digest);
        } catch (NoSuchAlgorithmException exception) {
            throw new IllegalStateException("Required hash algorithm is not available: " + ALGORITHM, exception);
        }
    }
}
