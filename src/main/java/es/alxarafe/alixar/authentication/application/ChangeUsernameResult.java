package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.util.Objects;

/**
 * Result of a self-service username change.
 *
 * <p>{@code changed} is true only when the normalized username differed from
 * the previous value.</p>
 */
public record ChangeUsernameResult(User user, boolean changed) {

    public ChangeUsernameResult {
        Objects.requireNonNull(user, "user");
    }
}
