ALTER TABLE audit_configuration
    DROP CONSTRAINT audit_configuration_mode_check;

ALTER TABLE audit_configuration
    ADD CONSTRAINT audit_configuration_mode_check
    CHECK (mode IN ('OFF', 'BASIC', 'SELECTIVE'));

CREATE TABLE audit_read_policy (
    audit_configuration_id UUID NOT NULL,
    resource_type VARCHAR(32) NOT NULL
        CHECK (resource_type IN ('USER', 'ROLE')),
    read_level VARCHAR(32) NOT NULL
        CHECK (read_level IN ('QUERY_ONLY', 'QUERY_AND_OBJECT')),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    CONSTRAINT audit_read_policy_pk
        PRIMARY KEY (audit_configuration_id, resource_type),
    CONSTRAINT audit_read_policy_configuration_fk
        FOREIGN KEY (audit_configuration_id)
        REFERENCES audit_configuration (id)
        ON DELETE RESTRICT
);
