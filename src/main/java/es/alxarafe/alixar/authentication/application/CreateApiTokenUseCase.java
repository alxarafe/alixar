package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.domain.User;
import java.time.Instant;
import java.util.UUID;

public class CreateApiTokenUseCase {

    private final UserRepository userRepository;
    private final ApiTokenRepository apiTokenRepository;
    private final ApiTokenGenerator apiTokenGenerator;
    private final TokenHasher tokenHasher;

    public CreateApiTokenUseCase(
        UserRepository userRepository,
        ApiTokenRepository apiTokenRepository,
        ApiTokenGenerator apiTokenGenerator,
        TokenHasher tokenHasher
    ) {
        this.userRepository = userRepository;
        this.apiTokenRepository = apiTokenRepository;
        this.apiTokenGenerator = apiTokenGenerator;
        this.tokenHasher = tokenHasher;
    }

    public CreatedApiToken execute(UUID userId, String name, Instant expiresAt) {
        User user = userRepository.findById(userId).orElseThrow(InvalidCredentialsException::new);

        Instant now = Instant.now();
        ApiTokenPolicy.ensureValidExpiration(now, expiresAt);

        String rawToken = apiTokenGenerator.generate();
        String tokenHash = tokenHasher.hash(rawToken);

        ApiToken token = new ApiToken(
            UUID.randomUUID(),
            user.id(),
            name.strip(),
            user.credentialsVersion(),
            now,
            expiresAt,
            null,
            null
        );

        apiTokenRepository.create(token, tokenHash);

        return new CreatedApiToken(token, rawToken);
    }
}
