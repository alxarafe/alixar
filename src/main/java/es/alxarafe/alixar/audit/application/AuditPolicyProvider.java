package es.alxarafe.alixar.audit.application;

/**
 * Supplies the effective audit policy at runtime.
 */
public interface AuditPolicyProvider {

    AuditMode currentMode();

    AuditPolicy currentPolicy();
}
