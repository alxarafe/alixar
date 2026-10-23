package es.alxarafe.alixar.authentication.application;

import java.util.Objects;

/**
 * Result of replacing the permissions assigned to a role.
 *
 * <p>{@code changed} is true only when the normalized permission set differed
 * from the previous assignment.</p>
 */
public record ReplaceRolePermissionsResult(RoleDefinition role, boolean changed) {

    public ReplaceRolePermissionsResult {
        Objects.requireNonNull(role, "role");
    }
}
