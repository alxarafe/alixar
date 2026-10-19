package es.alxarafe.alixar.authentication.infrastructure.persistence;

import es.alxarafe.alixar.authentication.application.PasswordResetTokenRepository;
import es.alxarafe.alixar.authentication.domain.PasswordResetToken;
import java.time.Instant;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.Optional;
import java.util.UUID;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.name;
import static org.jooq.impl.DSL.table;

public class JooqPasswordResetTokenRepository implements PasswordResetTokenRepository {

    private static final Table<Record> TOKEN_TABLE = table(name("authentication_password_reset"));
    private static final Field<UUID> ID = field(name("id"), UUID.class);
    private static final Field<UUID> USER_ID = field(name("user_id"), UUID.class);
    private static final Field<String> TOKEN_HASH = field(name("token_hash"), String.class);
    private static final Field<OffsetDateTime> EXPIRES_AT = field(name("expires_at"), OffsetDateTime.class);
    private static final Field<OffsetDateTime> USED_AT = field(name("used_at"), OffsetDateTime.class);
    private static final Field<OffsetDateTime> CREATED_AT = field(name("created_at"), OffsetDateTime.class);

    private final DSLContext dsl;

    public JooqPasswordResetTokenRepository(DSLContext dsl) {
        this.dsl = dsl;
    }

    @Override
    public Optional<PasswordResetToken> findByTokenHash(String tokenHash) {
        return dsl.select(ID, USER_ID, TOKEN_HASH, EXPIRES_AT, USED_AT, CREATED_AT)
            .from(TOKEN_TABLE)
            .where(TOKEN_HASH.eq(tokenHash))
            .fetchOptional(this::toToken);
    }

    @Override
    public void create(PasswordResetToken token) {
        dsl.insertInto(TOKEN_TABLE)
            .columns(ID, USER_ID, TOKEN_HASH, EXPIRES_AT, USED_AT, CREATED_AT)
            .values(
                token.id(),
                token.userId(),
                token.tokenHash(),
                OffsetDateTime.ofInstant(token.expiresAt(), ZoneOffset.UTC),
                token.usedAt() != null ? OffsetDateTime.ofInstant(token.usedAt(), ZoneOffset.UTC) : null,
                OffsetDateTime.ofInstant(token.createdAt(), ZoneOffset.UTC)
            )
            .execute();
    }

    @Override
    public void markAsUsed(UUID tokenId, Instant usedAt) {
        dsl.update(TOKEN_TABLE)
            .set(USED_AT, OffsetDateTime.ofInstant(usedAt, ZoneOffset.UTC))
            .where(ID.eq(tokenId))
            .execute();
    }

    @Override
    public void invalidatePendingTokensForUser(UUID userId) {
        dsl.update(TOKEN_TABLE)
            .set(USED_AT, OffsetDateTime.now(ZoneOffset.UTC))
            .where(USER_ID.eq(userId).and(USED_AT.isNull()))
            .execute();
    }

    private PasswordResetToken toToken(Record record) {
        return new PasswordResetToken(
            record.get(ID),
            record.get(USER_ID),
            record.get(TOKEN_HASH),
            record.get(EXPIRES_AT).toInstant(),
            record.get(USED_AT) != null ? record.get(USED_AT).toInstant() : null,
            record.get(CREATED_AT).toInstant()
        );
    }
}