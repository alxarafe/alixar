package es.alxarafe.alixar.authentication.application;

import java.time.Duration;
import java.time.Instant;

public final class ApiTokenPolicy {

    public static final Duration MAX_LIFETIME = Duration.ofDays(365);

    private ApiTokenPolicy() {
    }

    public static void ensureValidExpiration(Instant now, Instant expiresAt) {
        if (expiresAt == null
            || !expiresAt.isAfter(now)
            || expiresAt.isAfter(now.plus(MAX_LIFETIME))) {
            throw new InvalidApiTokenExpirationException();
        }
    }
}
