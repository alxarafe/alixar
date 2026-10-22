package es.alxarafe.alixar.audit.application;

/**
 * Records authentication and authorization security outcomes with their
 * specific guarantees.
 *
 * <p>Successful login audit is mandatory and fail-closed. Login failures,
 * logout and authorization denials are recorded best-effort and isolated, so a
 * failed append must never change the original security outcome or prevent
 * session destruction.</p>
 */
public interface SecurityAuditTrail {

    void loginSucceeded(AuditActor actor);

    void loginFailed();

    void logout(AuditActor actor);

    void accessDenied(AuditActor actor, String resourceId);
}
