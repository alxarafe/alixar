package es.alxarafe.alixar.thirdparty;

import es.alxarafe.alixar.thirdparty.application.ThirdPartyListQuery;
import es.alxarafe.alixar.thirdparty.application.ThirdPartyPage;
import es.alxarafe.alixar.thirdparty.application.ThirdPartyRepository;
import es.alxarafe.alixar.thirdparty.domain.NewThirdParty;
import es.alxarafe.alixar.thirdparty.domain.ThirdParty;
import java.util.Comparator;
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
        public ThirdPartyPage findPage(ThirdPartyListQuery query) {
            List<ThirdParty> filtered = thirdParties.values().stream()
                .filter(thirdParty -> matches(query.customer(), thirdParty.customer()))
                .filter(thirdParty -> matches(query.prospect(), thirdParty.prospect()))
                .filter(thirdParty -> matches(query.supplier(), thirdParty.supplier()))
                .filter(thirdParty -> matches(query.active(), thirdParty.active()))
                .sorted(Comparator.comparingLong(ThirdParty::id))
                .toList();
            long total = filtered.size();
            int from = (int) Math.min(query.offset(), total);
            int to = Math.min(from + query.size(), filtered.size());
            return new ThirdPartyPage(
                filtered.subList(from, to),
                query.page(),
                query.size(),
                total
            );
        }

        @Override
        public void update(ThirdParty thirdParty) {
            thirdParties.replace(thirdParty.id(), thirdParty);
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

        private boolean matches(Boolean filter, boolean value) {
            return filter == null || filter == value;
        }
    }
}
