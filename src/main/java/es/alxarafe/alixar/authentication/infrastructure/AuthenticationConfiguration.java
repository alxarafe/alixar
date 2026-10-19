package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.application.AuthenticateUserUseCase;
import es.alxarafe.alixar.authentication.application.ForgotPasswordUseCase;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PasswordResetNotifier;
import es.alxarafe.alixar.authentication.application.PasswordResetTokenRepository;
import es.alxarafe.alixar.authentication.application.ResetPasswordUseCase;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.infrastructure.persistence.JooqPasswordResetTokenRepository;
import es.alxarafe.alixar.authentication.infrastructure.persistence.JooqUserRepository;
import es.alxarafe.alixar.authentication.infrastructure.security.Sha256TokenHasher;
import es.alxarafe.alixar.authentication.infrastructure.security.SpringPasswordHasher;
import es.alxarafe.alixar.authentication.infrastructure.security.UserAuthenticationProvider;
import org.jooq.DSLContext;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@AutoConfiguration
public class AuthenticationConfiguration {

    @Bean
    @ConditionalOnMissingBean(UserRepository.class)
    UserRepository userRepository(DSLContext dsl) {
        return new JooqUserRepository(dsl);
    }

    @Bean
    @ConditionalOnMissingBean(PasswordResetTokenRepository.class)
    PasswordResetTokenRepository passwordResetTokenRepository(DSLContext dsl) {
        return new JooqPasswordResetTokenRepository(dsl);
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
    TokenHasher tokenHasher() {
        return new Sha256TokenHasher();
    }

    @Bean
    AuthenticateUserUseCase authenticateUserUseCase(
        UserRepository userRepository,
        PasswordHasher passwordHasher
    ) {
        return new AuthenticateUserUseCase(userRepository, passwordHasher);
    }

    @Bean
    ForgotPasswordUseCase forgotPasswordUseCase(
        UserRepository userRepository,
        PasswordResetTokenRepository tokenRepository,
        TokenHasher tokenHasher,
        PasswordResetNotifier notifier,
        @Value("${alixar.authentication.password-reset.frontend-url:}") String frontendResetUrlBase
    ) {
        return new ForgotPasswordUseCase(userRepository, tokenRepository, tokenHasher, notifier, frontendResetUrlBase);
    }

    @Bean
    ResetPasswordUseCase resetPasswordUseCase(
        UserRepository userRepository,
        PasswordResetTokenRepository tokenRepository,
        TokenHasher tokenHasher,
        PasswordHasher passwordHasher
    ) {
        return new ResetPasswordUseCase(userRepository, tokenRepository, tokenHasher, passwordHasher);
    }

    @Bean
    TransactionalPasswordRecovery transactionalPasswordRecovery(
        ForgotPasswordUseCase forgotPasswordUseCase,
        ResetPasswordUseCase resetPasswordUseCase
    ) {
        return new TransactionalPasswordRecovery(forgotPasswordUseCase, resetPasswordUseCase);
    }

    @Bean
    AuthenticationManager authenticationManager(AuthenticateUserUseCase authenticateUserUseCase) {
        return new ProviderManager(new UserAuthenticationProvider(authenticateUserUseCase));
    }
}
