package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.audit.api.AuditEndpoints;
import es.alxarafe.alixar.audit.application.SecurityAuditTrail;
import es.alxarafe.alixar.authentication.api.AdminUserEndpoints;
import es.alxarafe.alixar.authentication.api.UserEndpoints;
import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AuthenticateApiTokenUseCase;
import es.alxarafe.alixar.authentication.application.GetEffectivePermissionsUseCase;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixar.authentication.application.UserRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.access.intercept.AuthorizationFilter;
import org.springframework.security.web.authentication.HttpStatusEntryPoint;
import org.springframework.security.web.authentication.logout.HttpStatusReturningLogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
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
@EnableMethodSecurity
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
    HttpAuditResourceFamilyClassifier httpAuditResourceFamilyClassifier() {
        return new HttpAuditResourceFamilyClassifier();
    }

    @Bean
    AccessDeniedHandler accessDeniedHandler(
        SecurityAuditTrail securityAuditTrail,
        SecurityContextAuditActorResolver auditActorResolver,
        HttpAuditResourceFamilyClassifier httpAuditResourceFamilyClassifier
    ) {
        return new AuditedAccessDeniedHandler(
            // Finish the API denial here: sendError redispatches to /error, whose
            // deny-by-default rule can replace an anonymous CSRF rejection with 401.
            (request, response, exception) -> response.setStatus(HttpStatus.FORBIDDEN.value()),
            securityAuditTrail,
            auditActorResolver,
            httpAuditResourceFamilyClassifier
        );
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
    SecurityContextAuditActorResolver auditActorResolver() {
        return new SecurityContextAuditActorResolver();
    }

    @Bean
    LogoutSuccessHandler logoutSuccessHandler(
        SecurityAuditTrail securityAuditTrail,
        SecurityContextAuditActorResolver auditActorResolver
    ) {
        return new AuditedLogoutSuccessHandler(
            new HttpStatusReturningLogoutSuccessHandler(HttpStatus.NO_CONTENT),
            securityAuditTrail,
            auditActorResolver
        );
    }

    @Bean
    ApiTokenAuthenticationFilter apiTokenAuthenticationFilter(
        AuthenticateApiTokenUseCase authenticateApiToken,
        ApiTokenRepository apiTokenRepository
    ) {
        return new ApiTokenAuthenticationFilter(authenticateApiToken, apiTokenRepository);
    }

    @Bean
    EffectivePermissionsFilter effectivePermissionsFilter(GetEffectivePermissionsUseCase getEffectivePermissions) {
        return new EffectivePermissionsFilter(getEffectivePermissions);
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
        EffectivePermissionsFilter effectivePermissionsFilter,
        BearerTokenRequestMatcher bearerTokenRequestMatcher,
        LogoutSuccessHandler logoutSuccessHandler
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
            .addFilterBefore(effectivePermissionsFilter, AuthorizationFilter.class)
            .authorizeHttpRequests(authorize -> authorize
                .requestMatchers(HEALTH_PATH, CONTACTS_PATH_PATTERN, LOGIN_PATH, BASE_PATH + "/password/forgot", BASE_PATH + "/password/reset").permitAll()
                .requestMatchers(HttpMethod.GET, AdminUserEndpoints.ROLES_BASE_PATH)
                    .hasAnyAuthority(PermissionCodes.USERS_MANAGE, PermissionCodes.ROLES_MANAGE)
                .requestMatchers(AdminUserEndpoints.ROLES_BASE_PATH, AdminUserEndpoints.ROLES_PATH_PATTERN)
                    .hasAuthority(PermissionCodes.ROLES_MANAGE)
                .requestMatchers(AdminUserEndpoints.PERMISSIONS_BASE_PATH)
                    .hasAuthority(PermissionCodes.ROLES_MANAGE)
                .requestMatchers(HttpMethod.GET, AuditEndpoints.VERIFICATION_PATH)
                    .hasAuthority(PermissionCodes.AUDIT_READ)
                .requestMatchers(HttpMethod.GET, AuditEndpoints.BASE_PATH)
                    .hasAuthority(PermissionCodes.AUDIT_READ)
                .requestMatchers(HttpMethod.GET, AuditEndpoints.READ_POLICY_PATH)
                    .hasAnyAuthority(PermissionCodes.AUDIT_READ, PermissionCodes.AUDIT_CONFIGURE)
                .requestMatchers(HttpMethod.PUT, AuditEndpoints.READ_POLICY_PATH)
                    .hasAuthority(PermissionCodes.AUDIT_CONFIGURE)
                .requestMatchers(HttpMethod.GET, AuditEndpoints.CONFIGURATION_PATH)
                    .hasAnyAuthority(PermissionCodes.AUDIT_READ, PermissionCodes.AUDIT_CONFIGURE)
                .requestMatchers(HttpMethod.PUT, AuditEndpoints.CONFIGURATION_PATH)
                    .hasAuthority(PermissionCodes.AUDIT_CONFIGURE)
                .requestMatchers(AdminUserEndpoints.BASE_PATH, AdminUserEndpoints.USERS_PATH_PATTERN)
                    .hasAuthority(PermissionCodes.USERS_MANAGE)
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
                .logoutSuccessHandler(logoutSuccessHandler));
        return http.build();
    }
}
