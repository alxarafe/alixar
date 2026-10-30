package es.alxarafe.alixar.thirdparty.application;

public class ListThirdPartiesUseCase {

    private final ThirdPartyRepository thirdPartyRepository;

    public ListThirdPartiesUseCase(ThirdPartyRepository thirdPartyRepository) {
        this.thirdPartyRepository = thirdPartyRepository;
    }

    public ThirdPartyPage execute(ThirdPartyListQuery query) {
        return thirdPartyRepository.findPage(query);
    }
}
