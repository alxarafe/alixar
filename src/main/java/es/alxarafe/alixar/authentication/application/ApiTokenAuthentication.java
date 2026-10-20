package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.authentication.domain.User;
import java.util.UUID;

public record ApiTokenAuthentication(User user, UUID tokenId) {
}
