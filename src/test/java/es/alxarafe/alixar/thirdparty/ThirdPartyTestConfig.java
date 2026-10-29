package es.alxarafe.alixar.thirdparty;

import es.alxarafe.alixar.thirdparty.application.ThirdPartyRepository;
import es.alxarafe.alixar.thirdparty.domain.NewThirdParty;
import es.alxarafe.alixar.thirdparty.domain.ThirdParty;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;

@TestConfiguration
public class ThirdPartyTestConfig {

    @Bean
    @Primary
    public InMemoryThirdPartyRepository thirdPartyRepository() {
        return new InMemoryThirdPartyRepository();
    }

    public static class InMemoryThirdPartyRepository implements ThirdPartyRepository {

        private final Map<Long, ThirdParty> thirdParties = new LinkedHashMap<>();
        private long sequence;

        public void reset() {
            thirdParties.clear();
            sequence = 0;
        }

        public List<ThirdParty> all() {
            return List.copyOf(thirdParties.values());
        }

        @Override
        public Optional<ThirdParty> findById(long id) {
            return Optional.ofNullable(thirdParties.get(id));
        }

        @Override
        public long create(NewThirdParty thirdParty) {
            long id = ++sequence;
            thirdParties.put(id, new ThirdParty(
                id,
                thirdParty.name(),
                thirdParty.customer(),
                thirdParty.prospect(),
                thirdParty.supplier(),
                thirdParty.active(),
                thirdParty.taxIdentifier(),
                thirdParty.intraCommunityVatNumber(),
                thirdParty.address(),
                thirdParty.postalCode(),
                thirdParty.town(),
                thirdParty.countryCode(),
                thirdParty.email(),
                thirdParty.phone(),
                thirdParty.website()
            ));
            return id;
        }
    }
}
