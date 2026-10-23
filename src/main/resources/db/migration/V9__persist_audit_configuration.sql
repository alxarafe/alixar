CREATE TABLE audit_configuration (
    id UUID PRIMARY KEY,
    singleton BOOLEAN NOT NULL DEFAULT TRUE,
    mode VARCHAR(16) NOT NULL CHECK (mode IN ('OFF', 'BASIC')),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT audit_configuration_singleton CHECK (singleton),
    CONSTRAINT audit_configuration_one_row UNIQUE (singleton)
);

INSERT INTO authentication_permission (code, description)
VALUES ('audit.configure', 'Configure audit policy');

INSERT INTO authentication_role_permission (role_id, permission_code)
SELECT id, 'audit.configure'
FROM authentication_role
WHERE code = 'system-admin';
