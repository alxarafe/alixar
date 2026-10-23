package es.alxarafe.alixar.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver;

import java.util.Locale;

@Configuration
public class I18nConfig {

    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasenames(
            "classpath:i18n/core/messages",
            "classpath:i18n/contact/messages",
            "classpath:i18n/authentication/messages",
            "classpath:i18n/audit/messages"
        );
        messageSource.setDefaultEncoding("UTF-8");
        messageSource.setUseCodeAsDefaultMessage(true);
        messageSource.setCacheSeconds(60);
        return messageSource;
    }

    @Bean
    public LocaleResolver localeResolver() {
        AcceptHeaderLocaleResolver resolver = new AcceptHeaderLocaleResolver();
        resolver.setSupportedLocales(java.util.List.of(Locale.ENGLISH, new Locale("es")));
        resolver.setDefaultLocale(Locale.ENGLISH);
        return resolver;
    }
}
