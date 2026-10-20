package es.alxarafe.alixar.authentication.application;

import java.util.List;

public record RoleDefinition(
    String code,
    String name,
    boolean builtIn,
    List<String> permissionCodes
) {

    public RoleDefinition {
        permissionCodes = permissionCodes.stream().sorted().toList();
    }
}
