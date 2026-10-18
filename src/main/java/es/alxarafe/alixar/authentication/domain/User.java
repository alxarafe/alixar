package es.alxarafe.alixar.authentication.domain;

import java.time.Instant;
import java.util.UUID;

public record User(
    UUID id,
    String username,
    String email,
    String passwordHash,
    boolean enabled,
    Instant createdAt,
    Instant updatedAt
) {
}
