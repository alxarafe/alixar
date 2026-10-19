package es.alxarafe.alixar.authentication.infrastructure.mail;

import es.alxarafe.alixar.authentication.application.PasswordResetNotifier;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.util.StringUtils;

public class SmtpPasswordResetNotifier implements PasswordResetNotifier {

    private static final String SUBJECT_KEY = "authentication.passwordReset.mail.subject";
    private static final String BODY_KEY = "authentication.passwordReset.mail.body";

    private final JavaMailSender mailSender;
    private final MessageSource messageSource;
    private final String fromAddress;

    public SmtpPasswordResetNotifier(JavaMailSender mailSender, MessageSource messageSource, String fromAddress) {
        this.mailSender = mailSender;
        this.messageSource = messageSource;
        this.fromAddress = fromAddress;
    }

    @Override
    public void notify(String email, String token, String resetUrl) {
        SimpleMailMessage message = new SimpleMailMessage();
        if (StringUtils.hasText(fromAddress)) {
            message.setFrom(fromAddress);
        }
        message.setTo(email);
        message.setSubject(localize(SUBJECT_KEY));
        message.setText(localize(BODY_KEY, resetUrl));
        mailSender.send(message);
    }

    private String localize(String key, Object... arguments) {
        return messageSource.getMessage(key, arguments, LocaleContextHolder.getLocale());
    }
}
