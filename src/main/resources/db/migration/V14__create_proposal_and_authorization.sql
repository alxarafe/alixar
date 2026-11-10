-- COM-01 snapshots; calculation rules and functional limits are owned by sales.
CREATE TABLE sales_proposal (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    third_party_id BIGINT NOT NULL,
    currency VARCHAR(3) NOT NULL CHECK (currency = 'EUR'),
    state VARCHAR(16) NOT NULL CHECK (state = 'DRAFT'),
    version BIGINT NOT NULL CHECK (version > 0),
    monetary_policy_id VARCHAR(128) NOT NULL CHECK (btrim(monetary_policy_id) <> ''),
    created_at TIMESTAMPTZ NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL,
    CONSTRAINT sales_proposal_third_party_id_fkey FOREIGN KEY (third_party_id)
        REFERENCES third_party(id) ON DELETE RESTRICT
);
CREATE INDEX sales_proposal_third_party_id_id_idx ON sales_proposal (third_party_id, id);

CREATE TABLE sales_proposal_line (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    proposal_id BIGINT NOT NULL REFERENCES sales_proposal(id) ON DELETE RESTRICT,
    position INTEGER NOT NULL CHECK (position BETWEEN 1 AND 1000),
    description VARCHAR(2000) NOT NULL CHECK (btrim(description) <> '' AND description = btrim(description)),
    quantity NUMERIC(19,6) NOT NULL CHECK (quantity > 0),
    unit_net_price NUMERIC(19,6) NOT NULL CHECK (unit_net_price >= 0),
    vat_rate NUMERIC(7,4) NOT NULL CHECK (vat_rate BETWEEN 0 AND 100),
    net_amount NUMERIC(19,2) NOT NULL CHECK (net_amount >= 0),
    tax_amount NUMERIC(19,2) NOT NULL CHECK (tax_amount >= 0),
    gross_amount NUMERIC(19,2) NOT NULL CHECK (gross_amount = net_amount + tax_amount),
    UNIQUE (proposal_id, position),
    UNIQUE (proposal_id, id)
);

INSERT INTO authentication_permission (code, description)
VALUES ('proposals.manage', 'Create proposals'), ('proposals.read', 'Read proposals');
INSERT INTO authentication_role_permission (role_id, permission_code)
SELECT id, permission.code FROM authentication_role
CROSS JOIN (VALUES ('proposals.manage'), ('proposals.read')) AS permission(code)
WHERE authentication_role.code = 'system-admin';
