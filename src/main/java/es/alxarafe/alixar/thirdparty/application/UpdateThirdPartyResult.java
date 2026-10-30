package es.alxarafe.alixar.thirdparty.application;

import es.alxarafe.alixar.thirdparty.domain.ThirdParty;

public record UpdateThirdPartyResult(
    ThirdParty thirdParty,
    boolean changed
) {
}
