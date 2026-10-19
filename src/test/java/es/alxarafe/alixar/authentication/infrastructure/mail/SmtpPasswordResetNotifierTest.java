package es.alxarafe.alixar.authentication.infrastructure.mail;

import java.util.Locale;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.context.support.StaticMessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

class SmtpPasswordResetNotifierTest {

    private static final String SUBJECT_KEY = "authentication.passwordReset.mail.subject";
    private static final String BODY_KEY = "authentication.passwordReset.mail.body";

    @AfterEach
    void clearLocale() {
        LocaleContextHolder.resetLocaleContext();
    }

    @Test
    void notify_sendsLocalizedMessageContainingResetUrlToRecipient() {
        LocaleContextHolder.setLocale(Locale.ENGLISH);
        JavaMailSender mailSender = mock(JavaMailSender.class);
        StaticMessageSource messageSource = new StaticMessageSource();
        messageSource.addMessage(SUBJECT_KEY, Locale.ENGLISH, "Reset your password");
        messageSource.addMessage(BODY_KEY, Locale.ENGLISH, "Reset link: {0}");

        var notifier = new SmtpPasswordResetNotifier(mailSender, messageSource, "no-reply@example.test");
        notifier.notify("alice@example.test", "raw-token", "https://front.example/reset?token=raw-token");

        ArgumentCaptor<SimpleMailMessage> captor = ArgumentCaptor.forClass(SimpleMailMessage.class);
        verify(mailSender).send(captor.capture());
        SimpleMailMessage sent = captor.getValue();

        assertThat(sent.getFrom()).isEqualTo("no-reply@example.test");
        assertThat(sent.getTo()).containsExactly("alice@example.test");
        assertThat(sent.getSubject()).isEqualTo("Reset your password");
        assertThat(sent.getText()).contains("https://front.example/reset?token=raw-token");
    }

    @Test
    void notify_withoutConfiguredFrom_doesNotSetFromHeader() {
        LocaleContextHolder.setLocale(Locale.ENGLISH);
        JavaMailSender mailSender = mock(JavaMailSender.class);
        StaticMessageSource messageSource = new StaticMessageSource();
        messageSource.addMessage(SUBJECT_KEY, Locale.ENGLISH, "Reset your password");
        messageSource.addMessage(BODY_KEY, Locale.ENGLISH, "Reset link: {0}");

        var notifier = new SmtpPasswordResetNotifier(mailSender, messageSource, "");
        notifier.notify("alice@example.test", "raw-token", "https://front.example/reset?token=raw-token");

        ArgumentCaptor<SimpleMailMessage> captor = ArgumentCaptor.forClass(SimpleMailMessage.class);
        verify(mailSender).send(captor.capture());

        assertThat(captor.getValue().getFrom()).isNull();
    }
}
