CREATE TABLE authentication_role (
    id UUID PRIMARY KEY,
    code VARCHAR(100) NOT NULL UNIQUE CHECK (btrim(code) <> ''),
    name VARCHAR(255) NOT NULL CHECK (btrim(name) <> '')
);

CREATE TABLE authentication_permission (
    code VARCHAR(100) PRIMARY KEY CHECK (btrim(code) <> ''),
    description VARCHAR(500) NOT NULL CHECK (btrim(description) <> '')
);

CREATE TABLE authentication_role_permission (
    role_id UUID NOT NULL REFERENCES authentication_role(id) ON DELETE CASCADE,
    permission_code VARCHAR(100) NOT NULL REFERENCES authentication_permission(code) ON DELETE CASCADE,
    PRIMARY KEY (role_id, permission_code)
);

CREATE TABLE authentication_user_role (
    user_id UUID NOT NULL REFERENCES authentication_user(id) ON DELETE CASCADE,
    role_id UUID NOT NULL REFERENCES authentication_role(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, role_id)
);

CREATE INDEX authentication_role_permission_permission_code_idx
    ON authentication_role_permission (permission_code);

CREATE INDEX authentication_user_role_role_id_idx
    ON authentication_user_role (role_id);

INSERT INTO authentication_permission (code, description)
VALUES ('users.manage', 'Manage users');

INSERT INTO authentication_role (id, code, name)
VALUES ('3b0c4b5e-7f2a-4d1e-9c8b-6a5f4e3d2c1b', 'system-admin', 'System administrator');

INSERT INTO authentication_role_permission (role_id, permission_code)
VALUES ('3b0c4b5e-7f2a-4d1e-9c8b-6a5f4e3d2c1b', 'users.manage');
