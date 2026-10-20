package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.domain.User;
import java.time.Instant;
import java.util.Optional;

public class AuthenticateApiTokenUseCase {

    private final ApiTokenRepository apiTokenRepository;
    private final UserRepository userRepository;
    private final TokenHasher tokenHasher;

    public AuthenticateApiTokenUseCase(
        ApiTokenRepository apiTokenRepository,
        UserRepository userRepository,
        TokenHasher tokenHasher
    ) {
        this.apiTokenRepository = apiTokenRepository;
        this.userRepository = userRepository;
        this.tokenHasher = tokenHasher;
    }

    public Optional<ApiTokenAuthentication> execute(String rawToken) {
        if (rawToken == null || rawToken.isBlank()) {
            return Optional.empty();
        }

        ApiToken token = apiTokenRepository.findByTokenHash(tokenHasher.hash(rawToken)).orElse(null);
        if (token == null || !token.isUsable(Instant.now())) {
            return Optional.empty();
        }

        User user = userRepository.findById(token.userId()).orElse(null);
        if (user == null
            || !user.enabled()
            || user.credentialsVersion() != token.credentialsVersion()) {
            return Optional.empty();
        }

        return Optional.of(new ApiTokenAuthentication(user, token.id()));
    }
}
