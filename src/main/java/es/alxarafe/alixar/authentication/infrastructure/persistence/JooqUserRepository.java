package es.alxarafe.alixar.authentication.infrastructure.persistence;

import es.alxarafe.alixar.authentication.application.EmailAlreadyExistsException;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.application.UsernameAlreadyExistsException;
import es.alxarafe.alixar.authentication.domain.User;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.UUID;
import org.jooq.Condition;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;
import org.springframework.dao.DuplicateKeyException;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.lower;
import static org.jooq.impl.DSL.name;
import static org.jooq.impl.DSL.noCondition;
import static org.jooq.impl.DSL.table;

public class JooqUserRepository implements UserRepository {

    private static final String USERNAME_UNIQUE_INDEX = "authentication_user_username_unique";
    private static final String EMAIL_UNIQUE_INDEX = "authentication_user_email_unique";

    private static final Table<Record> USER_TABLE = table(name("authentication_user"));
    private static final Field<UUID> ID = field(name("id"), UUID.class);
    private static final Field<String> USERNAME = field(name("username"), String.class);
    private static final Field<String> EMAIL = field(name("email"), String.class);
    private static final Field<String> PASSWORD_HASH = field(name("password_hash"), String.class);
    private static final Field<Boolean> ENABLED = field(name("enabled"), Boolean.class);
    private static final Field<Long> CREDENTIALS_VERSION = field(name("credentials_version"), Long.class);
    private static final Field<OffsetDateTime> CREATED_AT = field(name("created_at"), OffsetDateTime.class);
    private static final Field<OffsetDateTime> UPDATED_AT = field(name("updated_at"), OffsetDateTime.class);

    private final DSLContext dsl;

    public JooqUserRepository(DSLContext dsl) {
        this.dsl = dsl;
    }

    @Override
    public Optional<User> findByIdentifier(String identifier) {
        String normalizedIdentifier = normalize(identifier);
        List<User> matches = dsl.select(ID, USERNAME, EMAIL, PASSWORD_HASH, ENABLED, CREDENTIALS_VERSION, CREATED_AT, UPDATED_AT)
            .from(USER_TABLE)
            .where(lower(USERNAME).eq(normalizedIdentifier).or(lower(EMAIL).eq(normalizedIdentifier)))
            .limit(2)
            .fetch(this::toUser);
        return matches.size() == 1 ? Optional.of(matches.getFirst()) : Optional.empty();
    }

    @Override
    public Optional<User> findByUsername(String username) {
        return findOne(USERNAME, username);
    }

    @Override
    public Optional<User> findByEmail(String email) {
        return findOne(EMAIL, email);
    }

    @Override
    public List<User> search(String query, Boolean enabled, long offset, int limit) {
        return dsl.select(ID, USERNAME, EMAIL, PASSWORD_HASH, ENABLED, CREDENTIALS_VERSION, CREATED_AT, UPDATED_AT)
            .from(USER_TABLE)
            .where(searchCondition(query, enabled))
            .orderBy(USERNAME, ID)
            .limit(limit)
            .offset(offset)
            .fetch(this::toUser);
    }

    @Override
    public long count(String query, Boolean enabled) {
        return dsl.selectCount()
            .from(USER_TABLE)
            .where(searchCondition(query, enabled))
            .fetchOne(0, long.class);
    }

    @Override
    public void create(User user) {
        try {
            dsl.insertInto(USER_TABLE)
                .columns(ID, USERNAME, EMAIL, PASSWORD_HASH, ENABLED, CREDENTIALS_VERSION, CREATED_AT, UPDATED_AT)
                .values(
                    user.id(),
                    user.username(),
                    user.email(),
                    user.passwordHash(),
                    user.enabled(),
                    user.credentialsVersion(),
                    OffsetDateTime.ofInstant(user.createdAt(), ZoneOffset.UTC),
                    OffsetDateTime.ofInstant(user.updatedAt(), ZoneOffset.UTC)
                )
                .execute();
        } catch (DuplicateKeyException exception) {
            throw translateCreateDuplicate(exception);
        }
    }

    @Override
    public Optional<User> findById(UUID id) {
        return dsl.select(ID, USERNAME, EMAIL, PASSWORD_HASH, ENABLED, CREDENTIALS_VERSION, CREATED_AT, UPDATED_AT)
            .from(USER_TABLE)
            .where(ID.eq(id))
            .fetchOptional(this::toUser);
    }

    @Override
    public void updateEnabledAndCredentialsVersion(UUID userId, boolean enabled, long newCredentialsVersion) {
        dsl.update(USER_TABLE)
            .set(ENABLED, enabled)
            .set(CREDENTIALS_VERSION, newCredentialsVersion)
            .set(UPDATED_AT, OffsetDateTime.now(ZoneOffset.UTC))
            .where(ID.eq(userId))
            .execute();
    }

    @Override
    public void updatePasswordAndCredentialsVersion(UUID userId, String newPasswordHash, long newCredentialsVersion) {
        dsl.update(USER_TABLE)
            .set(PASSWORD_HASH, newPasswordHash)
            .set(CREDENTIALS_VERSION, newCredentialsVersion)
            .set(UPDATED_AT, OffsetDateTime.now(ZoneOffset.UTC))
            .where(ID.eq(userId))
            .execute();
    }

    @Override
    public void updateUsername(UUID userId, String newUsername) {
        try {
            dsl.update(USER_TABLE)
                .set(USERNAME, newUsername)
                .set(UPDATED_AT, OffsetDateTime.now(ZoneOffset.UTC))
                .where(ID.eq(userId))
                .execute();
        } catch (DuplicateKeyException exception) {
            throw new UsernameAlreadyExistsException();
        }
    }

    private RuntimeException translateCreateDuplicate(DuplicateKeyException exception) {
        String message = exception.getMostSpecificCause().getMessage();
        if (message != null && message.contains(USERNAME_UNIQUE_INDEX)) {
            return new UsernameAlreadyExistsException();
        }
        if (message != null && message.contains(EMAIL_UNIQUE_INDEX)) {
            return new EmailAlreadyExistsException();
        }
        return exception;
    }

    private Condition searchCondition(String query, Boolean enabled) {
        Condition condition = noCondition();
        if (enabled != null) {
            condition = condition.and(ENABLED.eq(enabled));
        }
        if (query != null) {
            condition = condition.and(
                lower(USERNAME).contains(query).or(lower(EMAIL).contains(query))
            );
        }
        return condition;
    }

    private Optional<User> findOne(Field<String> identifierField, String identifier) {
        return dsl.select(ID, USERNAME, EMAIL, PASSWORD_HASH, ENABLED, CREDENTIALS_VERSION, CREATED_AT, UPDATED_AT)
            .from(USER_TABLE)
            .where(lower(identifierField).eq(normalize(identifier)))
            .fetchOptional(this::toUser);
    }

    private User toUser(Record record) {
        return new User(
            record.get(ID),
            record.get(USERNAME),
            record.get(EMAIL),
            record.get(PASSWORD_HASH),
            Boolean.TRUE.equals(record.get(ENABLED)),
            record.get(CREDENTIALS_VERSION),
            record.get(CREATED_AT).toInstant(),
            record.get(UPDATED_AT).toInstant()
        );
    }

    private String normalize(String identifier) {
        return identifier.strip().toLowerCase(Locale.ROOT);
    }
}
