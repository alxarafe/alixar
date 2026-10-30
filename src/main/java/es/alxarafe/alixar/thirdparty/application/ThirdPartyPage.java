package es.alxarafe.alixar.thirdparty.application;

import es.alxarafe.alixar.thirdparty.domain.ThirdParty;
import java.util.List;

public record ThirdPartyPage(
    List<ThirdParty> items,
    int page,
    int size,
    long total
) {

    public ThirdPartyPage {
        items = List.copyOf(items);
    }
}
