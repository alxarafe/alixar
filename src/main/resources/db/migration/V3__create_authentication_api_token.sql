CREATE TABLE authentication_api_token (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES authentication_user(id) ON DELETE CASCADE,
    name VARCHAR NOT NULL CHECK (btrim(name) <> ''),
    token_hash VARCHAR(64) NOT NULL,
    credentials_version BIGINT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    last_used_at TIMESTAMP WITH TIME ZONE,
    revoked_at TIMESTAMP WITH TIME ZONE
);

CREATE UNIQUE INDEX authentication_api_token_token_hash_unique
    ON authentication_api_token (token_hash);

CREATE INDEX authentication_api_token_user_id_idx
    ON authentication_api_token (user_id);
