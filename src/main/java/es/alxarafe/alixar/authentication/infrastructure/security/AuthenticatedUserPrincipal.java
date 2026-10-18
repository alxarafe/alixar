package es.alxarafe.alixar.authentication.infrastructure.security;

import java.io.Serializable;
import java.util.UUID;

public record AuthenticatedUserPrincipal(
    UUID id,
    String username,
    String email,
    long credentialsVersion
) implements Serializable {
}
