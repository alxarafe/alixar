package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.ApiToken;

public record CreatedApiToken(ApiToken token, String rawToken) {
}
