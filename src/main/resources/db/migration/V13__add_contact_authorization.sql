INSERT INTO authentication_permission (code, description)
VALUES ('contacts.read', 'Read contacts');

INSERT INTO authentication_permission (code, description)
VALUES ('contacts.manage', 'Manage contacts');

INSERT INTO authentication_role_permission (role_id, permission_code)
SELECT id, 'contacts.read'
FROM authentication_role
WHERE code = 'system-admin';

INSERT INTO authentication_role_permission (role_id, permission_code)
SELECT id, 'contacts.manage'
FROM authentication_role
WHERE code = 'system-admin';
