package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.util.UUID;

public class ResetAdminUserPasswordUseCase {

    private final UserRepository userRepository;
    private final PasswordResetTokenRepository tokenRepository;
    private final PasswordHasher passwordHasher;

    public ResetAdminUserPasswordUseCase(
        UserRepository userRepository,
        PasswordResetTokenRepository tokenRepository,
        PasswordHasher passwordHasher
    ) {
        this.userRepository = userRepository;
        this.tokenRepository = tokenRepository;
        this.passwordHasher = passwordHasher;
    }

    public void execute(UUID userId, String newPassword) {
        PasswordPolicy.ensureValid(newPassword);

        User user = userRepository.findById(userId)
            .orElseThrow(() -> new UserNotFoundException(userId));

        String newPasswordHash = passwordHasher.hash(newPassword);
        long newCredentialsVersion = user.credentialsVersion() + 1;

        userRepository.updatePasswordAndCredentialsVersion(userId, newPasswordHash, newCredentialsVersion);
        tokenRepository.invalidatePendingTokensForUser(userId);
    }
}
