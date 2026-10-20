package es.alxarafe.alixar.persistence;

import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.AuthenticateUserUseCase;
import es.alxarafe.alixar.authentication.application.ChangePasswordUseCase;
import es.alxarafe.alixar.authentication.application.ChangeUsernameUseCase;
import es.alxarafe.alixar.authentication.application.EmailAlreadyExistsException;
import es.alxarafe.alixar.authentication.application.ForgotPasswordUseCase;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixar.authentication.application.PermissionDefinition;
import es.alxarafe.alixar.authentication.application.PasswordResetNotifier;
import es.alxarafe.alixar.authentication.application.PasswordResetTokenGenerator;
import es.alxarafe.alixar.authentication.application.PasswordResetTokenRepository;
import es.alxarafe.alixar.authentication.application.ResetPasswordUseCase;
import es.alxarafe.alixar.authentication.application.RoleCodes;
import es.alxarafe.alixar.authentication.application.RoleNotFoundException;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.application.UsernameAlreadyExistsException;
import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.domain.PasswordResetToken;
import es.alxarafe.alixar.authentication.domain.User;
import es.alxarafe.alixar.authentication.infrastructure.TransactionalAdminUserService;
import java.time.Instant;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import javax.sql.DataSource;
import org.flywaydb.core.Flyway;
import org.jooq.DSLContext;
import org.junit.jupiter.api.Test;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

// Runs explicitly in bin/check against its isolated Compose database.
@SpringBootTest(properties = "spring.autoconfigure.exclude=")
class PersistenceIT {

    private static final String POSTGRESQL_VERSION = "18.6";
    private static final String HISTORY_TABLE = "flyway_schema_history";
    private static final String USER_TABLE = "authentication_user";
    private static final String RESET_TOKEN_TABLE = "authentication_password_reset";
    private static final String API_TOKEN_TABLE = "authentication_api_token";
    private static final String ROLE_TABLE = "authentication_role";
    private static final String PERMISSION_TABLE = "authentication_permission";
    private static final String ROLE_PERMISSION_TABLE = "authentication_role_permission";
    private static final String USER_ROLE_TABLE = "authentication_user_role";

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

    @Autowired
    private PasswordResetTokenRepository passwordResetTokenRepository;

    @Autowired
    private ApiTokenRepository apiTokenRepository;

    @Autowired
    private AuthorizationRepository authorizationRepository;

    @Autowired
    private TokenHasher tokenHasher;

    @Autowired
    private PlatformTransactionManager transactionManager;

    @Autowired
    private TransactionalAdminUserService transactionalAdminUserService;

    @Test
    void bootIntegratesPostgresqlFlywayJooqAndAuthenticationMigration() throws Exception {
        try (var connection = dataSource.getConnection()) {
            assertThat(connection.getMetaData().getDatabaseProductVersion())
                .startsWith(POSTGRESQL_VERSION);
        }
        assertThat(flyway.getConfiguration().getDataSource()).isSameAs(dataSource);
        assertThat(flyway.info().all()).hasSize(5);
        assertThat(flyway.info().current().getVersion().getVersion()).isEqualTo("5");
        assertThat(dsl.selectOne().fetchSingle().value1()).isEqualTo(1);
        assertThat(dsl.fetch("select tablename from pg_catalog.pg_tables where schemaname = current_schema()")
            .getValues(0, String.class)).containsExactlyInAnyOrder(
                HISTORY_TABLE,
                USER_TABLE,
                RESET_TOKEN_TABLE,
                API_TOKEN_TABLE,
                ROLE_TABLE,
                PERMISSION_TABLE,
                ROLE_PERMISSION_TABLE,
                USER_ROLE_TABLE
            );
        assertThat(dsl.fetchCount(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(HISTORY_TABLE))))
            .isEqualTo(5);
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

    @Test
    void resetPassword_whenTokenUpdateFails_rollsBackPasswordAndCredentialsVersion() {
        var userId = UUID.fromString("11111111-2222-3333-4444-555555555555");
        var now = Instant.now();
        String originalPassword = "original-password-123";
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        var token = new PasswordResetToken(
            UUID.randomUUID(),
            userId,
            tokenHash,
            now.plusSeconds(30 * 60),
            null,
            now
        );

        try {
            userRepository.create(new User(
                userId,
                "rollback-reset",
                "rollback-reset@example.test",
                passwordHasher.hash(originalPassword),
                true,
                3,
                now,
                now
            ));
            passwordResetTokenRepository.create(token);

            PasswordResetTokenRepository failingRepository = new DelegatingPasswordResetTokenRepository() {
                @Override
                public void markAsUsed(UUID tokenId, Instant usedAt) {
                    throw new IllegalStateException("simulated token update failure");
                }
            };
            var useCase = new ResetPasswordUseCase(userRepository, failingRepository, tokenHasher, passwordHasher);
            var transactionTemplate = new TransactionTemplate(transactionManager);

            assertThatThrownBy(() -> transactionTemplate.execute(status -> {
                useCase.execute(rawToken, "new-secure-password-123");
                return null;
            })).isInstanceOf(IllegalStateException.class);

            var persisted = userRepository.findById(userId).orElseThrow();
            assertThat(persisted.credentialsVersion()).isEqualTo(3);
            assertThat(passwordHasher.matches(originalPassword, persisted.passwordHash())).isTrue();
        } finally {
            deleteUser(userId);
        }
    }

    @Test
    void forgotPassword_whenTokenCreationFails_keepsPreviousTokenPending() {
        var userId = UUID.fromString("66666666-7777-8888-9999-000000000000");
        var now = Instant.now();
        String existingRawToken = PasswordResetTokenGenerator.generate();
        String existingTokenHash = tokenHasher.hash(existingRawToken);
        var existingToken = new PasswordResetToken(
            UUID.randomUUID(),
            userId,
            existingTokenHash,
            now.plusSeconds(30 * 60),
            null,
            now
        );

        try {
            userRepository.create(new User(
                userId,
                "rollback-forgot",
                "rollback-forgot@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                0,
                now,
                now
            ));
            passwordResetTokenRepository.create(existingToken);

            PasswordResetTokenRepository failingRepository = new DelegatingPasswordResetTokenRepository() {
                @Override
                public void create(PasswordResetToken token) {
                    throw new IllegalStateException("simulated token creation failure");
                }
            };
            PasswordResetNotifier notifier = (email, token, resetUrl) -> {
            };
            var useCase = new ForgotPasswordUseCase(
                userRepository,
                failingRepository,
                tokenHasher,
                notifier,
                "https://front.example/reset"
            );
            var transactionTemplate = new TransactionTemplate(transactionManager);

            assertThatThrownBy(() -> transactionTemplate.execute(status -> {
                useCase.execute("rollback-forgot@example.test");
                return null;
            })).isInstanceOf(IllegalStateException.class);

            var pending = passwordResetTokenRepository.findByTokenHash(existingTokenHash).orElseThrow();
            assertThat(pending.usedAt()).isNull();
        } finally {
            deleteUser(userId);
        }
    }

    @Test
    void passwordRecoveryTransactionBoundary_livesInInfrastructureFacade() throws Exception {
        Class<?> controller = Class.forName("es.alxarafe.alixar.authentication.api.AuthController");
        Class<?> facade = Class.forName(
            "es.alxarafe.alixar.authentication.infrastructure.TransactionalPasswordRecovery"
        );

        assertThat(isTransactional(controller, "forgotPassword")).isFalse();
        assertThat(isTransactional(controller, "resetPassword")).isFalse();
        assertThat(isTransactional(facade, "forgotPassword")).isTrue();
        assertThat(isTransactional(facade, "resetPassword")).isTrue();
    }

    @Test
    void selfServiceTransactionBoundary_livesInInfrastructureFacade() throws Exception {
        Class<?> controller = Class.forName("es.alxarafe.alixar.authentication.api.UserController");
        Class<?> facade = Class.forName(
            "es.alxarafe.alixar.authentication.infrastructure.TransactionalUserSelfService"
        );

        assertThat(isTransactional(controller, "updateUsername")).isFalse();
        assertThat(isTransactional(controller, "changePassword")).isFalse();
        assertThat(isTransactional(facade, "changeUsername")).isTrue();
        assertThat(isTransactional(facade, "changePassword")).isTrue();
    }

    @Test
    void administrativeUserTransactionBoundary_livesInInfrastructureFacade() throws Exception {
        Class<?> controller = Class.forName("es.alxarafe.alixar.authentication.api.AdminUserController");
        Class<?> facade = Class.forName(
            "es.alxarafe.alixar.authentication.infrastructure.TransactionalAdminUserService"
        );

        assertThat(isTransactional(controller, "create")).isFalse();
        assertThat(isTransactional(controller, "updateUsername")).isFalse();
        assertThat(isTransactional(controller, "updateEnabled")).isFalse();
        assertThat(isTransactional(controller, "resetPassword")).isFalse();
        assertThat(isTransactional(controller, "replaceRoles")).isFalse();
        assertThat(isTransactional(facade, "create")).isTrue();
        assertThat(isTransactional(facade, "updateUsername")).isTrue();
        assertThat(isTransactional(facade, "setEnabled")).isTrue();
        assertThat(isTransactional(facade, "resetPassword")).isTrue();
        assertThat(isTransactional(facade, "replaceRoles")).isTrue();
    }

    @Test
    void administrativeUserCreation_translatesUniqueViolations() {
        var firstId = UUID.fromString("11111111-2222-3333-4444-555555555555");
        var secondId = UUID.fromString("66666666-7777-8888-9999-000000000000");
        var thirdId = UUID.fromString("aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee");
        var now = Instant.now();

        try {
            userRepository.create(new User(
                firstId,
                "AdminUser",
                "admin-user@example.test",
                passwordHasher.hash("original-password-123"),
                false,
                0,
                now,
                now
            ));

            assertThatThrownBy(() -> userRepository.create(new User(
                secondId,
                "adminuser",
                "different-admin@example.test",
                passwordHasher.hash("original-password-123"),
                false,
                0,
                now,
                now
            ))).isInstanceOf(UsernameAlreadyExistsException.class);

            assertThatThrownBy(() -> userRepository.create(new User(
                thirdId,
                "different-admin",
                "ADMIN-USER@example.test",
                passwordHasher.hash("original-password-123"),
                false,
                0,
                now,
                now
            ))).isInstanceOf(EmailAlreadyExistsException.class);
        } finally {
            deleteUser(firstId);
            deleteUser(secondId);
            deleteUser(thirdId);
        }
    }

    @Test
    void administrativeUserCreation_rollsBackUserWhenRoleAssignmentFails() {
        var userId = UUID.fromString("12345678-1234-5678-1234-567812345678");
        var now = Instant.now();
        var transactionTemplate = new TransactionTemplate(transactionManager);

        try {
            assertThatThrownBy(() -> transactionTemplate.execute(status -> {
                userRepository.create(new User(
                    userId,
                    "rollback-admin",
                    "rollback-admin@example.test",
                    passwordHasher.hash("original-password-123"),
                    false,
                    0,
                    now,
                    now
                ));
                authorizationRepository.assignRoleToUser(userId, "missing-role");
                return null;
            })).isInstanceOf(RoleNotFoundException.class);

            assertThat(userRepository.findById(userId)).isEmpty();
        } finally {
            deleteUser(userId);
        }
    }

    @Test
    void administrativeEnablementAndPasswordReset_updateCredentialsAndInvalidateResetTokens() {
        var userId = UUID.fromString("9a8b7c6d-5e4f-3a2b-1c0d-9e8f7a6b5c4d");
        var now = Instant.now();
        var resetTokenHash = tokenHasher.hash(PasswordResetTokenGenerator.generate());

        try {
            userRepository.create(new User(
                userId,
                "admin-credential-actions",
                "admin-credential-actions@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                2,
                now,
                now
            ));
            passwordResetTokenRepository.create(new PasswordResetToken(
                UUID.randomUUID(),
                userId,
                resetTokenHash,
                now.plusSeconds(1800),
                null,
                now
            ));

            var disabled = transactionalAdminUserService.setEnabled(userId, false);
            assertThat(disabled.enabled()).isFalse();
            var afterDisable = userRepository.findById(userId).orElseThrow();
            assertThat(afterDisable.enabled()).isFalse();
            assertThat(afterDisable.credentialsVersion()).isEqualTo(3);
            assertThat(afterDisable.username()).isEqualTo("admin-credential-actions");
            assertThat(afterDisable.email()).isEqualTo("admin-credential-actions@example.test");
            assertThat(passwordResetTokenRepository.findByTokenHash(resetTokenHash).orElseThrow().isUsed())
                .isTrue();

            var enabled = transactionalAdminUserService.setEnabled(userId, true);
            assertThat(enabled.enabled()).isTrue();
            assertThat(userRepository.findById(userId).orElseThrow().credentialsVersion()).isEqualTo(3);

            transactionalAdminUserService.resetPassword(userId, "new-admin-password-123");
            var afterReset = userRepository.findById(userId).orElseThrow();
            assertThat(afterReset.enabled()).isTrue();
            assertThat(afterReset.credentialsVersion()).isEqualTo(4);
            assertThat(passwordHasher.matches("new-admin-password-123", afterReset.passwordHash())).isTrue();
            assertThat(passwordHasher.matches("original-password-123", afterReset.passwordHash())).isFalse();
        } finally {
            deleteUser(userId);
        }
    }

    @Test
    void administrativeRoleReplacement_replacesAllRolesWithoutChangingCredentials() {
        var userId = UUID.fromString("0a1b2c3d-4e5f-4a6b-8c7d-9e0f1a2b3c4d");
        var now = Instant.now();

        try {
            userRepository.create(new User(
                userId,
                "admin-role-replacement",
                "admin-role-replacement@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                2,
                now,
                now
            ));
            authorizationRepository.assignRoleToUser(userId, RoleCodes.SYSTEM_ADMIN);

            var replaced = transactionalAdminUserService.replaceRoles(
                userId,
                List.of(RoleCodes.SYSTEM_ADMIN, " " + RoleCodes.SYSTEM_ADMIN + " ")
            );

            assertThat(replaced.roleCodes()).containsExactly(RoleCodes.SYSTEM_ADMIN);
            assertThat(authorizationRepository.findRoleCodesForUser(userId))
                .containsExactly(RoleCodes.SYSTEM_ADMIN);
            var afterReplacement = userRepository.findById(userId).orElseThrow();
            assertThat(afterReplacement.credentialsVersion()).isEqualTo(2);
            assertThat(passwordHasher.matches("original-password-123", afterReplacement.passwordHash())).isTrue();
            assertThat(afterReplacement.username()).isEqualTo("admin-role-replacement");
            assertThat(afterReplacement.email()).isEqualTo("admin-role-replacement@example.test");
            assertThat(afterReplacement.enabled()).isTrue();

            var cleared = transactionalAdminUserService.replaceRoles(userId, List.of());

            assertThat(cleared.roleCodes()).isEmpty();
            assertThat(authorizationRepository.findRoleCodesForUser(userId)).isEmpty();
            assertThat(authorizationRepository.findEffectivePermissionCodes(userId)).isEmpty();
            assertThat(userRepository.findById(userId).orElseThrow().credentialsVersion()).isEqualTo(2);
        } finally {
            deleteUser(userId);
        }
    }

    @Test
    void updateUsername_changesUsernameWithCaseInsensitiveLookupAndUniqueConstraint() {
        var firstId = UUID.fromString("10101010-2020-3030-4040-505050505050");
        var secondId = UUID.fromString("60606060-7070-8080-9090-000000000000");
        var now = Instant.now();

        try {
            userRepository.create(new User(
                firstId,
                "first-user",
                "first-user@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                0,
                now,
                now
            ));
            userRepository.create(new User(
                secondId,
                "second-user",
                "second-user@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                0,
                now,
                now
            ));

            var useCase = new ChangeUsernameUseCase(userRepository);
            useCase.execute(firstId, "Renamed-User");

            assertThat(userRepository.findByUsername("RENAMED-USER")).map(User::id).contains(firstId);
            assertThat(userRepository.findByUsername("first-user")).isEmpty();
            assertThat(userRepository.findById(firstId).orElseThrow().email())
                .isEqualTo("first-user@example.test");

            assertThatThrownBy(() -> useCase.execute(firstId, "Second-User"))
                .isInstanceOf(UsernameAlreadyExistsException.class);
            assertThatThrownBy(() -> userRepository.updateUsername(firstId, "SECOND-USER"))
                .isInstanceOf(UsernameAlreadyExistsException.class);
        } finally {
            deleteUser(firstId);
            deleteUser(secondId);
        }
    }

    @Test
    void changePassword_incrementsCredentialsVersionAndInvalidatesPendingTokens() {
        var userId = UUID.fromString("0a0a0a0a-1b1b-2c2c-3d3d-4e4e4e4e4e4e");
        var now = Instant.now();
        String originalPassword = "original-password-123";
        String newPassword = "new-secure-password-123";
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        var token = new PasswordResetToken(
            UUID.randomUUID(),
            userId,
            tokenHash,
            now.plusSeconds(30 * 60),
            null,
            now
        );

        try {
            userRepository.create(new User(
                userId,
                "change-password",
                "change-password@example.test",
                passwordHasher.hash(originalPassword),
                true,
                2,
                now,
                now
            ));
            passwordResetTokenRepository.create(token);

            var useCase = new ChangePasswordUseCase(userRepository, passwordResetTokenRepository, passwordHasher);
            var transactionTemplate = new TransactionTemplate(transactionManager);
            transactionTemplate.execute(status -> {
                useCase.execute(userId, originalPassword, newPassword);
                return null;
            });

            var persisted = userRepository.findById(userId).orElseThrow();
            assertThat(persisted.credentialsVersion()).isEqualTo(3);
            assertThat(passwordHasher.matches(newPassword, persisted.passwordHash())).isTrue();
            assertThat(passwordHasher.matches(originalPassword, persisted.passwordHash())).isFalse();
            assertThat(passwordResetTokenRepository.findByTokenHash(tokenHash).orElseThrow().isUsed()).isTrue();
        } finally {
            deleteUser(userId);
        }
    }

    @Test
    void changePassword_whenTokenInvalidationFails_rollsBackPasswordAndCredentialsVersion() {
        var userId = UUID.fromString("5a5a5a5a-6b6b-7c7c-8d8d-9e9e9e9e9e9e");
        var now = Instant.now();
        String originalPassword = "original-password-123";
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);
        var token = new PasswordResetToken(
            UUID.randomUUID(),
            userId,
            tokenHash,
            now.plusSeconds(30 * 60),
            null,
            now
        );

        try {
            userRepository.create(new User(
                userId,
                "rollback-change",
                "rollback-change@example.test",
                passwordHasher.hash(originalPassword),
                true,
                4,
                now,
                now
            ));
            passwordResetTokenRepository.create(token);

            PasswordResetTokenRepository failingRepository = new DelegatingPasswordResetTokenRepository() {
                @Override
                public void invalidatePendingTokensForUser(UUID failingUserId) {
                    throw new IllegalStateException("simulated token invalidation failure");
                }
            };
            var useCase = new ChangePasswordUseCase(userRepository, failingRepository, passwordHasher);
            var transactionTemplate = new TransactionTemplate(transactionManager);

            assertThatThrownBy(() -> transactionTemplate.execute(status -> {
                useCase.execute(userId, originalPassword, "new-secure-password-123");
                return null;
            })).isInstanceOf(IllegalStateException.class);

            var persisted = userRepository.findById(userId).orElseThrow();
            assertThat(persisted.credentialsVersion()).isEqualTo(4);
            assertThat(passwordHasher.matches(originalPassword, persisted.passwordHash())).isTrue();
        } finally {
            deleteUser(userId);
        }
    }

    @Test
    void apiToken_persistsMetadataAndSupportsLookupLastUseAndRevocation() {
        var userId = UUID.fromString("a1a1a1a1-b2b2-c3c3-d4d4-e5e5e5e5e5e5");
        var tokenId = UUID.fromString("f1f1f1f1-e2e2-d3d3-c4c4-b5b5b5b5b5b5");
        var otherUserId = UUID.fromString("12121212-3434-5656-7878-909090909090");
        var now = Instant.parse("2026-10-17T10:00:00Z");
        var expiresAt = now.plusSeconds(3600);
        var rawToken = "alx_pat_persistence-test-token";
        var tokenHash = tokenHasher.hash(rawToken);
        var token = new ApiToken(tokenId, userId, "persistence-test", 4, now, expiresAt, null, null);

        try {
            userRepository.create(new User(
                userId,
                "api-token-owner",
                "api-token-owner@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                4,
                now,
                now
            ));
            apiTokenRepository.create(token, tokenHash);

            var persisted = apiTokenRepository.findByTokenHash(tokenHash).orElseThrow();
            assertThat(persisted.id()).isEqualTo(tokenId);
            assertThat(persisted.userId()).isEqualTo(userId);
            assertThat(persisted.name()).isEqualTo("persistence-test");
            assertThat(persisted.credentialsVersion()).isEqualTo(4);
            assertThat(persisted.expiresAt()).isEqualTo(expiresAt);
            assertThat(persisted.lastUsedAt()).isNull();
            assertThat(persisted.revokedAt()).isNull();
            assertThat(apiTokenRepository.findAllByUserId(userId)).hasSize(1);
            assertThat(apiTokenRepository.findByIdAndUserId(tokenId, userId)).isPresent();
            assertThat(apiTokenRepository.findByIdAndUserId(tokenId, otherUserId)).isEmpty();

            var lastUsedAt = now.plusSeconds(60);
            apiTokenRepository.updateLastUsedAt(tokenId, lastUsedAt);
            assertThat(apiTokenRepository.findByIdAndUserId(tokenId, userId).orElseThrow().lastUsedAt())
                .isEqualTo(lastUsedAt);

            var revokedAt = now.plusSeconds(120);
            apiTokenRepository.revoke(tokenId, userId, revokedAt);
            assertThat(apiTokenRepository.findByTokenHash(tokenHash).orElseThrow().revokedAt())
                .isEqualTo(revokedAt);
        } finally {
            deleteUser(userId);
        }
    }

    @Test
    void apiToken_enforcesTokenHashUniqueness() {
        var userId = UUID.fromString("22222222-3333-4444-5555-666666666666");
        var now = Instant.now();

        try {
            userRepository.create(new User(
                userId,
                "unique-token-owner",
                "unique-token-owner@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                0,
                now,
                now
            ));
            apiTokenRepository.create(
                new ApiToken(UUID.randomUUID(), userId, "first", 0, now, now.plusSeconds(3600), null, null),
                "DUPLICATED-TOKEN-HASH"
            );

            assertThatThrownBy(() -> apiTokenRepository.create(
                new ApiToken(UUID.randomUUID(), userId, "second", 0, now, now.plusSeconds(3600), null, null),
                "DUPLICATED-TOKEN-HASH"
            )).isInstanceOf(org.springframework.dao.DataIntegrityViolationException.class);
        } finally {
            deleteUser(userId);
        }
    }

    @Test
    void apiToken_enforcesForeignKeyToUser() {
        var now = Instant.now();
        var nonExistentUserId = UUID.fromString("77777777-8888-9999-0000-aaaaaaaaaaaa");

        assertThatThrownBy(() -> apiTokenRepository.create(
            new ApiToken(
                UUID.randomUUID(),
                nonExistentUserId,
                "orphan",
                0,
                now,
                now.plusSeconds(3600),
                null,
                null
            ),
            "ORPHAN-TOKEN-HASH"
        )).isInstanceOf(org.springframework.dao.DataIntegrityViolationException.class);
    }

    @Test
    void apiToken_rejectsEmptyNameAtTheDatabaseBoundary() {
        var userId = UUID.fromString("bbbbbbbb-cccc-dddd-eeee-ffffffffffff");
        var now = Instant.now();

        try {
            userRepository.create(new User(
                userId,
                "blank-name-owner",
                "blank-name-owner@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                0,
                now,
                now
            ));

            assertThatThrownBy(() -> apiTokenRepository.create(
                new ApiToken(UUID.randomUUID(), userId, "   ", 0, now, now.plusSeconds(3600), null, null),
                "BLANK-NAME-TOKEN-HASH"
            )).isInstanceOf(org.springframework.dao.DataIntegrityViolationException.class);
        } finally {
            deleteUser(userId);
        }
    }

    @Test
    void rbacMigration_seedsRoleAdministrationPermissionsAndBuiltInRole() {
        assertThat(dsl.fetch("select code from authentication_permission").getValues(0, String.class))
            .containsExactlyInAnyOrder(PermissionCodes.USERS_MANAGE, PermissionCodes.ROLES_MANAGE);
        assertThat(dsl.fetch("select code from authentication_role").getValues(0, String.class))
            .contains(RoleCodes.SYSTEM_ADMIN);
        assertThat(authorizationRepository.findPermissionCodesByRole(RoleCodes.SYSTEM_ADMIN))
            .containsExactlyInAnyOrder(PermissionCodes.USERS_MANAGE, PermissionCodes.ROLES_MANAGE);
        assertThat(dsl.fetch(
            "select built_in from authentication_role where code = ?",
            RoleCodes.SYSTEM_ADMIN
        ).getValues(0, Boolean.class)).containsExactly(true);
    }

    @Test
    void rbacPermissionCatalogue_isSortedAndIncludesRoleAdministration() {
        assertThat(authorizationRepository.findAllPermissions())
            .containsExactly(
                new PermissionDefinition(
                    PermissionCodes.ROLES_MANAGE,
                    "Manage roles and their permission assignments"
                ),
                new PermissionDefinition(PermissionCodes.USERS_MANAGE, "Manage users")
            );
    }

    @Test
    void rbac_effectivePermissionsAreTheUnionOfAllRolePermissions() {
        var userId = UUID.fromString("a2b2c2d2-e2f2-4a2b-8c2d-2e2f2a2b2c2d");
        var secondRoleId = UUID.fromString("b3c3d3e3-f3a3-4b3c-9d3e-3f3a3b3c3d3e");
        var permissionCode = "test.alpha";

        try {
            insertUser(userId, "rbac-union", "rbac-union@example.test");
            dsl.query(
                "insert into authentication_permission (code, description) values (?, ?)",
                permissionCode,
                "Test alpha"
            ).execute();
            dsl.query(
                "insert into authentication_role (id, code, name) values (?, ?, ?)",
                secondRoleId,
                "test-alpha",
                "Test alpha"
            ).execute();
            dsl.query(
                "insert into authentication_role_permission (role_id, permission_code) values (?, ?)",
                secondRoleId,
                permissionCode
            ).execute();

            authorizationRepository.assignRoleToUser(userId, RoleCodes.SYSTEM_ADMIN);
            authorizationRepository.assignRoleToUser(userId, "test-alpha");

            assertThat(authorizationRepository.findEffectivePermissionCodes(userId))
                .containsExactlyInAnyOrder(
                    PermissionCodes.USERS_MANAGE,
                    PermissionCodes.ROLES_MANAGE,
                    permissionCode
                );
        } finally {
            deleteUser(userId);
            dsl.query("delete from authentication_role where id = ?", secondRoleId).execute();
            dsl.query("delete from authentication_permission where code = ?", permissionCode).execute();
        }
    }

    @Test
    void rbac_roleAssignmentIsIdempotentAndRemovalChangesEffectivePermissions() {
        var userId = UUID.fromString("c4d4e4f4-a4b4-4c4d-8e4f-4a4b4c4d4e4f");

        try {
            insertUser(userId, "rbac-idempotent", "rbac-idempotent@example.test");

            authorizationRepository.assignRoleToUser(userId, RoleCodes.SYSTEM_ADMIN);
            authorizationRepository.assignRoleToUser(userId, RoleCodes.SYSTEM_ADMIN);

            assertThat(authorizationRepository.findEffectivePermissionCodes(userId))
                .containsExactlyInAnyOrder(PermissionCodes.USERS_MANAGE, PermissionCodes.ROLES_MANAGE);
            assertThat(dsl.selectCount()
                .from(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(USER_ROLE_TABLE)))
                .where(org.jooq.impl.DSL.field(
                    org.jooq.impl.DSL.name("user_id"),
                    java.util.UUID.class
                ).eq(userId))
                .fetchOne(0, int.class)).isEqualTo(1);

            authorizationRepository.removeRoleFromUser(userId, RoleCodes.SYSTEM_ADMIN);
            assertThat(authorizationRepository.findEffectivePermissionCodes(userId)).isEmpty();

            authorizationRepository.removeRoleFromUser(userId, RoleCodes.SYSTEM_ADMIN);
            assertThat(authorizationRepository.findEffectivePermissionCodes(userId)).isEmpty();
        } finally {
            deleteUser(userId);
        }
    }

    @Test
    void rbac_changingRolePermissionsAffectsEveryUserOfThatRole() {
        var firstUserId = UUID.fromString("d5e5f5a5-b5c5-4d5e-8f5a-5b5c5d5e5f5a");
        var secondUserId = UUID.fromString("e6f6a6b6-c6d6-4e6f-8a6b-6c6d6e6f6a6b");

        try {
            insertUser(firstUserId, "rbac-shared-first", "rbac-shared-first@example.test");
            insertUser(secondUserId, "rbac-shared-second", "rbac-shared-second@example.test");
            authorizationRepository.assignRoleToUser(firstUserId, RoleCodes.SYSTEM_ADMIN);
            authorizationRepository.assignRoleToUser(secondUserId, RoleCodes.SYSTEM_ADMIN);

            assertThat(authorizationRepository.findEffectivePermissionCodes(firstUserId))
                .contains(PermissionCodes.USERS_MANAGE);
            assertThat(authorizationRepository.findEffectivePermissionCodes(secondUserId))
                .contains(PermissionCodes.USERS_MANAGE);

            authorizationRepository.revokePermissionFromRole(
                RoleCodes.SYSTEM_ADMIN,
                PermissionCodes.USERS_MANAGE
            );

            assertThat(authorizationRepository.findEffectivePermissionCodes(firstUserId))
                .doesNotContain(PermissionCodes.USERS_MANAGE);
            assertThat(authorizationRepository.findEffectivePermissionCodes(secondUserId))
                .doesNotContain(PermissionCodes.USERS_MANAGE);
        } finally {
            authorizationRepository.grantPermissionToRole(
                RoleCodes.SYSTEM_ADMIN,
                PermissionCodes.USERS_MANAGE
            );
            deleteUser(firstUserId);
            deleteUser(secondUserId);
        }
    }

    @Test
    void rbac_enforcesUniquenessForeignKeysAndNonBlankCodes() {
        var userId = UUID.fromString("f7a7b7c7-d7e7-4f7a-8b7c-7d7e7f7a7b7c");

        try {
            insertUser(userId, "rbac-constraints", "rbac-constraints@example.test");

            assertThatThrownBy(() -> dsl.query(
                "insert into authentication_role (id, code, name) values (?, ?, ?)",
                UUID.randomUUID(),
                RoleCodes.SYSTEM_ADMIN,
                "Duplicate role"
            ).execute()).isInstanceOf(DuplicateKeyException.class);

            assertThatThrownBy(() -> dsl.query(
                "insert into authentication_permission (code, description) values (?, ?)",
                PermissionCodes.USERS_MANAGE,
                "Duplicate permission"
            ).execute()).isInstanceOf(DuplicateKeyException.class);

            dsl.query(
                "insert into authentication_user_role (user_id, role_id) "
                    + "select ?, id from authentication_role where code = ?",
                userId,
                RoleCodes.SYSTEM_ADMIN
            ).execute();
            assertThatThrownBy(() -> dsl.query(
                "insert into authentication_user_role (user_id, role_id) "
                    + "select ?, id from authentication_role where code = ?",
                userId,
                RoleCodes.SYSTEM_ADMIN
            ).execute()).isInstanceOf(DuplicateKeyException.class);

            assertThatThrownBy(() -> dsl.query(
                "insert into authentication_user_role (user_id, role_id) "
                    + "select ?, id from authentication_role where code = ?",
                UUID.randomUUID(),
                RoleCodes.SYSTEM_ADMIN
            ).execute()).isInstanceOf(
                org.springframework.dao.DataIntegrityViolationException.class
            );

            assertThatThrownBy(() -> dsl.query(
                "insert into authentication_user_role (user_id, role_id) values (?, ?)",
                userId,
                UUID.randomUUID()
            ).execute()).isInstanceOf(
                org.springframework.dao.DataIntegrityViolationException.class
            );

            assertThatThrownBy(() -> dsl.query(
                "insert into authentication_role_permission (role_id, permission_code) "
                    + "select id, ? from authentication_role where code = ?",
                PermissionCodes.USERS_MANAGE,
                RoleCodes.SYSTEM_ADMIN
            ).execute()).isInstanceOf(DuplicateKeyException.class);

            assertThatThrownBy(() -> dsl.query(
                "insert into authentication_role_permission (role_id, permission_code) values (?, ?)",
                UUID.randomUUID(),
                PermissionCodes.USERS_MANAGE
            ).execute()).isInstanceOf(
                org.springframework.dao.DataIntegrityViolationException.class
            );

            assertThatThrownBy(() -> dsl.query(
                "insert into authentication_role_permission (role_id, permission_code) "
                    + "select id, ? from authentication_role where code = ?",
                "missing.permission",
                RoleCodes.SYSTEM_ADMIN
            ).execute()).isInstanceOf(
                org.springframework.dao.DataIntegrityViolationException.class
            );

            assertThatThrownBy(() -> dsl.query(
                "insert into authentication_role (id, code, name) values (?, ?, ?)",
                UUID.randomUUID(),
                "   ",
                "Blank role"
            ).execute()).isInstanceOf(
                org.springframework.dao.DataIntegrityViolationException.class
            );

            assertThatThrownBy(() -> dsl.query(
                "insert into authentication_role (id, code, name) values (?, ?, ?)",
                UUID.randomUUID(),
                "blank-name-role",
                "   "
            ).execute()).isInstanceOf(
                org.springframework.dao.DataIntegrityViolationException.class
            );

            assertThatThrownBy(() -> dsl.query(
                "insert into authentication_permission (code, description) values (?, ?)",
                "   ",
                "Blank permission"
            ).execute()).isInstanceOf(
                org.springframework.dao.DataIntegrityViolationException.class
            );

            assertThatThrownBy(() -> dsl.query(
                "insert into authentication_permission (code, description) values (?, ?)",
                "blank.description",
                "   "
            ).execute()).isInstanceOf(
                org.springframework.dao.DataIntegrityViolationException.class
            );
        } finally {
            deleteUser(userId);
        }
    }

    @Test
    void rbac_roleDeletionIsRestrictedWhileAssigned() {
        var userId = UUID.fromString("1a2b3c4d-5e6f-4a7b-8c9d-0e1f2a3b4c5d");
        var roleId = UUID.fromString("2b3c4d5e-6f7a-4b8c-9d0e-1f2a3b4c5d6e");

        try {
            insertUser(userId, "rbac-role-in-use", "rbac-role-in-use@example.test");
            dsl.query(
                "insert into authentication_role (id, code, name) values (?, ?, ?)",
                roleId,
                "rbac-role-in-use",
                "RBAC role in use"
            ).execute();
            dsl.query(
                "insert into authentication_user_role (user_id, role_id) values (?, ?)",
                userId,
                roleId
            ).execute();

            assertThat(dsl.fetch(
                "select built_in from authentication_role where id = ?",
                roleId
            ).getValues(0, Boolean.class)).containsExactly(false);

            assertThatThrownBy(() -> dsl.query(
                "delete from authentication_role where id = ?",
                roleId
            ).execute()).isInstanceOf(
                org.springframework.dao.DataIntegrityViolationException.class
            );

            assertThat(dsl.fetchCount(
                org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(ROLE_TABLE)),
                org.jooq.impl.DSL.field(
                    org.jooq.impl.DSL.name("id"),
                    java.util.UUID.class
                ).eq(roleId)
            )).isEqualTo(1);
        } finally {
            deleteUser(userId);
            dsl.query("delete from authentication_role where id = ?", roleId).execute();
        }
    }

    @Test
    void rbac_hasNoIndividualUserPermissionModel() {
        assertThat(dsl.fetch("select tablename from pg_catalog.pg_tables where schemaname = current_schema()")
            .getValues(0, String.class))
            .allMatch(tableName ->
                !tableName.contains("user_permission")
                    && !tableName.contains("user_denied")
                    && !tableName.contains("user_override")
            );

        assertThat(Arrays.stream(AuthorizationRepository.class.getDeclaredMethods())
            .map(method -> method.getName())
            .toList())
            .doesNotContain(
                "assignPermissionToUser",
                "grantPermissionToUser",
                "revokePermissionFromUser",
                "denyPermissionToUser"
            );
    }

    @Test
    void apiTokenTransactionBoundary_livesInInfrastructureFacade() throws Exception {
        Class<?> controller = Class.forName("es.alxarafe.alixar.authentication.api.ApiTokenController");
        Class<?> facade = Class.forName(
            "es.alxarafe.alixar.authentication.infrastructure.TransactionalApiTokenService"
        );

        assertThat(isTransactional(controller, "create")).isFalse();
        assertThat(isTransactional(controller, "revoke")).isFalse();
        assertThat(isTransactional(facade, "create")).isTrue();
        assertThat(isTransactional(facade, "revoke")).isTrue();
    }

    private boolean isTransactional(Class<?> controller, String methodName) {
        return Arrays.stream(controller.getDeclaredMethods())
            .filter(method -> method.getName().equals(methodName))
            .anyMatch(method -> method.isAnnotationPresent(Transactional.class));
    }

    private void deleteUser(UUID userId) {
        dsl.deleteFrom(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(USER_TABLE)))
            .where(org.jooq.impl.DSL.field(org.jooq.impl.DSL.name("id"), java.util.UUID.class).eq(userId))
            .execute();
    }

    private abstract class DelegatingPasswordResetTokenRepository implements PasswordResetTokenRepository {

        @Override
        public Optional<PasswordResetToken> findByTokenHash(String tokenHash) {
            return passwordResetTokenRepository.findByTokenHash(tokenHash);
        }

        @Override
        public void create(PasswordResetToken token) {
            passwordResetTokenRepository.create(token);
        }

        @Override
        public void markAsUsed(UUID tokenId, Instant usedAt) {
            passwordResetTokenRepository.markAsUsed(tokenId, usedAt);
        }

        @Override
        public void invalidatePendingTokensForUser(UUID userId) {
            passwordResetTokenRepository.invalidatePendingTokensForUser(userId);
        }
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