package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.util.UUID;

public class AuthenticateUserUseCase {

    private final UserRepository userRepository;
    private final PasswordHasher passwordHasher;
    private final String missingUserPasswordHash;

    public AuthenticateUserUseCase(UserRepository userRepository, PasswordHasher passwordHasher) {
        this.userRepository = userRepository;
        this.passwordHasher = passwordHasher;
        this.missingUserPasswordHash = passwordHasher.hash(UUID.randomUUID().toString());
    }

    public User execute(String identifier, String password) {
        User user = userRepository.findByIdentifier(identifier).orElse(null);
        String passwordHash = user != null ? user.passwordHash() : missingUserPasswordHash;
        boolean passwordMatches = passwordHasher.matches(password, passwordHash);

        if (user == null || !user.enabled() || !passwordMatches) {
            throw new InvalidCredentialsException();
        }
        return user;
    }
}
