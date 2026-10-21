package es.alxarafe.alixar.authentication.application;

import java.util.Objects;

/**
 * Result of an administrative username change.
 *
 * <p>{@code changed} is true only when the normalized username differed from
 * the previous value.</p>
 */
public record UpdateAdminUsernameResult(AdminUser user, boolean changed) {

    public UpdateAdminUsernameResult {
        Objects.requireNonNull(user, "user");
    }
}
