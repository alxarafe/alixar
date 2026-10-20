package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.authentication.api.UserEndpoints;
import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AuthenticateApiTokenUseCase;
import es.alxarafe.alixar.authentication.application.UserRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.HttpStatusEntryPoint;
import org.springframework.security.web.authentication.logout.HttpStatusReturningLogoutSuccessHandler;
import org.springframework.security.web.authentication.session.ChangeSessionIdAuthenticationStrategy;
import org.springframework.security.web.authentication.session.CompositeSessionAuthenticationStrategy;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.security.web.context.SecurityContextRepository;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.csrf.CsrfAuthenticationStrategy;
import org.springframework.security.web.csrf.CsrfTokenRepository;

import static es.alxarafe.alixar.authentication.api.AuthenticationEndpoints.LOGIN_PATH;
import static es.alxarafe.alixar.authentication.api.AuthenticationEndpoints.LOGOUT_PATH;
import static es.alxarafe.alixar.authentication.api.AuthenticationEndpoints.ME_PATH;
import static es.alxarafe.alixar.authentication.api.AuthenticationEndpoints.BASE_PATH;

@Configuration
public class SecurityConfiguration {

    private static final String HEALTH_PATH = "/health";
    private static final String CONTACTS_PATH_PATTERN = "/api/contacts/**";
    private static final String SESSION_COOKIE_NAME = "JSESSIONID";

    @Bean
    SecurityContextRepository securityContextRepository(BearerTokenRequestMatcher bearerTokenRequestMatcher) {
        return new BearerAwareSecurityContextRepository(
            new HttpSessionSecurityContextRepository(),
            bearerTokenRequestMatcher
        );
    }

    @Bean
    CsrfTokenRepository csrfTokenRepository() {
        return CookieCsrfTokenRepository.withHttpOnlyFalse();
    }

    @Bean
    SessionAuthenticationStrategy sessionAuthenticationStrategy(
        CsrfTokenRepository csrfTokenRepository,
        BearerTokenRequestMatcher bearerTokenRequestMatcher
    ) {
        return new BearerAwareSessionAuthenticationStrategy(
            new CompositeSessionAuthenticationStrategy(java.util.List.of(
                new ChangeSessionIdAuthenticationStrategy(),
                new CsrfAuthenticationStrategy(csrfTokenRepository)
            )),
            bearerTokenRequestMatcher
        );
    }

    @Bean
    AuthenticationEntryPoint authenticationEntryPoint() {
        return new HttpStatusEntryPoint(HttpStatus.UNAUTHORIZED);
    }

    @Bean
    AccessDeniedHandler accessDeniedHandler() {
        return (request, response, exception) -> response.sendError(HttpStatus.FORBIDDEN.value());
    }

    @Bean
    CredentialsVersionCheckFilter credentialsVersionCheckFilter(UserRepository userRepository) {
        return new CredentialsVersionCheckFilter(userRepository);
    }

    @Bean
    BearerTokenRequestMatcher bearerTokenRequestMatcher() {
        return new BearerTokenRequestMatcher();
    }

    @Bean
    ApiTokenAuthenticationFilter apiTokenAuthenticationFilter(
        AuthenticateApiTokenUseCase authenticateApiToken,
        ApiTokenRepository apiTokenRepository
    ) {
        return new ApiTokenAuthenticationFilter(authenticateApiToken, apiTokenRepository);
    }

    @Bean
    SecurityFilterChain securityFilterChain(
        HttpSecurity http,
        AuthenticationManager authenticationManager,
        SecurityContextRepository securityContextRepository,
        CsrfTokenRepository csrfTokenRepository,
        AuthenticationEntryPoint authenticationEntryPoint,
        AccessDeniedHandler accessDeniedHandler,
        CredentialsVersionCheckFilter credentialsVersionCheckFilter,
        ApiTokenAuthenticationFilter apiTokenAuthenticationFilter,
        BearerTokenRequestMatcher bearerTokenRequestMatcher
    ) throws Exception {
        http
            .authenticationManager(authenticationManager)
            .securityContext(context -> context.securityContextRepository(securityContextRepository))
            .sessionManagement(session -> session
                .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                .sessionFixation(fixation -> fixation.changeSessionId()))
            .csrf(csrf -> {
                csrf.spa();
                csrf.csrfTokenRepository(csrfTokenRepository);
                // TODO(ALIXAR-DEV-003A): tracked debt. This temporary exclusion covers the
                // whole CONTACTS_PATH_PATTERN, so it also weakens CSRF protection for future
                // mutating Contact methods (PUT/PATCH/DELETE). Removing it changes the Contact
                // contract and requires a dedicated iteration. See docs/authentication.md.
                csrf.ignoringRequestMatchers(CONTACTS_PATH_PATTERN);
                csrf.ignoringRequestMatchers(bearerTokenRequestMatcher);
            })
            .addFilterBefore(apiTokenAuthenticationFilter, org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter.class)
            .addFilterAfter(credentialsVersionCheckFilter, org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter.class)
            .authorizeHttpRequests(authorize -> authorize
                .requestMatchers(HEALTH_PATH, CONTACTS_PATH_PATTERN, LOGIN_PATH, BASE_PATH + "/password/forgot", BASE_PATH + "/password/reset").permitAll()
                .requestMatchers(
                    ME_PATH,
                    UserEndpoints.ME_PATH,
                    UserEndpoints.PASSWORD_PATH,
                    UserEndpoints.API_TOKENS_PATH,
                    UserEndpoints.API_TOKENS_PATH + "/**"
                ).authenticated()
                .anyRequest().denyAll())
            .exceptionHandling(exceptions -> exceptions
                .authenticationEntryPoint(authenticationEntryPoint)
                .accessDeniedHandler(accessDeniedHandler))
            .requestCache(cache -> cache.disable())
            .formLogin(form -> form.disable())
            .httpBasic(basic -> basic.disable())
            .logout(logout -> logout
                .logoutUrl(LOGOUT_PATH)
                .invalidateHttpSession(true)
                .clearAuthentication(true)
                .deleteCookies(SESSION_COOKIE_NAME)
                .logoutSuccessHandler(new HttpStatusReturningLogoutSuccessHandler(HttpStatus.NO_CONTENT)));
        return http.build();
    }
}
