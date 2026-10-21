INSERT INTO authentication_permission (code, description)
VALUES ('audit.read', 'Read audit events');

INSERT INTO authentication_role_permission (role_id, permission_code)
SELECT id, 'audit.read'
FROM authentication_role
WHERE code = 'system-admin';
