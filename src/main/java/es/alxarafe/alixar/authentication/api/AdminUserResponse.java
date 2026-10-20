package es.alxarafe.alixar.authentication.api;

import java.time.Instant;
import java.util.List;
import java.util.UUID;

record AdminUserResponse(
    UUID id,
    String username,
    String email,
    boolean enabled,
    Instant createdAt,
    Instant updatedAt,
    List<String> roles
) {
}
