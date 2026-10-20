package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.time.Instant;
import java.util.UUID;

public class SetAdminUserEnabledUseCase {

    private final UserRepository userRepository;
    private final AuthorizationRepository authorizationRepository;
    private final PasswordResetTokenRepository tokenRepository;

    public SetAdminUserEnabledUseCase(
        UserRepository userRepository,
        AuthorizationRepository authorizationRepository,
        PasswordResetTokenRepository tokenRepository
    ) {
        this.userRepository = userRepository;
        this.authorizationRepository = authorizationRepository;
        this.tokenRepository = tokenRepository;
    }

    public AdminUser execute(UUID userId, boolean enabled) {
        User user = userRepository.findById(userId)
            .orElseThrow(() -> new UserNotFoundException(userId));

        if (user.enabled() == enabled) {
            return toAdminUser(user, user.updatedAt());
        }

        long credentialsVersion = user.credentialsVersion();
        if (!enabled) {
            credentialsVersion++;
            tokenRepository.invalidatePendingTokensForUser(userId);
        }

        userRepository.updateEnabledAndCredentialsVersion(userId, enabled, credentialsVersion);

        return toAdminUser(user, enabled, credentialsVersion, Instant.now());
    }

    private AdminUser toAdminUser(User user, Instant updatedAt) {
        return toAdminUser(user, user.enabled(), user.credentialsVersion(), updatedAt);
    }

    private AdminUser toAdminUser(User user, boolean enabled, long credentialsVersion, Instant updatedAt) {
        return new AdminUser(
            user.id(),
            user.username(),
            user.email(),
            enabled,
            user.createdAt(),
            updatedAt,
            authorizationRepository.findRoleCodesForUser(user.id())
        );
    }
}
