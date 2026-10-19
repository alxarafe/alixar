package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.application.PasswordResetNotifier;
import es.alxarafe.alixar.authentication.infrastructure.mail.SmtpPasswordResetNotifierConfiguration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;

@AutoConfiguration(after = SmtpPasswordResetNotifierConfiguration.class)
public class NoOpPasswordResetNotifierConfiguration {

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
        log.warn("Password reset email delivery is not configured; no email was sent to {}", email);
    }
}
