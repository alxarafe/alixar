package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.ApiToken;
import java.util.List;
import java.util.UUID;

public class ListApiTokensUseCase {

    private final ApiTokenRepository apiTokenRepository;

    public ListApiTokensUseCase(ApiTokenRepository apiTokenRepository) {
        this.apiTokenRepository = apiTokenRepository;
    }

    public List<ApiToken> execute(UUID userId) {
        return apiTokenRepository.findAllByUserId(userId);
    }
}
