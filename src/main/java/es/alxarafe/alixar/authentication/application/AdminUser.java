package es.alxarafe.alixar.authentication.application;

import java.time.Instant;
import java.util.List;
import java.util.UUID;

public record AdminUser(
    UUID id,
    String username,
    String email,
    boolean enabled,
    Instant createdAt,
    Instant updatedAt,
    List<String> roleCodes
) {

    public AdminUser {
        roleCodes = List.copyOf(roleCodes);
    }
}
