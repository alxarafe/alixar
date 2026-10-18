ALTER TABLE authentication_user
    ADD COLUMN credentials_version BIGINT NOT NULL DEFAULT 0;

CREATE TABLE authentication_password_reset (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES authentication_user(id) ON DELETE CASCADE,
    token_hash VARCHAR(64) NOT NULL,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    used_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX authentication_password_reset_token_hash_unique
    ON authentication_password_reset (token_hash);

CREATE INDEX authentication_password_reset_user_id_idx
    ON authentication_password_reset (user_id);

CREATE INDEX authentication_password_reset_expires_at_idx
    ON authentication_password_reset (expires_at);