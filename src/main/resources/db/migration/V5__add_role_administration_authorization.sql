ALTER TABLE authentication_role
    ADD COLUMN built_in BOOLEAN NOT NULL DEFAULT FALSE;

ALTER TABLE authentication_user_role
    DROP CONSTRAINT authentication_user_role_role_id_fkey;

ALTER TABLE authentication_user_role
    ADD CONSTRAINT authentication_user_role_role_id_fkey
        FOREIGN KEY (role_id) REFERENCES authentication_role(id) ON DELETE RESTRICT;

INSERT INTO authentication_permission (code, description)
VALUES ('roles.manage', 'Manage roles and their permission assignments');

INSERT INTO authentication_role_permission (role_id, permission_code)
SELECT id, 'roles.manage'
FROM authentication_role
WHERE code = 'system-admin';

UPDATE authentication_role
SET built_in = TRUE
WHERE code = 'system-admin';
