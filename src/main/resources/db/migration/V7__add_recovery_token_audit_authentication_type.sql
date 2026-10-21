ALTER TABLE audit_event
    DROP CONSTRAINT IF EXISTS audit_event_authentication_type_check;

ALTER TABLE audit_event
    ADD CONSTRAINT audit_event_authentication_type_check
    CHECK (
        authentication_type IS NULL
        OR authentication_type IN ('SESSION', 'PAT', 'SYSTEM', 'RECOVERY_TOKEN')
    );
