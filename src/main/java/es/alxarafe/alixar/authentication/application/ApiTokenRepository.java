package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.ApiToken;
import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ApiTokenRepository {

    void create(ApiToken token, String tokenHash);

    Optional<ApiToken> findByTokenHash(String tokenHash);

    List<ApiToken> findAllByUserId(UUID userId);

    Optional<ApiToken> findByIdAndUserId(UUID id, UUID userId);

    void revoke(UUID id, UUID userId, Instant revokedAt);

    void updateLastUsedAt(UUID id, Instant lastUsedAt);
}
