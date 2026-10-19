package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.User;
import java.time.Instant;
import java.util.Locale;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
class BootstrapUserInitializer implements ApplicationRunner {

    private final UserRepository userRepository;
    private final PasswordHasher passwordHasher;
    private final String username;
    private final String email;
    private final String password;

    BootstrapUserInitializer(
        UserRepository userRepository,
        PasswordHasher passwordHasher,
        @Value("${alixar.authentication.bootstrap.username:}") String username,
        @Value("${alixar.authentication.bootstrap.email:}") String email,
        @Value("${alixar.authentication.bootstrap.password:}") String password
    ) {
        this.userRepository = userRepository;
        this.passwordHasher = passwordHasher;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    @Override
    public void run(ApplicationArguments arguments) {
        boolean usernameConfigured = !username.isBlank();
        boolean emailConfigured = !email.isBlank();
        boolean passwordConfigured = !password.isBlank();

        if (!usernameConfigured && !emailConfigured && !passwordConfigured) {
            return;
        }
        if (!usernameConfigured || !emailConfigured || !passwordConfigured) {
            throw new IllegalStateException("Bootstrap username, email and password must be configured together");
        }

        String normalizedUsername = username.strip().toLowerCase(Locale.ROOT);
        String normalizedEmail = email.strip().toLowerCase(Locale.ROOT);
        var usernameOwner = userRepository.findByUsername(normalizedUsername);
        var emailOwner = userRepository.findByEmail(normalizedEmail);

        if (usernameOwner.isPresent() || emailOwner.isPresent()) {
            if (usernameOwner.isPresent()
                && emailOwner.isPresent()
                && usernameOwner.orElseThrow().id().equals(emailOwner.orElseThrow().id())) {
                return;
            }
            throw new IllegalStateException("Bootstrap identifiers conflict with an existing user");
        }

        Instant now = Instant.now();
        userRepository.create(new User(
            UUID.randomUUID(),
            normalizedUsername,
            normalizedEmail,
            passwordHasher.hash(password),
            true,
            0,
            now,
            now
        ));
    }
}
