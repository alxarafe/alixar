package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.PasswordResetToken;
import es.alxarafe.alixar.authentication.domain.User;
import java.time.Instant;
import java.util.UUID;

public class ForgotPasswordUseCase {

    private static final long TOKEN_EXPIRY_MINUTES = 30;

    private final UserRepository userRepository;
    private final PasswordResetTokenRepository tokenRepository;
    private final TokenHasher tokenHasher;
    private final PasswordResetNotifier notifier;
    private final String frontendResetUrlBase;

    public ForgotPasswordUseCase(
        UserRepository userRepository,
        PasswordResetTokenRepository tokenRepository,
        TokenHasher tokenHasher,
        PasswordResetNotifier notifier,
        String frontendResetUrlBase
    ) {
        this.userRepository = userRepository;
        this.tokenRepository = tokenRepository;
        this.tokenHasher = tokenHasher;
        this.notifier = notifier;
        this.frontendResetUrlBase = frontendResetUrlBase;
    }

    public void execute(String email) {
        String normalizedEmail = normalizeEmail(email);

        userRepository.findByEmail(normalizedEmail)
            .filter(User::enabled)
            .ifPresent(user -> {
                tokenRepository.invalidatePendingTokensForUser(user.id());

                String rawToken = PasswordResetTokenGenerator.generate();
                String tokenHash = tokenHasher.hash(rawToken);
                Instant now = Instant.now();
                Instant expiresAt = now.plusSeconds(TOKEN_EXPIRY_MINUTES * 60);

                PasswordResetToken token = new PasswordResetToken(
                    UUID.randomUUID(),
                    user.id(),
                    tokenHash,
                    expiresAt,
                    null,
                    now
                );

                tokenRepository.create(token);

                String resetUrl = frontendResetUrlBase + "?token=" + rawToken;
                notifier.notify(user.email(), rawToken, resetUrl);
            });
    }

    private String normalizeEmail(String email) {
        return email.strip().toLowerCase(java.util.Locale.ROOT);
    }
}