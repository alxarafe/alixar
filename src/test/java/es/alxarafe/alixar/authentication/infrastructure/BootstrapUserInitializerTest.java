package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestAuthorizationRepository;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestUserRepository;
import es.alxarafe.alixar.authentication.application.AssignRoleToUserUseCase;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixar.authentication.application.RoleCodes;
import es.alxarafe.alixar.authentication.infrastructure.security.SpringPasswordHasher;
import org.junit.jupiter.api.Test;
import org.springframework.boot.DefaultApplicationArguments;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

class BootstrapUserInitializerTest {

    private final TestUserRepository userRepository = new TestUserRepository();
    private final TestAuthorizationRepository authorizationRepository = new TestAuthorizationRepository();
    private final PasswordHasher passwordHasher = new SpringPasswordHasher(
        PasswordEncoderFactories.createDelegatingPasswordEncoder()
    );

    @Test
    void completeConfiguration_createsEnabledUserWithHashedPasswordAndNoRoleByDefault() throws Exception {
        var initializer = initializer("Bootstrap", "BOOTSTRAP@example.test", "temporary-password", false);

        initializer.run(new DefaultApplicationArguments());

        var user = userRepository.findByUsername("bootstrap").orElseThrow();
        assertThat(user.email()).isEqualTo("bootstrap@example.test");
        assertThat(user.enabled()).isTrue();
        assertThat(user.credentialsVersion()).isEqualTo(0);
        assertThat(user.passwordHash()).doesNotContain("temporary-password");
        assertThat(passwordHasher.matches("temporary-password", user.passwordHash())).isTrue();
        assertThat(authorizationRepository.findRoleCodesByUser(user.id())).isEmpty();
        assertThat(authorizationRepository.findEffectivePermissionCodes(user.id())).isEmpty();
    }

    @Test
    void explicitSystemAdmin_grantsTheBuiltInRoleAndItsPermission() throws Exception {
        var initializer = initializer("bootstrap", "bootstrap@example.test", "temporary-password", true);

        initializer.run(new DefaultApplicationArguments());

        var user = userRepository.findByUsername("bootstrap").orElseThrow();
        assertThat(authorizationRepository.findRoleCodesByUser(user.id()))
            .containsExactly(RoleCodes.SYSTEM_ADMIN);
        assertThat(authorizationRepository.findEffectivePermissionCodes(user.id()))
            .containsExactly(PermissionCodes.USERS_MANAGE);
        assertThat(authorizationRepository.findPermissionCodesByRole(RoleCodes.SYSTEM_ADMIN))
            .contains(PermissionCodes.USERS_MANAGE);
    }

    @Test
    void repeatedExplicitSystemAdmin_isIdempotent() throws Exception {
        initializer("bootstrap", "bootstrap@example.test", "temporary-password", true)
            .run(new DefaultApplicationArguments());
        initializer("bootstrap", "bootstrap@example.test", "temporary-password", true)
            .run(new DefaultApplicationArguments());

        var user = userRepository.findByUsername("bootstrap").orElseThrow();
        assertThat(authorizationRepository.findRoleCodesByUser(user.id()))
            .containsExactly(RoleCodes.SYSTEM_ADMIN);
        assertThat(authorizationRepository.findEffectivePermissionCodes(user.id()))
            .containsExactly(PermissionCodes.USERS_MANAGE);
    }

    @Test
    void existingBootstrapUser_isNotCreatedOrResetAgain() throws Exception {
        initializer("bootstrap", "bootstrap@example.test", "first-password", false)
            .run(new DefaultApplicationArguments());
        String originalHash = userRepository.findByUsername("bootstrap").orElseThrow().passwordHash();

        initializer("bootstrap", "bootstrap@example.test", "replacement-password", false)
            .run(new DefaultApplicationArguments());

        assertThat(userRepository.findByUsername("bootstrap").orElseThrow().passwordHash())
            .isEqualTo(originalHash);
    }

    @Test
    void existingBootstrapUser_receivesSystemAdminOnlyWhenExplicitlyRequested() throws Exception {
        initializer("bootstrap", "bootstrap@example.test", "temporary-password", false)
            .run(new DefaultApplicationArguments());
        var user = userRepository.findByUsername("bootstrap").orElseThrow();
        assertThat(authorizationRepository.findRoleCodesByUser(user.id())).isEmpty();

        initializer("bootstrap", "bootstrap@example.test", "temporary-password", true)
            .run(new DefaultApplicationArguments());

        assertThat(authorizationRepository.findRoleCodesByUser(user.id()))
            .containsExactly(RoleCodes.SYSTEM_ADMIN);
    }

    @Test
    void systemAdminFlagWithoutBootstrapIdentity_doesNotCreateUser() throws Exception {
        initializer("", "", "", true).run(new DefaultApplicationArguments());

        assertThat(userRepository.findByUsername("bootstrap")).isEmpty();
        assertThat(userRepository.findByEmail("bootstrap@example.test")).isEmpty();
    }

    @Test
    void partialConfiguration_failsWithoutCreatingUser() {
        var initializer = initializer("bootstrap", "", "temporary-password", false);

        assertThatThrownBy(() -> initializer.run(new DefaultApplicationArguments()))
            .isInstanceOf(IllegalStateException.class)
            .hasMessage("Bootstrap username, email and password must be configured together");
        assertThat(userRepository.findByUsername("bootstrap")).isEmpty();
    }

    private BootstrapUserInitializer initializer(
        String username,
        String email,
        String password,
        boolean systemAdmin
    ) {
        return new BootstrapUserInitializer(
            userRepository,
            passwordHasher,
            new AssignRoleToUserUseCase(authorizationRepository),
            username,
            email,
            password,
            systemAdmin
        );
    }
}
