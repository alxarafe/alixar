package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.application.AuthenticateUserUseCase;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.infrastructure.persistence.JooqUserRepository;
import es.alxarafe.alixar.authentication.infrastructure.security.SpringPasswordHasher;
import es.alxarafe.alixar.authentication.infrastructure.security.UserAuthenticationProvider;
import org.jooq.DSLContext;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class AuthenticationConfiguration {

    @Bean
    @ConditionalOnMissingBean(UserRepository.class)
    UserRepository userRepository(DSLContext dsl) {
        return new JooqUserRepository(dsl);
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    @Bean
    PasswordHasher passwordHasher(PasswordEncoder passwordEncoder) {
        return new SpringPasswordHasher(passwordEncoder);
    }

    @Bean
    AuthenticateUserUseCase authenticateUserUseCase(
        UserRepository userRepository,
        PasswordHasher passwordHasher
    ) {
        return new AuthenticateUserUseCase(userRepository, passwordHasher);
    }

    @Bean
    AuthenticationManager authenticationManager(AuthenticateUserUseCase authenticateUserUseCase) {
        return new ProviderManager(new UserAuthenticationProvider(authenticateUserUseCase));
    }
}
