package es.alxarafe.alixar.authentication.application;

import java.util.Objects;
import java.util.UUID;

/**
 * Identity of the user whose password was reset through a recovery token.
 */
public record ResetPasswordResult(UUID userId, String username) {

    public ResetPasswordResult {
        Objects.requireNonNull(userId, "userId");
        Objects.requireNonNull(username, "username");
        if (username.isBlank()) {
            throw new IllegalArgumentException("username must not be blank");
        }
    }
}
