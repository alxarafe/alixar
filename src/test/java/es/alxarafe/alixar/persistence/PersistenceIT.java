package es.alxarafe.alixar.persistence;

import es.alxarafe.alixar.authentication.application.AuthenticateUserUseCase;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.User;
import javax.sql.DataSource;
import org.flywaydb.core.Flyway;
import org.jooq.DSLContext;
import org.junit.jupiter.api.Test;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

// Runs explicitly in bin/check against its isolated Compose database.
@SpringBootTest(properties = "spring.autoconfigure.exclude=")
class PersistenceIT {

    private static final String POSTGRESQL_VERSION = "18.6";
    private static final String HISTORY_TABLE = "flyway_schema_history";
    private static final String USER_TABLE = "authentication_user";
    private static final String RESET_TOKEN_TABLE = "authentication_password_reset";

    @Autowired
    private DataSource dataSource;

    @Autowired
    private Flyway flyway;

    @Autowired
    private DSLContext dsl;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    @Autowired
    private AuthenticateUserUseCase authenticateUser;

    @Test
    void bootIntegratesPostgresqlFlywayJooqAndAuthenticationMigration() throws Exception {
        try (var connection = dataSource.getConnection()) {
            assertThat(connection.getMetaData().getDatabaseProductVersion())
                .startsWith(POSTGRESQL_VERSION);
        }
        assertThat(flyway.getConfiguration().getDataSource()).isSameAs(dataSource);
        assertThat(flyway.info().all()).hasSize(2);
        assertThat(flyway.info().current().getVersion().getVersion()).isEqualTo("2");
        assertThat(dsl.selectOne().fetchSingle().value1()).isEqualTo(1);
        assertThat(dsl.fetch("select tablename from pg_catalog.pg_tables where schemaname = current_schema()")
            .getValues(0, String.class)).containsExactlyInAnyOrder(HISTORY_TABLE, USER_TABLE, "authentication_password_reset");
        assertThat(dsl.fetchCount(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(HISTORY_TABLE))))
            .isEqualTo(2);
    }

    @Test
    void authenticationUser_enforcesCaseInsensitiveUsernameAndEmailUniqueness() {
        var firstId = java.util.UUID.fromString("d9fc8a15-f0f1-4205-b9d7-d68b77481345");
        var secondId = java.util.UUID.fromString("cf0c2441-c03d-42fc-aa6f-1294be8543cf");
        var thirdId = java.util.UUID.fromString("6863bf16-d8cc-45ad-b2ff-41826adfbe33");

        try {
            insertUser(firstId, "UniqueUser", "unique@example.test");

            assertThatThrownBy(() -> insertUser(secondId, "uniqueuser", "other@example.test"))
                .isInstanceOf(DuplicateKeyException.class);
            assertThatThrownBy(() -> insertUser(thirdId, "other-user", "UNIQUE@example.test"))
                .isInstanceOf(DuplicateKeyException.class);
        } finally {
            dsl.deleteFrom(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(USER_TABLE)))
                .where(org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("id"), java.util.UUID.class)
                    .in(firstId, secondId, thirdId))
                .execute();
        }
    }

    @Test
    void authenticationPersistence_supportsCredentialValidationByUsernameAndEmail() {
        var id = java.util.UUID.fromString("a8741987-93bd-4d90-a42c-53169188c4d4");
        var now = java.time.Instant.parse("2026-10-17T10:00:00Z");

        try {
            userRepository.create(new User(
                id,
                "database-user",
                "database-user@example.test",
                passwordHasher.hash("database-test-password"),
                true,
                0,
                now,
                now
            ));

            assertThat(authenticateUser.execute("DATABASE-USER", "database-test-password").id())
                .isEqualTo(id);
            assertThat(authenticateUser.execute("DATABASE-USER@EXAMPLE.TEST", "database-test-password").id())
                .isEqualTo(id);
        } finally {
            dsl.deleteFrom(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(USER_TABLE)))
                .where(org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("id"), java.util.UUID.class).eq(id))
                .execute();
        }
    }

    @Test
    void authenticationUser_hasCredentialsVersionColumn() {
        var id = java.util.UUID.fromString("12345678-1234-1234-1234-123456789012");
        var now = java.time.Instant.parse("2026-10-17T10:00:00Z");

        try {
            userRepository.create(new User(
                id,
                "cred-test-user",
                "cred-test@example.test",
                passwordHasher.hash("password"),
                true,
                5,
                now,
                now
            ));

            var user = userRepository.findById(id).orElseThrow();
            assertThat(user.credentialsVersion()).isEqualTo(5);
        } finally {
            dsl.deleteFrom(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(USER_TABLE)))
                .where(org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("id"), java.util.UUID.class).eq(id))
                .execute();
        }
    }

    @Test
    void passwordResetToken_enforcesTokenHashUniqueness() {
        var firstId = java.util.UUID.fromString("aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa");
        var secondId = java.util.UUID.fromString("bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb");
        var userId = java.util.UUID.fromString("cccccccc-cccc-cccc-cccc-cccccccccccc");
        var now = java.time.OffsetDateTime.parse("2026-10-17T10:00:00Z");
        var expiresAt = now.plusMinutes(30);

        try {
            // First create the user
            insertUser(userId, "token-test-user", "token-test@example.test");

            insertToken(firstId, userId, "ABCDEF123456", expiresAt, null);
            assertThatThrownBy(() -> insertToken(secondId, userId, "ABCDEF123456", expiresAt, null))
                .isInstanceOf(org.springframework.dao.DataIntegrityViolationException.class);
        } finally {
            dsl.deleteFrom(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(RESET_TOKEN_TABLE)))
                .where(org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("id"), java.util.UUID.class)
                    .in(firstId, secondId))
                .execute();
            dsl.deleteFrom(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(USER_TABLE)))
                .where(org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("id"), java.util.UUID.class).eq(userId))
                .execute();
        }
    }

    @Test
    void passwordResetToken_enforcesForeignKeyToUser() {
        var tokenId = java.util.UUID.fromString("dddddddd-dddd-dddd-dddd-dddddddddddd");
        var nonExistentUserId = java.util.UUID.fromString("eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee");
        var now = java.time.OffsetDateTime.parse("2026-10-17T10:00:00Z");
        var expiresAt = now.plusMinutes(30);

        assertThatThrownBy(() -> insertToken(tokenId, nonExistentUserId, "TOKENHASH123", now.plusMinutes(30), null))
            .isInstanceOf(org.springframework.dao.DataIntegrityViolationException.class);
    }

    private void insertUser(java.util.UUID id, String username, String email) {
        dsl.insertInto(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(USER_TABLE)))
            .columns(
                org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("id")),
                org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("username")),
                org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("email")),
                org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("password_hash")),
                org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("enabled"))
            )
            .values(id, username, email, "{bcrypt}test-hash", true)
            .execute();
    }

    private void insertToken(java.util.UUID id, java.util.UUID userId, String tokenHash, java.time.OffsetDateTime expiresAt, java.time.OffsetDateTime usedAt) {
        dsl.insertInto(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(RESET_TOKEN_TABLE)))
            .columns(
                org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("id")),
                org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("user_id")),
                org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("token_hash")),
                org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("expires_at")),
                org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("used_at"))
            )
            .values(id, userId, tokenHash, expiresAt, usedAt)
            .execute();
    }
}