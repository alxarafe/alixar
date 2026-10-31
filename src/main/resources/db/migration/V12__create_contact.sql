CREATE TABLE contact (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    last_name TEXT NOT NULL CHECK (btrim(last_name) <> ''),
    first_name TEXT,
    email TEXT,
    third_party_id BIGINT REFERENCES third_party(id) ON DELETE RESTRICT
);
