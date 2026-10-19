package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.PasswordResetToken;
import es.alxarafe.alixar.authentication.domain.User;
import java.time.Instant;
import java.util.UUID;

public class ResetPasswordUseCase {

    private final UserRepository userRepository;
    private final PasswordResetTokenRepository tokenRepository;
    private final TokenHasher tokenHasher;
    private final PasswordHasher passwordHasher;

    public ResetPasswordUseCase(
        UserRepository userRepository,
        PasswordResetTokenRepository tokenRepository,
        TokenHasher tokenHasher,
        PasswordHasher passwordHasher
    ) {
        this.userRepository = userRepository;
        this.tokenRepository = tokenRepository;
        this.tokenHasher = tokenHasher;
        this.passwordHasher = passwordHasher;
    }

    public void execute(String rawToken, String newPassword) {
        PasswordPolicy.ensureValid(newPassword);

        String tokenHash = tokenHasher.hash(rawToken);

        PasswordResetToken token = tokenRepository.findByTokenHash(tokenHash)
            .orElseThrow(InvalidResetTokenException::new);

        if (!token.isValid(Instant.now())) {
            throw new InvalidResetTokenException();
        }

        User user = userRepository.findById(token.userId())
            .orElseThrow(InvalidResetTokenException::new);

        if (!user.enabled()) {
            throw new InvalidResetTokenException();
        }

        String newPasswordHash = passwordHasher.hash(newPassword);
        long newCredentialsVersion = user.credentialsVersion() + 1;

        userRepository.updatePasswordAndCredentialsVersion(user.id(), newPasswordHash, newCredentialsVersion);
        tokenRepository.markAsUsed(token.id(), Instant.now());
        tokenRepository.invalidatePendingTokensForUser(user.id());
    }
}