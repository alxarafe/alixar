package es.alxarafe.alixar.audit.application;

/**
 * Records authentication security outcomes with their specific guarantees.
 *
 * <p>Successful login audit is mandatory and fail-closed. Login failures and
 * logout are recorded best-effort and isolated, so a failed append must never
 * change the authentication outcome or prevent session destruction.</p>
 */
public interface SecurityAuditTrail {

    void loginSucceeded(AuditActor actor);

    void loginFailed();

    void logout(AuditActor actor);
}
