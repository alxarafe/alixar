package es.alxarafe.alixar.thirdparty.application;

import es.alxarafe.alixar.thirdparty.domain.NewThirdParty;
import es.alxarafe.alixar.thirdparty.domain.ThirdParty;
import java.util.Optional;

public interface ThirdPartyRepository {

    Optional<ThirdParty> findById(long id);

    long create(NewThirdParty thirdParty);

    ThirdPartyPage findPage(ThirdPartyListQuery query);
}
