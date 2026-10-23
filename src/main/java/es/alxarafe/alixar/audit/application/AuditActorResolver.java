package es.alxarafe.alixar.audit.application;

import java.util.Optional;

/**
 * Resolves the actor of the current authenticated operation.
 */
@FunctionalInterface
public interface AuditActorResolver {

    /**
     * @return the current actor, or empty when no authenticated actor can be
     *     resolved
     */
    Optional<AuditActor> resolveCurrentActor();
}
