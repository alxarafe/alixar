CREATE TABLE audit_chain_head (
    chain_id UUID PRIMARY KEY,
    last_sequence BIGINT NOT NULL CHECK (last_sequence >= 0),
    last_hash VARCHAR(64) NOT NULL CHECK (last_hash ~ '^[0-9a-f]{64}$'),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE audit_event (
    id UUID PRIMARY KEY,
    chain_id UUID NOT NULL REFERENCES audit_chain_head(chain_id) ON DELETE RESTRICT,
    sequence BIGINT NOT NULL CHECK (sequence > 0),
    occurred_at TIMESTAMP WITH TIME ZONE NOT NULL,
    actor_user_id UUID,
    actor_username VARCHAR(100),
    authentication_type VARCHAR(16)
        CHECK (authentication_type IS NULL OR authentication_type IN ('SESSION', 'PAT', 'SYSTEM')),
    action VARCHAR(100) NOT NULL CHECK (btrim(action) <> ''),
    resource_type VARCHAR(100),
    resource_id VARCHAR(255),
    result VARCHAR(16) NOT NULL CHECK (result IN ('SUCCESS', 'FAILURE', 'DENIED')),
    request_id VARCHAR(128),
    integrity_format_version SMALLINT NOT NULL CHECK (integrity_format_version > 0),
    previous_hash VARCHAR(64) NOT NULL CHECK (previous_hash ~ '^[0-9a-f]{64}$'),
    event_hash VARCHAR(64) NOT NULL CHECK (event_hash ~ '^[0-9a-f]{64}$'),
    CONSTRAINT audit_event_chain_sequence_unique UNIQUE (chain_id, sequence),
    CONSTRAINT audit_event_chain_event_hash_unique UNIQUE (chain_id, event_hash)
);

CREATE INDEX audit_event_chain_occurred_at_idx
    ON audit_event (chain_id, occurred_at);

INSERT INTO audit_chain_head (chain_id, last_sequence, last_hash)
VALUES (
    '00000000-0000-0000-0000-000000000001',
    0,
    repeat('0', 64)
);
