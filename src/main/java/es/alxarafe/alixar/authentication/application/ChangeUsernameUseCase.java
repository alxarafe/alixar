package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.time.Instant;
import java.util.Locale;
import java.util.UUID;

public class ChangeUsernameUseCase {

    private final UserRepository userRepository;

    public ChangeUsernameUseCase(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User execute(UUID userId, String newUsername) {
        String normalizedUsername = normalize(newUsername);
        User user = userRepository.findById(userId).orElseThrow(InvalidCredentialsException::new);

        userRepository.findByUsername(normalizedUsername)
            .filter(existing -> !existing.id().equals(userId))
            .ifPresent(existing -> {
                throw new UsernameAlreadyExistsException();
            });

        userRepository.updateUsername(userId, normalizedUsername);

        return new User(
            user.id(),
            normalizedUsername,
            user.email(),
            user.passwordHash(),
            user.enabled(),
            user.credentialsVersion(),
            user.createdAt(),
            Instant.now()
        );
    }

    private String normalize(String username) {
        return username.strip().toLowerCase(Locale.ROOT);
    }
}
