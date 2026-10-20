package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.time.Instant;
import java.util.Locale;
import java.util.UUID;

public class UpdateAdminUsernameUseCase {

    private final UserRepository userRepository;
    private final AuthorizationRepository authorizationRepository;

    public UpdateAdminUsernameUseCase(
        UserRepository userRepository,
        AuthorizationRepository authorizationRepository
    ) {
        this.userRepository = userRepository;
        this.authorizationRepository = authorizationRepository;
    }

    public AdminUser execute(UUID userId, String newUsername) {
        String normalizedUsername = normalize(newUsername);
        User user = userRepository.findById(userId)
            .orElseThrow(() -> new UserNotFoundException(userId));

        userRepository.findByUsername(normalizedUsername)
            .filter(existing -> !existing.id().equals(userId))
            .ifPresent(existing -> {
                throw new UsernameAlreadyExistsException();
            });

        userRepository.updateUsername(userId, normalizedUsername);

        return new AdminUser(
            user.id(),
            normalizedUsername,
            user.email(),
            user.enabled(),
            user.createdAt(),
            Instant.now(),
            authorizationRepository.findRoleCodesForUser(userId)
        );
    }

    private String normalize(String username) {
        return username.strip().toLowerCase(Locale.ROOT);
    }
}
