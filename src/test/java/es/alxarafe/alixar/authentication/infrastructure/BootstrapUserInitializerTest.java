package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestUserRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.infrastructure.security.SpringPasswordHasher;
import org.junit.jupiter.api.Test;
import org.springframework.boot.DefaultApplicationArguments;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

class BootstrapUserInitializerTest {

    private final TestUserRepository userRepository = new TestUserRepository();
    private final PasswordHasher passwordHasher = new SpringPasswordHasher(
        PasswordEncoderFactories.createDelegatingPasswordEncoder()
    );

    @Test
    void completeConfiguration_createsEnabledUserWithHashedPassword() throws Exception {
        var initializer = initializer("Bootstrap", "BOOTSTRAP@example.test", "temporary-password");

        initializer.run(new DefaultApplicationArguments());

        var user = userRepository.findByUsername("bootstrap").orElseThrow();
        assertThat(user.email()).isEqualTo("bootstrap@example.test");
        assertThat(user.enabled()).isTrue();
        assertThat(user.passwordHash()).doesNotContain("temporary-password");
        assertThat(passwordHasher.matches("temporary-password", user.passwordHash())).isTrue();
    }

    @Test
    void existingBootstrapUser_isNotCreatedOrResetAgain() throws Exception {
        initializer("bootstrap", "bootstrap@example.test", "first-password")
            .run(new DefaultApplicationArguments());
        String originalHash = userRepository.findByUsername("bootstrap").orElseThrow().passwordHash();

        initializer("bootstrap", "bootstrap@example.test", "replacement-password")
            .run(new DefaultApplicationArguments());

        assertThat(userRepository.findByUsername("bootstrap").orElseThrow().passwordHash())
            .isEqualTo(originalHash);
    }

    @Test
    void partialConfiguration_failsWithoutCreatingUser() {
        var initializer = initializer("bootstrap", "", "temporary-password");

        assertThatThrownBy(() -> initializer.run(new DefaultApplicationArguments()))
            .isInstanceOf(IllegalStateException.class)
            .hasMessage("Bootstrap username, email and password must be configured together");
        assertThat(userRepository.findByUsername("bootstrap")).isEmpty();
    }

    private BootstrapUserInitializer initializer(String username, String email, String password) {
        return new BootstrapUserInitializer(userRepository, passwordHasher, username, email, password);
    }
}
