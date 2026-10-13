package es.alxarafe.alixar.contact.infrastructure.dolibarr;

import es.alxarafe.alixar.contact.application.ContactRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

@Configuration
class DolibarrContactConfiguration {

    @Bean
    @ConditionalOnMissingBean(ContactRepository.class)
    ContactRepository contactRepository(Environment env) {
        String baseUrl = env.getProperty("alixar.dolibarr.base-url");
        String apiKey = env.getProperty("alixar.dolibarr.api-key");

        if (baseUrl != null && !baseUrl.isBlank() && apiKey != null && !apiKey.isBlank()) {
            return new DolibarrContactAdapter(baseUrl, apiKey);
        }
        return new UnconfiguredDolibarrContactRepository();
    }

}