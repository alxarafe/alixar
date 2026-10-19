package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.time.Instant;
import java.util.UUID;

public class ChangePasswordUseCase {

    private final UserRepository userRepository;
    private final PasswordResetTokenRepository tokenRepository;
    private final PasswordHasher passwordHasher;

    public ChangePasswordUseCase(
        UserRepository userRepository,
        PasswordResetTokenRepository tokenRepository,
        PasswordHasher passwordHasher
    ) {
        this.userRepository = userRepository;
        this.tokenRepository = tokenRepository;
        this.passwordHasher = passwordHasher;
    }

    public User execute(UUID userId, String currentPassword, String newPassword) {
        PasswordPolicy.ensureValid(newPassword);

        User user = userRepository.findById(userId).orElseThrow(InvalidCredentialsException::new);

        if (!passwordHasher.matches(currentPassword, user.passwordHash())) {
            throw new InvalidCurrentPasswordException();
        }

        String newPasswordHash = passwordHasher.hash(newPassword);
        long newCredentialsVersion = user.credentialsVersion() + 1;

        userRepository.updatePasswordAndCredentialsVersion(userId, newPasswordHash, newCredentialsVersion);
        tokenRepository.invalidatePendingTokensForUser(userId);

        return new User(
            user.id(),
            user.username(),
            user.email(),
            newPasswordHash,
            user.enabled(),
            newCredentialsVersion,
            user.createdAt(),
            Instant.now()
        );
    }
}
