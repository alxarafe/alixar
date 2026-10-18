package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.application.PasswordResetNotifier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class NoOpPasswordResetNotifierConfiguration {

    private static final Logger log = LoggerFactory.getLogger(NoOpPasswordResetNotifierConfiguration.class);

    @Bean
    @ConditionalOnMissingBean(PasswordResetNotifier.class)
    PasswordResetNotifier passwordResetNotifier() {
        return new NoOpPasswordResetNotifier();
    }
}

class NoOpPasswordResetNotifier implements PasswordResetNotifier {

    private static final Logger log = LoggerFactory.getLogger(NoOpPasswordResetNotifier.class);

    @Override
    public void notify(String email, String token, String resetUrl) {
        log.info("Password reset notification (no-op): email={}, token={}, resetUrl={}", email, token, resetUrl);
    }
}