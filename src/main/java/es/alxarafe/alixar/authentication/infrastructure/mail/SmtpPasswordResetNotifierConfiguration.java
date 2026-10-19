package es.alxarafe.alixar.authentication.infrastructure.mail;

import es.alxarafe.alixar.authentication.application.PasswordResetNotifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.mail.autoconfigure.MailSenderAutoConfiguration;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;

@AutoConfiguration(after = MailSenderAutoConfiguration.class)
public class SmtpPasswordResetNotifierConfiguration {

    @Bean
    @ConditionalOnBean(JavaMailSender.class)
    @ConditionalOnMissingBean(PasswordResetNotifier.class)
    PasswordResetNotifier smtpPasswordResetNotifier(
        JavaMailSender mailSender,
        MessageSource messageSource,
        @Value("${alixar.authentication.password-reset.mail.from:${spring.mail.username:}}") String fromAddress
    ) {
        return new SmtpPasswordResetNotifier(mailSender, messageSource, fromAddress);
    }
}
