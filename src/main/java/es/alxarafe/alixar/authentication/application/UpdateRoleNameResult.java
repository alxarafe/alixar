package es.alxarafe.alixar.authentication.application;

import java.util.Objects;

/**
 * Result of a role name change.
 *
 * <p>{@code changed} is true only when the normalized name differed from the
 * previous value.</p>
 */
public record UpdateRoleNameResult(RoleDefinition role, boolean changed) {

    public UpdateRoleNameResult {
        Objects.requireNonNull(role, "role");
    }
}
