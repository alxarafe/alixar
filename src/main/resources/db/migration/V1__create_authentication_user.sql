CREATE TABLE authentication_user (
    id UUID PRIMARY KEY,
    username VARCHAR(100) NOT NULL CHECK (btrim(username) <> ''),
    email VARCHAR(320) NOT NULL CHECK (btrim(email) <> ''),
    password_hash VARCHAR(255) NOT NULL CHECK (btrim(password_hash) <> ''),
    enabled BOOLEAN NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX authentication_user_username_unique
    ON authentication_user (lower(username));

CREATE UNIQUE INDEX authentication_user_email_unique
    ON authentication_user (lower(email));
