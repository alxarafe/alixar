package es.alxarafe.alixar.contact.infrastructure.dolibarr;

import es.alxarafe.alixar.contact.application.ContactRepository;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
class DolibarrContactConfiguration {

    @Bean
    @ConditionalOnProperty(prefix = "alixar.dolibarr", name = {"base-url", "api-key"})
    ContactRepository dolibarrContactRepository(
        @org.springframework.beans.factory.annotation.Value("${alixar.dolibarr.base-url}") String baseUrl,
        @org.springframework.beans.factory.annotation.Value("${alixar.dolibarr.api-key}") String apiKey
    ) {
        return new DolibarrContactAdapter(baseUrl, apiKey);
    }

    @Bean
    @ConditionalOnMissingBean(ContactRepository.class)
    ContactRepository unconfiguredContactRepository() {
        return new UnconfiguredDolibarrContactRepository();
    }

}