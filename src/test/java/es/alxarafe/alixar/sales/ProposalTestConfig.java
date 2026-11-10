package es.alxarafe.alixar.sales;

import es.alxarafe.alixar.sales.application.*;
import org.mockito.Mockito;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;

@TestConfiguration
public class ProposalTestConfig {
    @Bean @Primary
    ProposalRepository proposalRepository() { return Mockito.mock(ProposalRepository.class); }
    @Bean @Primary
    EligibleThirdParty eligibleThirdParty() { return Mockito.mock(EligibleThirdParty.class); }
}
