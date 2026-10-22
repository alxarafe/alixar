package es.alxarafe.alixar.persistence;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditActorResolver;
import es.alxarafe.alixar.audit.application.AuditCanonicalEncoder;
import es.alxarafe.alixar.audit.application.AuditChainSource;
import es.alxarafe.alixar.audit.application.AuditChainVerifier;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.application.AuditEventQuery;
import es.alxarafe.alixar.audit.application.AuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditHashCalculator;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditVerificationFailure;
import es.alxarafe.alixar.audit.application.AuditVerificationResult;
import es.alxarafe.alixar.audit.application.ListAuditEventsUseCase;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditChainHead;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.domain.AuditResult;
import es.alxarafe.alixar.audit.infrastructure.AuditConfigurationBootstrap;
import es.alxarafe.alixar.audit.infrastructure.AuditProperties;
import es.alxarafe.alixar.audit.infrastructure.CachedAuditPolicyProvider;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditConfigurationService;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditService;
import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.AuthenticateUserUseCase;
import es.alxarafe.alixar.authentication.application.BuiltInRoleImmutableException;
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
import es.alxarafe.alixar.authentication.application.PermissionNotFoundException;
import es.alxarafe.alixar.authentication.application.ResetPasswordUseCase;
import es.alxarafe.alixar.authentication.application.RoleAlreadyExistsException;
import es.alxarafe.alixar.authentication.application.RoleCodes;
import es.alxarafe.alixar.authentication.application.RoleDefinition;
import es.alxarafe.alixar.authentication.application.RoleInUseException;
import es.alxarafe.alixar.authentication.application.RoleNotFoundException;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.application.UsernameAlreadyExistsException;
import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.domain.PasswordResetToken;
import es.alxarafe.alixar.authentication.domain.User;
import es.alxarafe.alixar.authentication.infrastructure.TransactionalAdminUserService;
import es.alxarafe.alixar.authentication.infrastructure.TransactionalAdminRoleService;
import es.alxarafe.alixar.authentication.infrastructure.TransactionalApiTokenService;
import es.alxarafe.alixar.authentication.infrastructure.TransactionalPasswordRecovery;
import es.alxarafe.alixar.authentication.infrastructure.TransactionalUserSelfService;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.stream.Stream;
import javax.sql.DataSource;
import org.flywaydb.core.Flyway;
import org.jooq.DSLContext;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Primary;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

// Runs explicitly in bin/check against its isolated Compose database.
@SpringBootTest(properties = "spring.autoconfigure.exclude=")
@Import(PersistenceIT.FixedAuditActorConfiguration.class)
class PersistenceIT {

    private static final UUID AUDIT_TEST_ACTOR_ID =
        UUID.fromString("6e337a8b-7e9b-4f2d-8a0f-1b4c5d6e7f80");
    private static final String POSTGRESQL_VERSION = "18.6";
    private static final String HISTORY_TABLE = "flyway_schema_history";
    private static final String USER_TABLE = "authentication_user";
    private static final String RESET_TOKEN_TABLE = "authentication_password_reset";
    private static final String API_TOKEN_TABLE = "authentication_api_token";
    private static final String ROLE_TABLE = "authentication_role";
    private static final String PERMISSION_TABLE = "authentication_permission";
    private static final String ROLE_PERMISSION_TABLE = "authentication_role_permission";
    private static final String USER_ROLE_TABLE = "authentication_user_role";
    private static final String AUDIT_HEAD_TABLE = "audit_chain_head";
    private static final String AUDIT_EVENT_TABLE = "audit_event";
    private static final String AUDIT_CONFIGURATION_TABLE = "audit_configuration";
    private static final UUID AUDIT_CHAIN_ID = AuditChain.DEFAULT_CHAIN_ID;

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

    @Autowired
    private TransactionalAdminRoleService transactionalAdminRoleService;

    @Autowired
    private TransactionalApiTokenService transactionalApiTokenService;

    @Autowired
    private TransactionalUserSelfService transactionalUserSelfService;

    @Autowired
    private TransactionalPasswordRecovery transactionalPasswordRecovery;

    @Autowired
    private TransactionalAuditService transactionalAuditService;

    @Autowired
    private AuditChainVerifier auditChainVerifier;

    @Autowired
    private BlockingAuditChainSource blockingAuditChainSource;

    @Autowired
    private ListAuditEventsUseCase listAuditEvents;

    @Autowired
    private AuditProperties auditProperties;

    @Autowired
    private CachedAuditPolicyProvider auditPolicyProvider;

    @Autowired
    private AuditConfigurationBootstrap auditConfigurationBootstrap;

    @Autowired
    private TransactionalAuditConfigurationService transactionalAuditConfigurationService;

    @Test
    void bootIntegratesPostgresqlFlywayJooqAndAuthenticationMigration() throws Exception {
        try (var connection = dataSource.getConnection()) {
            assertThat(connection.getMetaData().getDatabaseProductVersion())
                .startsWith(POSTGRESQL_VERSION);
        }
        assertThat(flyway.getConfiguration().getDataSource()).isSameAs(dataSource);
        assertThat(flyway.info().all()).hasSize(9);
        assertThat(flyway.info().current().getVersion().getVersion()).isEqualTo("9");
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
                USER_ROLE_TABLE,
                AUDIT_HEAD_TABLE,
                AUDIT_EVENT_TABLE,
                AUDIT_CONFIGURATION_TABLE
            );
        assertThat(dsl.fetchCount(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(HISTORY_TABLE))))
            .isEqualTo(9);
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
            .containsExactlyInAnyOrder(
                PermissionCodes.USERS_MANAGE,
                PermissionCodes.ROLES_MANAGE,
                PermissionCodes.AUDIT_READ,
                PermissionCodes.AUDIT_CONFIGURE
            );
        assertThat(dsl.fetch("select code from authentication_role").getValues(0, String.class))
            .contains(RoleCodes.SYSTEM_ADMIN);
        assertThat(authorizationRepository.findPermissionCodesByRole(RoleCodes.SYSTEM_ADMIN))
            .containsExactlyInAnyOrder(
                PermissionCodes.USERS_MANAGE,
                PermissionCodes.ROLES_MANAGE,
                PermissionCodes.AUDIT_READ,
                PermissionCodes.AUDIT_CONFIGURE
            );
        assertThat(dsl.fetch(
            "select built_in from authentication_role where code = ?",
            RoleCodes.SYSTEM_ADMIN
        ).getValues(0, Boolean.class)).containsExactly(true);
    }

    @Test
    void rbacPermissionCatalogue_isSortedAndIncludesRoleAdministration() {
        assertThat(authorizationRepository.findAllPermissions())
            .containsExactly(
                new PermissionDefinition(PermissionCodes.AUDIT_CONFIGURE, "Configure audit policy"),
                new PermissionDefinition(PermissionCodes.AUDIT_READ, "Read audit events"),
                new PermissionDefinition(
                    PermissionCodes.ROLES_MANAGE,
                    "Manage roles and their permission assignments"
                ),
                new PermissionDefinition(PermissionCodes.USERS_MANAGE, "Manage users")
            );
    }

    @Test
    void rbac_adminRoleCreationPersistsPermissionsWithoutUserAssignmentsAndRejectsConflicts() {
        String roleCode = "db-created-role";

        try {
            RoleDefinition created = transactionalAdminRoleService.create(
                roleCode,
                "DB created role",
                List.of(PermissionCodes.USERS_MANAGE, PermissionCodes.ROLES_MANAGE)
            );

            assertThat(created.builtIn()).isFalse();
            assertThat(authorizationRepository.findRoleByCode(roleCode))
                .contains(new RoleDefinition(
                    created.id(),
                    roleCode,
                    "DB created role",
                    false,
                    List.of(PermissionCodes.ROLES_MANAGE, PermissionCodes.USERS_MANAGE)
                ));
            assertThat(dsl.fetch(
                "select count(*) from authentication_user_role ur "
                    + "join authentication_role r on r.id = ur.role_id where r.code = ?",
                roleCode
            ).getValues(0, Long.class)).containsExactly(0L);

            assertThatThrownBy(() -> authorizationRepository.createRole(new RoleDefinition(
                UUID.randomUUID(),
                roleCode,
                "Concurrent duplicate",
                false,
                List.of()
            ))).isInstanceOf(RoleAlreadyExistsException.class);

            assertThatThrownBy(() -> transactionalAdminRoleService.create(
                "unknown-permission-role",
                "Unknown permission role",
                List.of("missing.permission")
            )).isInstanceOf(PermissionNotFoundException.class);
            assertThat(authorizationRepository.findRoleByCode("unknown-permission-role")).isEmpty();
        } finally {
            dsl.query("delete from authentication_role where code = ?", roleCode).execute();
            dsl.query("delete from authentication_role where code = ?", "unknown-permission-role").execute();
        }
    }

    @Test
    void rbac_adminRoleRenamePreservesAssignmentsPermissionsAndCredentialsVersion() {
        var userId = UUID.fromString("d1e1f1a1-b1c1-4d1e-8f1a-1b1c1d1e1f1a");
        String roleCode = "db-renamed-role";

        try {
            insertUser(userId, "rbac-renamed", "rbac-renamed@example.test");
            RoleDefinition created = transactionalAdminRoleService.create(
                roleCode,
                "Original name",
                List.of(PermissionCodes.USERS_MANAGE)
            );
            authorizationRepository.assignRoleToUser(userId, roleCode);
            long credentialsVersionBefore = userRepository.findById(userId).orElseThrow().credentialsVersion();

            RoleDefinition renamed = transactionalAdminRoleService.updateName(roleCode, " Renamed role ");

            assertThat(renamed.code()).isEqualTo(roleCode);
            assertThat(renamed.name()).isEqualTo("Renamed role");
            assertThat(renamed.builtIn()).isFalse();
            assertThat(renamed.permissionCodes()).containsExactly(PermissionCodes.USERS_MANAGE);
            assertThat(authorizationRepository.findRoleByCode(roleCode))
                .contains(new RoleDefinition(
                    created.id(),
                    roleCode,
                    "Renamed role",
                    false,
                    List.of(PermissionCodes.USERS_MANAGE)
                ));
            assertThat(authorizationRepository.findRoleCodesForUser(userId)).containsExactly(roleCode);
            assertThat(userRepository.findById(userId).orElseThrow().credentialsVersion())
                .isEqualTo(credentialsVersionBefore);
        } finally {
            deleteUser(userId);
            dsl.query("delete from authentication_role where code = ?", roleCode).execute();
        }
    }

    @Test
    void rbac_adminRolePermissionReplacementIsAtomicAndBuiltInRolesAreImmutable() {
        String roleCode = "db-permissions-role";

        try {
            RoleDefinition created = transactionalAdminRoleService.create(
                roleCode,
                "Permissions role",
                List.of(PermissionCodes.USERS_MANAGE)
            );

            RoleDefinition replaced = transactionalAdminRoleService.replacePermissions(
                roleCode,
                List.of(" ROLES.MANAGE ", "roles.manage", "users.manage")
            );

            assertThat(replaced.id()).isEqualTo(created.id());
            assertThat(replaced.name()).isEqualTo("Permissions role");
            assertThat(replaced.builtIn()).isFalse();
            assertThat(replaced.permissionCodes()).containsExactly(
                PermissionCodes.ROLES_MANAGE,
                PermissionCodes.USERS_MANAGE
            );

            assertThatThrownBy(() -> transactionalAdminRoleService.replacePermissions(
                roleCode,
                List.of(PermissionCodes.ROLES_MANAGE, "missing.permission")
            )).isInstanceOf(PermissionNotFoundException.class);

            assertThat(authorizationRepository.findPermissionCodesByRole(roleCode))
                .containsExactlyInAnyOrder(PermissionCodes.ROLES_MANAGE, PermissionCodes.USERS_MANAGE);

            assertThat(transactionalAdminRoleService.replacePermissions(roleCode, List.of()).permissionCodes())
                .isEmpty();
            assertThat(dsl.fetch(
                "select count(*) from authentication_role_permission rp "
                    + "join authentication_role r on r.id = rp.role_id where r.code = ?",
                roleCode
            ).getValues(0, Long.class)).containsExactly(0L);

            assertThatThrownBy(() -> transactionalAdminRoleService.updateName(
                RoleCodes.SYSTEM_ADMIN,
                "Renamed built-in"
            )).isInstanceOf(BuiltInRoleImmutableException.class);
            assertThatThrownBy(() -> transactionalAdminRoleService.replacePermissions(
                RoleCodes.SYSTEM_ADMIN,
                List.of()
            )).isInstanceOf(BuiltInRoleImmutableException.class);
            assertThatThrownBy(() -> transactionalAdminRoleService.delete(RoleCodes.SYSTEM_ADMIN))
                .isInstanceOf(BuiltInRoleImmutableException.class);
            RoleDefinition builtIn = authorizationRepository.findRoleByCode(RoleCodes.SYSTEM_ADMIN)
                .orElseThrow();
            assertThat(builtIn.code()).isEqualTo(RoleCodes.SYSTEM_ADMIN);
            assertThat(builtIn.name()).isEqualTo("System administrator");
            assertThat(builtIn.builtIn()).isTrue();
            assertThat(builtIn.permissionCodes()).containsExactly(
                PermissionCodes.AUDIT_CONFIGURE,
                PermissionCodes.AUDIT_READ,
                PermissionCodes.ROLES_MANAGE,
                PermissionCodes.USERS_MANAGE
            );
        } finally {
            dsl.query("delete from authentication_role where code = ?", roleCode).execute();
        }
    }

    @Test
    void rbac_adminRoleDeletionIsRestrictedWhileAssignedAndCascadesPermissionsWhenFree() {
        var userId = UUID.fromString("e2f2a2b2-c2d2-4e2f-8a2b-2c2d2e2f2a2b");
        String inUseRoleCode = "db-in-use-role";
        String freeRoleCode = "db-free-role";

        try {
            insertUser(userId, "rbac-delete-role", "rbac-delete-role@example.test");
            transactionalAdminRoleService.create(inUseRoleCode, "In use role", List.of(PermissionCodes.USERS_MANAGE));
            authorizationRepository.assignRoleToUser(userId, inUseRoleCode);

            assertThatThrownBy(() -> transactionalAdminRoleService.delete(inUseRoleCode))
                .isInstanceOf(RoleInUseException.class);

            assertThat(authorizationRepository.findRoleByCode(inUseRoleCode)).isPresent();
            assertThat(dsl.fetch(
                "select count(*) from authentication_user_role ur "
                    + "join authentication_role r on r.id = ur.role_id where r.code = ?",
                inUseRoleCode
            ).getValues(0, Long.class)).containsExactly(1L);

            transactionalAdminRoleService.create(freeRoleCode, "Free role", List.of(PermissionCodes.USERS_MANAGE));
            assertThat(dsl.fetch(
                "select count(*) from authentication_role_permission rp "
                    + "join authentication_role r on r.id = rp.role_id where r.code = ?",
                freeRoleCode
            ).getValues(0, Long.class)).containsExactly(1L);

            transactionalAdminRoleService.delete(freeRoleCode);

            assertThat(authorizationRepository.findRoleByCode(freeRoleCode)).isEmpty();
            assertThat(dsl.fetch(
                "select count(*) from authentication_role_permission rp "
                    + "join authentication_role r on r.id = rp.role_id where r.code = ?",
                freeRoleCode
            ).getValues(0, Long.class)).containsExactly(0L);
        } finally {
            deleteUser(userId);
            dsl.query("delete from authentication_role where code = ?", inUseRoleCode).execute();
            dsl.query("delete from authentication_role where code = ?", freeRoleCode).execute();
        }
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
                    PermissionCodes.AUDIT_READ,
                    PermissionCodes.AUDIT_CONFIGURE,
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
                .containsExactlyInAnyOrder(
                    PermissionCodes.USERS_MANAGE,
                    PermissionCodes.ROLES_MANAGE,
                    PermissionCodes.AUDIT_READ,
                    PermissionCodes.AUDIT_CONFIGURE
                );
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

    @Test
    void auditTransactionBoundary_livesInInfrastructureFacade() throws Exception {
        Class<?> facade = Class.forName(
            "es.alxarafe.alixar.audit.infrastructure.TransactionalAuditService"
        );

        assertThat(isTransactional(facade, "append")).isTrue();
        var verification = facade.getDeclaredMethod("verify", UUID.class)
            .getAnnotation(Transactional.class);
        assertThat(verification).isNotNull();
        assertThat(verification.readOnly()).isTrue();
        assertThat(verification.isolation()).isEqualTo(Isolation.REPEATABLE_READ);
    }

    @Test
    void auditVerification_usesSingleSnapshotDuringConcurrentAppend() throws Exception {
        resetAuditChain();
        appendAuditEvents(3);
        var gate = blockingAuditChainSource.blockNextEventRead();
        ExecutorService executor = Executors.newSingleThreadExecutor();

        try {
            Future<AuditVerificationResult> verification = executor.submit(
                () -> transactionalAuditService.verify(AUDIT_CHAIN_ID)
            );
            assertThat(gate.awaitStarted()).isTrue();

            transactionalAuditService.append(auditDraft("CONCURRENT_VERIFICATION"));
            gate.release();

            AuditVerificationResult result = verification.get(30, TimeUnit.SECONDS);
            assertThat(result.valid()).isTrue();
            assertThat(result.checkedEvents()).isEqualTo(3);

            AuditVerificationResult afterAppend =
                transactionalAuditService.verify(AUDIT_CHAIN_ID);
            assertThat(afterAppend.valid()).isTrue();
            assertThat(afterAppend.checkedEvents()).isEqualTo(4);
        } finally {
            gate.release();
            executor.shutdownNow();
            executor.awaitTermination(10, TimeUnit.SECONDS);
            resetAuditChain();
        }
    }

    @Test
    void auditConcurrentAppends_produceSingleUnforkedChain() throws Exception {
        resetAuditChain();
        int writers = 8;
        ExecutorService executor = Executors.newFixedThreadPool(writers);
        CountDownLatch ready = new CountDownLatch(writers);
        CountDownLatch start = new CountDownLatch(1);

        try {
            List<Future<AuditEvent>> futures = new ArrayList<>();
            for (int index = 0; index < writers; index++) {
                int writer = index;
                futures.add(executor.submit(() -> {
                    ready.countDown();
                    start.await();
                    return transactionalAuditService.append(auditDraft("CONCURRENT_" + writer));
                }));
            }

            assertThat(ready.await(10, TimeUnit.SECONDS)).isTrue();
            start.countDown();

            List<AuditEvent> events = new ArrayList<>();
            for (Future<AuditEvent> future : futures) {
                events.add(future.get(30, TimeUnit.SECONDS));
            }

            assertThat(events).hasSize(writers);
            assertThat(events.stream().map(AuditEvent::sequence).sorted().toList())
                .containsExactlyElementsOf(
                    java.util.stream.LongStream.rangeClosed(1, writers).boxed().toList()
                );
            assertThat(events.stream().map(AuditEvent::sequence).distinct().count())
                .isEqualTo(writers);

            AuditVerificationResult result = auditChainVerifier.verify(AUDIT_CHAIN_ID);
            assertThat(result.valid()).isTrue();
            assertThat(result.checkedEvents()).isEqualTo(writers);
        } finally {
            executor.shutdownNow();
            executor.awaitTermination(10, TimeUnit.SECONDS);
            resetAuditChain();
        }
    }

    @Test
    void auditVerifier_rejectsDirectDatabaseTampering() {
        resetAuditChain();
        try {
            appendAuditEvents(3);
            assertThat(auditChainVerifier.verify(AUDIT_CHAIN_ID).valid()).isTrue();

            dsl.query(
                "update audit_event set action = 'TAMPERED' where chain_id = ? and sequence = 2",
                AUDIT_CHAIN_ID
            ).execute();
            assertAuditVerificationFails(AuditVerificationFailure.EVENT_HASH_MISMATCH, 2);

            resetAuditChain();
            appendAuditEvents(3);
            dsl.query(
                "delete from audit_event where chain_id = ? and sequence = 2",
                AUDIT_CHAIN_ID
            ).execute();
            assertAuditVerificationFails(AuditVerificationFailure.SEQUENCE_MISMATCH, 2);

            resetAuditChain();
            appendAuditEvents(3);
            dsl.query(
                "update audit_event set previous_hash = ? where chain_id = ? and sequence = 2",
                "f".repeat(64),
                AUDIT_CHAIN_ID
            ).execute();
            assertAuditVerificationFails(AuditVerificationFailure.PREVIOUS_HASH_MISMATCH, 2);

            resetAuditChain();
            appendAuditEvents(3);
            dsl.query(
                "update audit_event set event_hash = ? where chain_id = ? and sequence = 2",
                "e".repeat(64),
                AUDIT_CHAIN_ID
            ).execute();
            assertAuditVerificationFails(AuditVerificationFailure.EVENT_HASH_MISMATCH, 2);

            resetAuditChain();
            appendAuditEvents(3);
            dsl.query(
                "update audit_event set sequence = 99 where chain_id = ? and sequence = 2",
                AUDIT_CHAIN_ID
            ).execute();
            assertAuditVerificationFails(AuditVerificationFailure.SEQUENCE_MISMATCH, 2);
        } finally {
            resetAuditChain();
        }
    }

    @Test
    void auditChainHead_cannotBeDeletedWhileEventsExist() {
        resetAuditChain();
        try {
            appendAuditEvents(1);

            assertThatThrownBy(() -> dsl.query(
                "delete from audit_chain_head where chain_id = ?",
                AUDIT_CHAIN_ID
            ).execute()).isInstanceOf(org.springframework.dao.DataIntegrityViolationException.class);
        } finally {
            resetAuditChain();
        }
    }

    @Test
    void auditEvent_doesNotPersistRetentionMetadataYet() {
        assertThat(dsl.fetch(
            "select column_name from information_schema.columns where table_name = ?",
            AUDIT_EVENT_TABLE
        ).getValues(0, String.class))
            .doesNotContain("expires_at", "legal_hold");
    }

    @Test
    void auditQuery_paginatesAndFiltersWithoutDuplicatesOrOmissions() {
        UUID aliceId = UUID.fromString("1a2b3c4d-5e6f-4a70-8b91-c2d3e4f50617");
        UUID bobId = UUID.fromString("2b3c4d5e-6f70-4b81-9ca2-d3e4f5061728");

        resetAuditChain();
        try {
            appendQueryEvent(
                AuditAction.ADMIN_USER_CREATED,
                AuditResourceType.USER,
                "user-1",
                aliceId,
                "alice",
                AuditResult.SUCCESS
            );
            appendQueryEvent(
                AuditAction.API_TOKEN_CREATED,
                AuditResourceType.API_TOKEN,
                "token-1",
                bobId,
                "bob",
                AuditResult.SUCCESS
            );
            appendQueryEvent(
                AuditAction.ROLE_CREATED,
                AuditResourceType.ROLE,
                "role-1",
                aliceId,
                "alice",
                AuditResult.FAILURE
            );
            appendQueryEvent(
                AuditAction.ADMIN_USER_CREATED,
                AuditResourceType.USER,
                "user-2",
                bobId,
                "bob",
                AuditResult.SUCCESS
            );
            appendQueryEvent(
                AuditAction.API_TOKEN_REVOKED,
                AuditResourceType.API_TOKEN,
                "token-1",
                aliceId,
                "alice",
                AuditResult.SUCCESS
            );
            appendQueryEvent(
                AuditAction.ROLE_DELETED,
                AuditResourceType.ROLE,
                "role-1",
                bobId,
                "bob",
                AuditResult.DENIED
            );
            appendQueryEvent(
                AuditAction.ADMIN_USER_CREATED,
                AuditResourceType.USER,
                "user-3",
                aliceId,
                "alice",
                AuditResult.SUCCESS
            );

            List<AuditEvent> page1 = listAuditEvents.execute(query(0, 3, null, null, null, null, null));
            List<AuditEvent> page2 = listAuditEvents.execute(query(3, 3, null, null, null, null, null));
            List<AuditEvent> page3 = listAuditEvents.execute(query(6, 3, null, null, null, null, null));

            assertThat(sequences(page1)).containsExactly(1L, 2L, 3L);
            assertThat(sequences(page2)).containsExactly(4L, 5L, 6L);
            assertThat(sequences(page3)).containsExactly(7L);
            assertThat(Stream.of(page1, page2, page3)
                .flatMap(List::stream)
                .map(AuditEvent::sequence)
                .toList()).containsExactly(1L, 2L, 3L, 4L, 5L, 6L, 7L);

            assertThat(sequences(listAuditEvents.execute(query(
                0,
                10,
                AuditAction.ADMIN_USER_CREATED,
                AuditResourceType.USER,
                null,
                null,
                AuditResult.SUCCESS
            )))).containsExactly(1L, 4L, 7L);
            assertThat(sequences(listAuditEvents.execute(query(
                0,
                10,
                null,
                null,
                null,
                bobId,
                null
            )))).containsExactly(2L, 4L, 6L);
            assertThat(sequences(listAuditEvents.execute(query(
                0,
                10,
                null,
                null,
                null,
                null,
                AuditResult.DENIED
            )))).containsExactly(6L);
            assertThat(sequences(listAuditEvents.execute(query(
                0,
                10,
                null,
                null,
                "token-1",
                null,
                null
            )))).containsExactly(2L, 5L);
            assertThat(sequences(listAuditEvents.execute(query(
                4,
                10,
                null,
                null,
                null,
                null,
                null
            )))).containsExactly(5L, 6L, 7L);
        } finally {
            resetAuditChain();
        }
    }

    @Test
    void basicAuditMode_auditAppendFailureRollsBackAdministrativeEnablement() {
        UUID userId = UUID.randomUUID();
        Instant now = Instant.now();
        String resetTokenHash = tokenHasher.hash(PasswordResetTokenGenerator.generate());

        resetAuditChain();
        setAuditMode(AuditMode.BASIC);
        try {
            userRepository.create(new User(
                userId,
                "audit-rollback-" + userId,
                "audit-rollback-" + userId + "@example.test",
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

            dsl.query(
                "delete from audit_chain_head where chain_id = ?",
                AUDIT_CHAIN_ID
            ).execute();

            assertThatThrownBy(() -> transactionalAdminUserService.setEnabled(userId, false))
                .isInstanceOf(IllegalStateException.class);

            User afterFailure = userRepository.findById(userId).orElseThrow();
            assertThat(afterFailure.enabled()).isTrue();
            assertThat(afterFailure.credentialsVersion()).isEqualTo(2);
            assertThat(passwordResetTokenRepository.findByTokenHash(resetTokenHash).orElseThrow().isUsed())
                .isFalse();
            assertThat(dsl.fetchCount(
                org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(AUDIT_EVENT_TABLE))
            )).isZero();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
            deleteUser(userId);
        }
    }


    @Test
    void basicAuditMode_auditAppendFailureRollsBackAdminUserCreation() {
        String suffix = UUID.randomUUID().toString();
        String username = "audit-create-" + suffix;
        resetAuditChain();
        setAuditMode(AuditMode.BASIC);
        try {
            deleteAuditChainHead();

            assertThatThrownBy(() -> transactionalAdminUserService.create(
                username,
                username + "@example.test",
                "original-password-123",
                List.of()
            )).isInstanceOf(IllegalStateException.class);

            assertThat(userRepository.findByUsername(username)).isEmpty();
            assertThat(dsl.fetchCount(
                org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(AUDIT_EVENT_TABLE))
            )).isZero();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
        }
    }

    @Test
    void basicAuditMode_auditAppendFailureRollsBackAdminPasswordReset() {
        UUID userId = UUID.randomUUID();
        Instant now = Instant.now();
        String username = "audit-admin-reset-" + userId;
        String tokenHash = tokenHasher.hash(PasswordResetTokenGenerator.generate());

        resetAuditChain();
        setAuditMode(AuditMode.BASIC);
        try {
            userRepository.create(new User(
                userId,
                username,
                username + "@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                2,
                now,
                now
            ));
            passwordResetTokenRepository.create(new PasswordResetToken(
                UUID.randomUUID(),
                userId,
                tokenHash,
                now.plusSeconds(1800),
                null,
                now
            ));
            deleteAuditChainHead();

            assertThatThrownBy(() -> transactionalAdminUserService.resetPassword(
                userId,
                "new-admin-password-123"
            )).isInstanceOf(IllegalStateException.class);

            User persisted = userRepository.findById(userId).orElseThrow();
            assertThat(persisted.credentialsVersion()).isEqualTo(2);
            assertThat(passwordHasher.matches("original-password-123", persisted.passwordHash())).isTrue();
            assertThat(passwordResetTokenRepository.findByTokenHash(tokenHash).orElseThrow().isUsed())
                .isFalse();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
            deleteUser(userId);
        }
    }

    @Test
    void basicAuditMode_auditAppendFailureRollsBackAdminRoleReplacement() {
        UUID userId = UUID.randomUUID();
        Instant now = Instant.now();
        String username = "audit-admin-roles-" + userId;

        resetAuditChain();
        setAuditMode(AuditMode.BASIC);
        try {
            userRepository.create(new User(
                userId,
                username,
                username + "@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                2,
                now,
                now
            ));
            authorizationRepository.assignRoleToUser(userId, RoleCodes.SYSTEM_ADMIN);
            deleteAuditChainHead();

            assertThatThrownBy(() -> transactionalAdminUserService.replaceRoles(userId, List.of()))
                .isInstanceOf(IllegalStateException.class);

            assertThat(authorizationRepository.findRoleCodesForUser(userId))
                .containsExactly(RoleCodes.SYSTEM_ADMIN);
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
            deleteUser(userId);
        }
    }

    @Test
    void basicAuditMode_auditAppendFailureRollsBackSelfServicePasswordChange() {
        UUID userId = UUID.randomUUID();
        Instant now = Instant.now();
        String username = "audit-self-password-" + userId;
        String tokenHash = tokenHasher.hash(PasswordResetTokenGenerator.generate());

        resetAuditChain();
        setAuditMode(AuditMode.BASIC);
        try {
            userRepository.create(new User(
                userId,
                username,
                username + "@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                2,
                now,
                now
            ));
            passwordResetTokenRepository.create(new PasswordResetToken(
                UUID.randomUUID(),
                userId,
                tokenHash,
                now.plusSeconds(1800),
                null,
                now
            ));
            deleteAuditChainHead();

            assertThatThrownBy(() -> transactionalUserSelfService.changePassword(
                userId,
                "original-password-123",
                "new-self-password-123"
            )).isInstanceOf(IllegalStateException.class);

            User persisted = userRepository.findById(userId).orElseThrow();
            assertThat(persisted.credentialsVersion()).isEqualTo(2);
            assertThat(passwordHasher.matches("original-password-123", persisted.passwordHash())).isTrue();
            assertThat(passwordResetTokenRepository.findByTokenHash(tokenHash).orElseThrow().isUsed())
                .isFalse();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
            deleteUser(userId);
        }
    }

    @Test
    void basicAuditMode_auditAppendFailureRollsBackPasswordResetCompleted() {
        UUID userId = UUID.randomUUID();
        Instant now = Instant.now();
        String username = "audit-recovery-reset-" + userId;
        String rawToken = PasswordResetTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);

        resetAuditChain();
        setAuditMode(AuditMode.BASIC);
        try {
            userRepository.create(new User(
                userId,
                username,
                username + "@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                2,
                now,
                now
            ));
            passwordResetTokenRepository.create(new PasswordResetToken(
                UUID.randomUUID(),
                userId,
                tokenHash,
                now.plusSeconds(1800),
                null,
                now
            ));
            deleteAuditChainHead();

            assertThatThrownBy(() -> transactionalPasswordRecovery.resetPassword(
                rawToken,
                "new-recovery-password-123"
            )).isInstanceOf(IllegalStateException.class);

            User persisted = userRepository.findById(userId).orElseThrow();
            assertThat(persisted.credentialsVersion()).isEqualTo(2);
            assertThat(passwordHasher.matches("original-password-123", persisted.passwordHash())).isTrue();
            assertThat(passwordResetTokenRepository.findByTokenHash(tokenHash).orElseThrow().isUsed())
                .isFalse();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
            deleteUser(userId);
        }
    }

    @Test
    void basicAuditMode_auditAppendFailureRollsBackApiTokenCreation() {
        UUID userId = UUID.randomUUID();
        Instant now = Instant.now();

        resetAuditChain();
        setAuditMode(AuditMode.BASIC);
        try {
            userRepository.create(new User(
                userId,
                "audit-token-create-" + userId,
                "audit-token-create-" + userId + "@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                0,
                now,
                now
            ));
            deleteAuditChainHead();

            assertThatThrownBy(() -> transactionalApiTokenService.create(
                userId,
                "audited-token",
                now.plusSeconds(3600)
            )).isInstanceOf(IllegalStateException.class);

            assertThat(apiTokenRepository.findAllByUserId(userId)).isEmpty();
            assertThat(dsl.fetchCount(
                org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(AUDIT_EVENT_TABLE))
            )).isZero();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
            deleteUser(userId);
        }
    }

    @Test
    void basicAuditMode_auditAppendFailureRollsBackRolePermissionReplacement() {
        String roleCode = "audit-permissions-role";

        resetAuditChain();
        setAuditMode(AuditMode.OFF);
        try {
            transactionalAdminRoleService.create(
                roleCode,
                "Audited permissions role",
                List.of(PermissionCodes.USERS_MANAGE)
            );
            setAuditMode(AuditMode.BASIC);
            deleteAuditChainHead();

            assertThatThrownBy(() -> transactionalAdminRoleService.replacePermissions(
                roleCode,
                List.of(PermissionCodes.ROLES_MANAGE)
            )).isInstanceOf(IllegalStateException.class);

            assertThat(authorizationRepository.findPermissionCodesByRole(roleCode))
                .containsExactly(PermissionCodes.USERS_MANAGE);
            assertThat(dsl.fetchCount(
                org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(AUDIT_EVENT_TABLE))
            )).isZero();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
            dsl.query("delete from authentication_role where code = ?", roleCode).execute();
        }
    }

    @Test
    void basicAuditMode_auditAppendFailureRollsBackRoleDeletion() {
        String roleCode = "audit-deleted-role";

        resetAuditChain();
        setAuditMode(AuditMode.OFF);
        try {
            transactionalAdminRoleService.create(roleCode, "Audited deleted role", List.of());
            setAuditMode(AuditMode.BASIC);
            deleteAuditChainHead();

            assertThatThrownBy(() -> transactionalAdminRoleService.delete(roleCode))
                .isInstanceOf(IllegalStateException.class);

            assertThat(authorizationRepository.findRoleByCode(roleCode)).isPresent();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
            dsl.query("delete from authentication_role where code = ?", roleCode).execute();
        }
    }

    @Test
    void basicAuditMode_recordsApiTokenAndRoleEventsInOneChain() {
        String suffix = UUID.randomUUID().toString();
        UUID userId = UUID.randomUUID();
        Instant now = Instant.now();
        String roleCode = "audit-token-role";

        resetAuditChain();
        setAuditMode(AuditMode.OFF);
        try {
            userRepository.create(new User(
                userId,
                "audit-token-chain-" + suffix,
                "audit-token-chain-" + suffix + "@example.test",
                passwordHasher.hash("original-password-123"),
                true,
                0,
                now,
                now
            ));

            setAuditMode(AuditMode.BASIC);
            var createdToken = transactionalApiTokenService.create(
                userId,
                "audited-token",
                now.plusSeconds(3600)
            );
            RoleDefinition createdRole = transactionalAdminRoleService.create(
                roleCode,
                "Audited role",
                List.of(PermissionCodes.USERS_MANAGE)
            );
            transactionalAdminRoleService.updateName(roleCode, "Renamed audited role");
            transactionalAdminRoleService.replacePermissions(roleCode, List.of(PermissionCodes.ROLES_MANAGE));
            transactionalAdminRoleService.updateName(roleCode, " Renamed audited role ");
            transactionalAdminRoleService.replacePermissions(roleCode, List.of(" ROLES.MANAGE "));
            transactionalApiTokenService.revoke(userId, createdToken.token().id());
            transactionalApiTokenService.revoke(userId, createdToken.token().id());
            transactionalAdminRoleService.delete(roleCode);

            var events = dsl.fetch(
                "select action, authentication_type, actor_user_id, resource_type, "
                    + "resource_id from audit_event order by sequence"
            );
            assertThat(events.getValues("action", String.class)).containsExactly(
                AuditAction.API_TOKEN_CREATED.name(),
                AuditAction.ROLE_CREATED.name(),
                AuditAction.ROLE_RENAMED.name(),
                AuditAction.ROLE_PERMISSIONS_REPLACED.name(),
                AuditAction.API_TOKEN_REVOKED.name(),
                AuditAction.ROLE_DELETED.name()
            );
            assertThat(events.getValues("authentication_type", String.class))
                .containsOnly(AuditAuthenticationType.SESSION.name());
            assertThat(events.getValues("actor_user_id", UUID.class))
                .containsOnly(AUDIT_TEST_ACTOR_ID);
            assertThat(events.getValues("resource_type", String.class)).containsExactly(
                AuditResourceType.API_TOKEN.name(),
                AuditResourceType.ROLE.name(),
                AuditResourceType.ROLE.name(),
                AuditResourceType.ROLE.name(),
                AuditResourceType.API_TOKEN.name(),
                AuditResourceType.ROLE.name()
            );
            assertThat(events.getValues("resource_id", String.class)).containsExactly(
                createdToken.token().id().toString(),
                createdRole.id().toString(),
                createdRole.id().toString(),
                createdRole.id().toString(),
                createdToken.token().id().toString(),
                createdRole.id().toString()
            );
            assertThat(auditChainVerifier.verify(AUDIT_CHAIN_ID).valid()).isTrue();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
            dsl.query("delete from authentication_role where code = ?", roleCode).execute();
            deleteUser(userId);
        }
    }

    @Test
    void basicAuditMode_recordsAdministrativeAndSelfServiceEventsInOneChain() {
        String suffix = UUID.randomUUID().toString();
        UUID createdId = null;

        resetAuditChain();
        setAuditMode(AuditMode.BASIC);
        try {
            var created = transactionalAdminUserService.create(
                "audit-chain-" + suffix,
                "audit-chain-" + suffix + "@example.test",
                "original-password-123",
                List.of()
            );
            createdId = created.id();
            transactionalAdminUserService.setEnabled(createdId, true);

            transactionalAdminUserService.updateUsername(createdId, "audit-chain-renamed-" + suffix);
            transactionalAdminUserService.resetPassword(createdId, "admin-reset-password-123");
            transactionalAdminUserService.replaceRoles(createdId, List.of(RoleCodes.SYSTEM_ADMIN));
            transactionalUserSelfService.changeUsername(createdId, "audit-chain-self-" + suffix);
            transactionalUserSelfService.changePassword(
                createdId,
                "admin-reset-password-123",
                "self-password-123"
            );

            String rawToken = PasswordResetTokenGenerator.generate();
            String tokenHash = tokenHasher.hash(rawToken);
            passwordResetTokenRepository.create(new PasswordResetToken(
                UUID.randomUUID(),
                createdId,
                tokenHash,
                Instant.now().plusSeconds(1800),
                null,
                Instant.now()
            ));
            var pendingToken = passwordResetTokenRepository.findByTokenHash(tokenHash).orElseThrow();
            assertThat(pendingToken.usedAt()).isNull();
            assertThat(pendingToken.expiresAt()).isAfter(Instant.now());
            assertThat(userRepository.findById(createdId).orElseThrow().enabled()).isTrue();
            transactionalPasswordRecovery.resetPassword(rawToken, "final-password-123");

            var events = dsl.fetch(
                "select action, authentication_type, actor_user_id, actor_username, resource_type, "
                    + "resource_id from audit_event order by sequence"
            );
            assertThat(events.getValues("action", String.class)).containsExactly(
                AuditAction.ADMIN_USER_CREATED.name(),
                AuditAction.USER_ENABLED.name(),
                AuditAction.ADMIN_USER_USERNAME_CHANGED.name(),
                AuditAction.ADMIN_USER_PASSWORD_RESET.name(),
                AuditAction.ADMIN_USER_ROLES_REPLACED.name(),
                AuditAction.USER_USERNAME_CHANGED.name(),
                AuditAction.USER_PASSWORD_CHANGED.name(),
                AuditAction.PASSWORD_RESET_COMPLETED.name()
            );
            assertThat(events.getValues("authentication_type", String.class)).containsExactly(
                AuditAuthenticationType.SESSION.name(),
                AuditAuthenticationType.SESSION.name(),
                AuditAuthenticationType.SESSION.name(),
                AuditAuthenticationType.SESSION.name(),
                AuditAuthenticationType.SESSION.name(),
                AuditAuthenticationType.SESSION.name(),
                AuditAuthenticationType.SESSION.name(),
                AuditAuthenticationType.RECOVERY_TOKEN.name()
            );
            assertThat(events.getValues("actor_user_id", UUID.class)).containsExactly(
                AUDIT_TEST_ACTOR_ID,
                AUDIT_TEST_ACTOR_ID,
                AUDIT_TEST_ACTOR_ID,
                AUDIT_TEST_ACTOR_ID,
                AUDIT_TEST_ACTOR_ID,
                AUDIT_TEST_ACTOR_ID,
                AUDIT_TEST_ACTOR_ID,
                createdId
            );
            assertThat(events.getValues("actor_username", String.class)).containsExactly(
                "audit-persistence-test",
                "audit-persistence-test",
                "audit-persistence-test",
                "audit-persistence-test",
                "audit-persistence-test",
                "audit-persistence-test",
                "audit-persistence-test",
                "audit-chain-self-" + suffix
            );
            assertThat(events.getValues("resource_type", String.class)).containsOnly(
                AuditResourceType.USER.name()
            );
            assertThat(events.getValues("resource_id", String.class)).containsOnly(createdId.toString());
            assertThat(auditChainVerifier.verify(AUDIT_CHAIN_ID).valid()).isTrue();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
            if (createdId != null) {
                deleteUser(createdId);
            }
        }
    }

    @Test
    void auditConfiguration_isBootstrappedWithDefaultModeAndSingleRow() {
        assertThat(persistedAuditConfigurationCount()).isEqualTo(1);
        assertThat(persistedAuditMode()).isEqualTo(AuditMode.OFF);
        assertThat(persistedAuditUpdatedAt()).isNotNull();
        assertThat(auditPolicyProvider.currentMode()).isEqualTo(AuditMode.OFF);
    }

    @Test
    void auditConfiguration_persistedModeIsAuthoritativeOverBootstrapProperty() {
        setAuditMode(AuditMode.OFF);
        java.time.OffsetDateTime before = persistedAuditUpdatedAt();
        auditProperties.setMode(AuditMode.BASIC.name());
        try {
            auditConfigurationBootstrap.initialize();

            assertThat(persistedAuditMode()).isEqualTo(AuditMode.OFF);
            assertThat(persistedAuditUpdatedAt()).isEqualTo(before);
            assertThat(auditPolicyProvider.currentMode()).isEqualTo(AuditMode.OFF);
        } finally {
            auditProperties.setMode(AuditMode.OFF.name());
        }
    }

    @Test
    void auditConfiguration_bootstrapCreatesMissingRowFromProperty() {
        deleteAuditConfiguration();
        auditProperties.setMode(AuditMode.BASIC.name());
        try {
            auditConfigurationBootstrap.initialize();

            assertThat(persistedAuditConfigurationCount()).isEqualTo(1);
            assertThat(persistedAuditMode()).isEqualTo(AuditMode.BASIC);
            assertThat(auditPolicyProvider.currentMode()).isEqualTo(AuditMode.BASIC);
        } finally {
            auditProperties.setMode(AuditMode.OFF.name());
            setAuditMode(AuditMode.OFF);
        }
    }

    @Test
    void auditConfiguration_bootstrapFailsWithInvalidPropertyOnlyWhenRowIsMissing() {
        deleteAuditConfiguration();
        auditProperties.setMode("INVALID");
        try {
            assertThatThrownBy(auditConfigurationBootstrap::initialize)
                .isInstanceOf(IllegalArgumentException.class);
            assertThat(persistedAuditConfigurationCount()).isZero();
        } finally {
            auditProperties.setMode(AuditMode.OFF.name());
            setAuditMode(AuditMode.OFF);
        }
    }

    @Test
    void auditConfiguration_bootstrapIgnoresInvalidPropertyWhenRowExists() {
        setAuditMode(AuditMode.BASIC);
        auditProperties.setMode("INVALID");
        try {
            auditConfigurationBootstrap.initialize();

            assertThat(persistedAuditMode()).isEqualTo(AuditMode.BASIC);
            assertThat(auditPolicyProvider.currentMode()).isEqualTo(AuditMode.BASIC);
        } finally {
            auditProperties.setMode(AuditMode.OFF.name());
            setAuditMode(AuditMode.OFF);
        }
    }

    @Test
    void auditConfiguration_enforcesSingletonRow() {
        assertThatThrownBy(() -> dsl.query(
            "insert into audit_configuration (id, singleton, mode) values (?, true, 'BASIC')",
            UUID.randomUUID()
        ).execute()).isInstanceOf(DuplicateKeyException.class);
    }

    @Test
    void auditConfigurationUpdate_transitionsAppendExactlyOneMandatoryEvent() {
        resetAuditChain();
        setAuditMode(AuditMode.OFF);
        UUID configurationId = persistedAuditConfigurationId();
        try {
            transactionalAuditConfigurationService.updateMode(AuditMode.BASIC);

            assertThat(persistedAuditMode()).isEqualTo(AuditMode.BASIC);
            assertThat(auditPolicyProvider.currentMode()).isEqualTo(AuditMode.BASIC);
            assertSingleAuditConfigurationEvent(
                1,
                AuditAction.AUDIT_MODE_CHANGED_TO_BASIC,
                configurationId
            );

            transactionalAuditConfigurationService.updateMode(AuditMode.BASIC);

            assertThat(auditEventCount()).isEqualTo(1);

            transactionalAuditConfigurationService.updateMode(AuditMode.OFF);

            assertThat(persistedAuditMode()).isEqualTo(AuditMode.OFF);
            assertThat(auditPolicyProvider.currentMode()).isEqualTo(AuditMode.OFF);
            assertSingleAuditConfigurationEvent(
                2,
                AuditAction.AUDIT_MODE_CHANGED_TO_OFF,
                configurationId
            );
            assertThat(auditChainVerifier.verify(AUDIT_CHAIN_ID).valid()).isTrue();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
        }
    }

    @Test
    void auditConfigurationUpdate_sameModeDoesNotChangeTimestampOrAppendEvent() {
        resetAuditChain();
        setAuditMode(AuditMode.OFF);
        java.time.OffsetDateTime before = persistedAuditUpdatedAt();
        try {
            transactionalAuditConfigurationService.updateMode(AuditMode.OFF);

            assertThat(persistedAuditUpdatedAt()).isEqualTo(before);
            assertThat(auditEventCount()).isZero();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
        }
    }

    @Test
    void auditConfigurationUpdate_rollsBackWhenMandatoryAppendFails() {
        resetAuditChain();
        setAuditMode(AuditMode.OFF);
        try {
            deleteAuditChainHead();

            assertThatThrownBy(
                () -> transactionalAuditConfigurationService.updateMode(AuditMode.BASIC)
            ).isInstanceOf(IllegalStateException.class);

            assertThat(persistedAuditMode()).isEqualTo(AuditMode.OFF);
            assertThat(auditPolicyProvider.currentMode()).isEqualTo(AuditMode.OFF);
            assertThat(auditEventCount()).isZero();
        } finally {
            setAuditMode(AuditMode.OFF);
            resetAuditChain();
        }
    }

    private void assertSingleAuditConfigurationEvent(
        long expectedSequence,
        AuditAction expectedAction,
        UUID configurationId
    ) {
        var events = dsl.fetch(
            "select sequence, action, resource_type, resource_id, result, actor_user_id, "
                + "authentication_type from audit_event order by sequence"
        );
        assertThat(events).hasSize((int) expectedSequence);
        var event = events.get((int) expectedSequence - 1);
        assertThat(event.get("sequence", Long.class)).isEqualTo(expectedSequence);
        assertThat(event.get("action", String.class)).isEqualTo(expectedAction.name());
        assertThat(event.get("resource_type", String.class))
            .isEqualTo(AuditResourceType.AUDIT_CONFIGURATION.name());
        assertThat(event.get("resource_id", String.class))
            .isEqualTo(configurationId.toString());
        assertThat(event.get("result", String.class)).isEqualTo(AuditResult.SUCCESS.name());
        assertThat(event.get("actor_user_id", UUID.class)).isEqualTo(AUDIT_TEST_ACTOR_ID);
        assertThat(event.get("authentication_type", String.class))
            .isEqualTo(AuditAuthenticationType.SESSION.name());
    }

    private int auditEventCount() {
        return dsl.fetchCount(
            org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(AUDIT_EVENT_TABLE))
        );
    }

    private UUID persistedAuditConfigurationId() {
        return dsl.fetch("select id from audit_configuration")
            .getValues(0, UUID.class)
            .get(0);
    }

    private AuditMode persistedAuditMode() {
        return AuditMode.valueOf(
            dsl.fetch("select mode from audit_configuration").getValues(0, String.class).get(0)
        );
    }

    private java.time.OffsetDateTime persistedAuditUpdatedAt() {
        return dsl.fetch("select updated_at from audit_configuration")
            .getValues(0, java.time.OffsetDateTime.class)
            .get(0);
    }

    private int persistedAuditConfigurationCount() {
        return dsl.fetchCount(
            org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(AUDIT_CONFIGURATION_TABLE))
        );
    }

    private void deleteAuditConfiguration() {
        dsl.query("delete from audit_configuration").execute();
    }

    private void deleteAuditChainHead() {
        dsl.query(
            "delete from audit_chain_head where chain_id = ?",
            AUDIT_CHAIN_ID
        ).execute();
    }

    @AfterEach
    void resetAuditMode() {
        setAuditMode(AuditMode.OFF);
    }

    private void setAuditMode(AuditMode mode) {
        var configurationTable = org.jooq.impl.DSL.table(
            org.jooq.impl.DSL.name(AUDIT_CONFIGURATION_TABLE)
        );
        var modeField = org.jooq.impl.DSL.field(
            org.jooq.impl.DSL.name(AUDIT_CONFIGURATION_TABLE, "mode"),
            String.class
        );
        var updatedAtField = org.jooq.impl.DSL.field(
            org.jooq.impl.DSL.name(AUDIT_CONFIGURATION_TABLE, "updated_at"),
            java.time.OffsetDateTime.class
        );
        java.time.OffsetDateTime now = java.time.OffsetDateTime.now();
        int updated = dsl.update(configurationTable)
            .set(modeField, mode.name())
            .set(updatedAtField, now)
            .execute();
        if (updated == 0) {
            dsl.insertInto(configurationTable)
                .set(
                    org.jooq.impl.DSL.field(
                        org.jooq.impl.DSL.name(AUDIT_CONFIGURATION_TABLE, "id"),
                        UUID.class
                    ),
                    UUID.randomUUID()
                )
                .set(
                    org.jooq.impl.DSL.field(
                        org.jooq.impl.DSL.name(AUDIT_CONFIGURATION_TABLE, "singleton"),
                        Boolean.class
                    ),
                    true
                )
                .set(modeField, mode.name())
                .set(updatedAtField, now)
                .execute();
        }
        auditPolicyProvider.reload();
    }

    private void assertAuditVerificationFails(AuditVerificationFailure failure, long sequence) {
        AuditVerificationResult result = auditChainVerifier.verify(AUDIT_CHAIN_ID);
        assertThat(result.valid()).isFalse();
        assertThat(result.failure()).isEqualTo(failure);
        assertThat(result.failedSequence()).isEqualTo(sequence);
    }

    private void appendAuditEvents(int count) {
        for (int index = 1; index <= count; index++) {
            transactionalAuditService.append(auditDraft("AUDIT_TEST_" + index));
        }
    }

    private AuditEventQuery query(
        long afterSequence,
        int limit,
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId,
        UUID actorUserId,
        AuditResult result
    ) {
        return new AuditEventQuery(
            AUDIT_CHAIN_ID,
            afterSequence,
            limit,
            action,
            resourceType,
            resourceId,
            actorUserId,
            result
        );
    }

    private void appendQueryEvent(
        AuditAction action,
        AuditResourceType resourceType,
        String resourceId,
        UUID actorUserId,
        String actorUsername,
        AuditResult result
    ) {
        transactionalAuditService.append(new AuditEventDraft(
            AUDIT_CHAIN_ID,
            actorUserId,
            actorUsername,
            AuditAuthenticationType.SESSION,
            action.name(),
            resourceType.name(),
            resourceId,
            result,
            null
        ));
    }

    private List<Long> sequences(List<AuditEvent> events) {
        return events.stream().map(AuditEvent::sequence).toList();
    }

    private AuditEventDraft auditDraft(String action) {
        return new AuditEventDraft(
            AUDIT_CHAIN_ID,
            null,
            "system",
            AuditAuthenticationType.SYSTEM,
            action,
            "TEST",
            null,
            AuditResult.SUCCESS,
            null
        );
    }

    private void resetAuditChain() {
        dsl.query(
            "insert into audit_chain_head (chain_id, last_sequence, last_hash) "
                + "values (?, 0, ?) on conflict (chain_id) do nothing",
            AUDIT_CHAIN_ID,
            AuditChain.GENESIS_HASH
        ).execute();
        dsl.query("delete from audit_event").execute();
        dsl.query(
            "update audit_chain_head set last_sequence = 0, last_hash = ?, updated_at = current_timestamp "
                + "where chain_id = ?",
            AuditChain.GENESIS_HASH,
            AUDIT_CHAIN_ID
        ).execute();
    }

    @TestConfiguration
    static class FixedAuditActorConfiguration {

        @Bean
        @Primary
        AuditActorResolver fixedAuditActorResolver() {
            return () -> Optional.of(new AuditActor(
                AUDIT_TEST_ACTOR_ID,
                "audit-persistence-test",
                AuditAuthenticationType.SESSION
            ));
        }

        @Bean
        @Primary
        BlockingAuditChainSource blockingAuditChainSource(
            AuditEventRepository auditEventRepository
        ) {
            return new BlockingAuditChainSource(auditEventRepository);
        }

        @Bean
        @Primary
        AuditChainVerifier blockingAuditChainVerifier(
            BlockingAuditChainSource blockingAuditChainSource,
            AuditCanonicalEncoder auditCanonicalEncoder,
            AuditHashCalculator auditHashCalculator
        ) {
            return new AuditChainVerifier(
                blockingAuditChainSource,
                auditCanonicalEncoder,
                auditHashCalculator
            );
        }
    }

    static final class BlockingAuditChainSource implements AuditChainSource {

        private final AuditEventRepository delegate;
        private ReadGate nextReadGate;

        BlockingAuditChainSource(AuditEventRepository delegate) {
            this.delegate = delegate;
        }

        synchronized ReadGate blockNextEventRead() {
            nextReadGate = new ReadGate();
            return nextReadGate;
        }

        @Override
        public Optional<AuditChainHead> findChainHead(UUID chainId) {
            return delegate.findChainHead(chainId);
        }

        @Override
        public List<AuditEvent> readEvents(UUID chainId, long afterSequence, int limit) {
            ReadGate gate;
            synchronized (this) {
                gate = nextReadGate;
                nextReadGate = null;
            }
            if (gate != null) {
                gate.signalStarted();
                gate.awaitRelease();
            }
            return delegate.readEvents(chainId, afterSequence, limit);
        }
    }

    static final class ReadGate {

        private static final long TIMEOUT_SECONDS = 10;
        private final CountDownLatch started = new CountDownLatch(1);
        private final CountDownLatch released = new CountDownLatch(1);

        boolean awaitStarted() throws InterruptedException {
            return started.await(TIMEOUT_SECONDS, TimeUnit.SECONDS);
        }

        void signalStarted() {
            started.countDown();
        }

        void release() {
            released.countDown();
        }

        void awaitRelease() {
            try {
                if (!released.await(TIMEOUT_SECONDS, TimeUnit.SECONDS)) {
                    throw new IllegalStateException("Timed out waiting for audit verification release");
                }
            } catch (InterruptedException exception) {
                Thread.currentThread().interrupt();
                throw new IllegalStateException(exception);
            }
        }
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