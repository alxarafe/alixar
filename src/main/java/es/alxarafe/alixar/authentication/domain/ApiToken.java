package es.alxarafe.alixar.authentication.domain;

import java.time.Instant;
import java.util.UUID;

public record ApiToken(
    UUID id,
    UUID userId,
    String name,
    long credentialsVersion,
    Instant createdAt,
    Instant expiresAt,
    Instant lastUsedAt,
    Instant revokedAt
) {
    public boolean isRevoked() {
        return revokedAt != null;
    }

    public boolean isExpired(Instant now) {
        return now.isAfter(expiresAt);
    }

    public boolean isUsable(Instant now) {
        return !isRevoked() && !isExpired(now);
    }
}
