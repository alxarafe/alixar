package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.PasswordResetToken;
import java.time.Instant;
import java.util.Optional;
import java.util.UUID;

public interface PasswordResetTokenRepository {

    Optional<PasswordResetToken> findByTokenHash(String tokenHash);

    void create(PasswordResetToken token);

    void markAsUsed(UUID tokenId, Instant usedAt);

    void invalidatePendingTokensForUser(UUID userId);
}