package es.alxarafe.alixar.authentication.domain;

import java.time.Instant;
import java.util.UUID;

public record PasswordResetToken(
    UUID id,
    UUID userId,
    String tokenHash,
    Instant expiresAt,
    Instant usedAt,
    Instant createdAt
) {
    public boolean isUsed() {
        return usedAt != null;
    }

    public boolean isExpired(Instant now) {
        return now.isAfter(expiresAt);
    }

    public boolean isValid(Instant now) {
        return !isUsed() && !isExpired(now);
    }
}