package es.alxarafe.alixar.authentication.infrastructure.persistence;

import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.domain.ApiToken;
import java.time.Instant;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.name;
import static org.jooq.impl.DSL.table;

public class JooqApiTokenRepository implements ApiTokenRepository {

    private static final Table<Record> TOKEN_TABLE = table(name("authentication_api_token"));
    private static final Field<UUID> ID = field(name("id"), UUID.class);
    private static final Field<UUID> USER_ID = field(name("user_id"), UUID.class);
    private static final Field<String> NAME = field(name("name"), String.class);
    private static final Field<String> TOKEN_HASH = field(name("token_hash"), String.class);
    private static final Field<Long> CREDENTIALS_VERSION = field(name("credentials_version"), Long.class);
    private static final Field<OffsetDateTime> CREATED_AT = field(name("created_at"), OffsetDateTime.class);
    private static final Field<OffsetDateTime> EXPIRES_AT = field(name("expires_at"), OffsetDateTime.class);
    private static final Field<OffsetDateTime> LAST_USED_AT = field(name("last_used_at"), OffsetDateTime.class);
    private static final Field<OffsetDateTime> REVOKED_AT = field(name("revoked_at"), OffsetDateTime.class);

    private final DSLContext dsl;

    public JooqApiTokenRepository(DSLContext dsl) {
        this.dsl = dsl;
    }

    @Override
    public void create(ApiToken token, String tokenHash) {
        dsl.insertInto(TOKEN_TABLE)
            .columns(ID, USER_ID, NAME, TOKEN_HASH, CREDENTIALS_VERSION, CREATED_AT, EXPIRES_AT, LAST_USED_AT, REVOKED_AT)
            .values(
                token.id(),
                token.userId(),
                token.name(),
                tokenHash,
                token.credentialsVersion(),
                toOffsetDateTime(token.createdAt()),
                toOffsetDateTime(token.expiresAt()),
                toOffsetDateTime(token.lastUsedAt()),
                toOffsetDateTime(token.revokedAt())
            )
            .execute();
    }

    @Override
    public Optional<ApiToken> findByTokenHash(String tokenHash) {
        return dsl.select(ID, USER_ID, NAME, CREDENTIALS_VERSION, CREATED_AT, EXPIRES_AT, LAST_USED_AT, REVOKED_AT)
            .from(TOKEN_TABLE)
            .where(TOKEN_HASH.eq(tokenHash))
            .fetchOptional(this::toApiToken);
    }

    @Override
    public List<ApiToken> findAllByUserId(UUID userId) {
        return dsl.select(ID, USER_ID, NAME, CREDENTIALS_VERSION, CREATED_AT, EXPIRES_AT, LAST_USED_AT, REVOKED_AT)
            .from(TOKEN_TABLE)
            .where(USER_ID.eq(userId))
            .orderBy(CREATED_AT.desc(), ID.desc())
            .fetch(this::toApiToken);
    }

    @Override
    public Optional<ApiToken> findByIdAndUserId(UUID id, UUID userId) {
        return dsl.select(ID, USER_ID, NAME, CREDENTIALS_VERSION, CREATED_AT, EXPIRES_AT, LAST_USED_AT, REVOKED_AT)
            .from(TOKEN_TABLE)
            .where(ID.eq(id).and(USER_ID.eq(userId)))
            .fetchOptional(this::toApiToken);
    }

    @Override
    public void revoke(UUID id, UUID userId, Instant revokedAt) {
        dsl.update(TOKEN_TABLE)
            .set(REVOKED_AT, toOffsetDateTime(revokedAt))
            .where(ID.eq(id).and(USER_ID.eq(userId)).and(REVOKED_AT.isNull()))
            .execute();
    }

    @Override
    public void updateLastUsedAt(UUID id, Instant lastUsedAt) {
        dsl.update(TOKEN_TABLE)
            .set(LAST_USED_AT, toOffsetDateTime(lastUsedAt))
            .where(ID.eq(id))
            .execute();
    }

    private ApiToken toApiToken(Record record) {
        return new ApiToken(
            record.get(ID),
            record.get(USER_ID),
            record.get(NAME),
            record.get(CREDENTIALS_VERSION),
            record.get(CREATED_AT).toInstant(),
            record.get(EXPIRES_AT).toInstant(),
            record.get(LAST_USED_AT) != null ? record.get(LAST_USED_AT).toInstant() : null,
            record.get(REVOKED_AT) != null ? record.get(REVOKED_AT).toInstant() : null
        );
    }

    private OffsetDateTime toOffsetDateTime(Instant instant) {
        return instant != null ? OffsetDateTime.ofInstant(instant, ZoneOffset.UTC) : null;
    }
}
