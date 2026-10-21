package es.alxarafe.alixar.authentication.application;

import java.util.Objects;

/**
 * Result of replacing the roles assigned to a user.
 *
 * <p>{@code changed} is true only when the normalized role set differed from
 * the previous assignment.</p>
 */
public record ReplaceAdminUserRolesResult(AdminUser user, boolean changed) {

    public ReplaceAdminUserRolesResult {
        Objects.requireNonNull(user, "user");
    }
}
