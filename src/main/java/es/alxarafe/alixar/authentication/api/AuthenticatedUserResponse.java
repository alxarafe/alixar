package es.alxarafe.alixar.authentication.api;

import java.util.UUID;

public record AuthenticatedUserResponse(
    UUID id,
    String username,
    String email
) {
}
