package es.alxarafe.alixar.authentication.application;

import java.util.List;
import java.util.Objects;
import java.util.UUID;

public record RoleDefinition(
    UUID id,
    String code,
    String name,
    boolean builtIn,
    List<String> permissionCodes
) {

    public RoleDefinition {
        Objects.requireNonNull(id, "id");
        permissionCodes = permissionCodes.stream().sorted().toList();
    }
}
