package es.alxarafe.alixar.audit.application;

import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import java.util.Objects;
import java.util.UUID;

/**
 * Authenticated actor responsible for an audited operation.
 *
 * <p>{@code username} is a snapshot. It is not updated when the user later
 * changes its username.</p>
 */
public record AuditActor(
    UUID userId,
    String username,
    AuditAuthenticationType authenticationType
) {

    public AuditActor {
        Objects.requireNonNull(userId, "userId");
        Objects.requireNonNull(username, "username");
        Objects.requireNonNull(authenticationType, "authenticationType");
        if (username.isBlank()) {
            throw new IllegalArgumentException("username must not be blank");
        }
    }
}
