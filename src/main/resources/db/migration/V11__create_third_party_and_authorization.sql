CREATE TABLE third_party (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(128) NOT NULL CHECK (btrim(name) <> ''),
    customer BOOLEAN NOT NULL DEFAULT FALSE,
    prospect BOOLEAN NOT NULL DEFAULT FALSE,
    supplier BOOLEAN NOT NULL DEFAULT FALSE,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    tax_identifier VARCHAR(128),
    intra_community_vat_number VARCHAR(20),
    address VARCHAR(255),
    postal_code VARCHAR(25),
    town VARCHAR(50),
    country_code VARCHAR(2)
        CHECK (country_code IS NULL OR country_code = upper(country_code)),
    email VARCHAR(128),
    phone VARCHAR(30),
    website VARCHAR(255)
);

INSERT INTO authentication_permission (code, description)
VALUES ('thirdparties.read', 'Read third parties');

INSERT INTO authentication_permission (code, description)
VALUES ('thirdparties.manage', 'Manage third parties');

INSERT INTO authentication_role_permission (role_id, permission_code)
SELECT id, 'thirdparties.read'
FROM authentication_role
WHERE code = 'system-admin';

INSERT INTO authentication_role_permission (role_id, permission_code)
SELECT id, 'thirdparties.manage'
FROM authentication_role
WHERE code = 'system-admin';
