package es.alxarafe.alixar.authentication.application;

import java.util.Objects;

/**
 * Result of an administrative enablement change.
 *
 * <p>{@code changed} is true only when the requested state differed from the
 * previous state.</p>
 */
public record SetAdminUserEnabledResult(AdminUser user, boolean changed) {

    public SetAdminUserEnabledResult {
        Objects.requireNonNull(user, "user");
    }
}
