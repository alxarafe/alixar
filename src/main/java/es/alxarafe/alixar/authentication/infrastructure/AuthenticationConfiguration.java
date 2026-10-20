package es.alxarafe.alixar.authentication.infrastructure;

import es.alxarafe.alixar.authentication.application.ApiTokenGenerator;
import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AssignRoleToUserUseCase;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.AuthenticateApiTokenUseCase;
import es.alxarafe.alixar.authentication.application.AuthenticateUserUseCase;
import es.alxarafe.alixar.authentication.application.ChangePasswordUseCase;
import es.alxarafe.alixar.authentication.application.ChangeUsernameUseCase;
import es.alxarafe.alixar.authentication.application.CreateAdminUserUseCase;
import es.alxarafe.alixar.authentication.application.CreateApiTokenUseCase;
import es.alxarafe.alixar.authentication.application.ForgotPasswordUseCase;
import es.alxarafe.alixar.authentication.application.GetAdminUserUseCase;
import es.alxarafe.alixar.authentication.application.GetEffectivePermissionsUseCase;
import es.alxarafe.alixar.authentication.application.ListAdminUsersUseCase;
import es.alxarafe.alixar.authentication.application.ListApiTokensUseCase;
import es.alxarafe.alixar.authentication.application.ListRolesUseCase;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PasswordResetNotifier;
import es.alxarafe.alixar.authentication.application.PasswordResetTokenRepository;
import es.alxarafe.alixar.authentication.application.ResetPasswordUseCase;
import es.alxarafe.alixar.authentication.application.RemoveRoleFromUserUseCase;
import es.alxarafe.alixar.authentication.application.ReplaceAdminUserRolesUseCase;
import es.alxarafe.alixar.authentication.application.ResetAdminUserPasswordUseCase;
import es.alxarafe.alixar.authentication.application.RevokeApiTokenUseCase;
import es.alxarafe.alixar.authentication.application.SetAdminUserEnabledUseCase;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.application.UpdateAdminUsernameUseCase;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.infrastructure.persistence.JooqApiTokenRepository;
import es.alxarafe.alixar.authentication.infrastructure.persistence.JooqAuthorizationRepository;
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
    @ConditionalOnMissingBean(ApiTokenRepository.class)
    ApiTokenRepository apiTokenRepository(DSLContext dsl) {
        return new JooqApiTokenRepository(dsl);
    }

    @Bean
    @ConditionalOnMissingBean(AuthorizationRepository.class)
    AuthorizationRepository authorizationRepository(DSLContext dsl) {
        return new JooqAuthorizationRepository(dsl);
    }

    @Bean
    GetEffectivePermissionsUseCase getEffectivePermissionsUseCase(AuthorizationRepository authorizationRepository) {
        return new GetEffectivePermissionsUseCase(authorizationRepository);
    }

    @Bean
    ListAdminUsersUseCase listAdminUsersUseCase(
        UserRepository userRepository,
        AuthorizationRepository authorizationRepository
    ) {
        return new ListAdminUsersUseCase(userRepository, authorizationRepository);
    }

    @Bean
    GetAdminUserUseCase getAdminUserUseCase(
        UserRepository userRepository,
        AuthorizationRepository authorizationRepository
    ) {
        return new GetAdminUserUseCase(userRepository, authorizationRepository);
    }

    @Bean
    ListRolesUseCase listRolesUseCase(AuthorizationRepository authorizationRepository) {
        return new ListRolesUseCase(authorizationRepository);
    }

    @Bean
    CreateAdminUserUseCase createAdminUserUseCase(
        UserRepository userRepository,
        AuthorizationRepository authorizationRepository,
        PasswordHasher passwordHasher
    ) {
        return new CreateAdminUserUseCase(userRepository, authorizationRepository, passwordHasher);
    }

    @Bean
    UpdateAdminUsernameUseCase updateAdminUsernameUseCase(
        UserRepository userRepository,
        AuthorizationRepository authorizationRepository
    ) {
        return new UpdateAdminUsernameUseCase(userRepository, authorizationRepository);
    }

    @Bean
    ReplaceAdminUserRolesUseCase replaceAdminUserRolesUseCase(
        UserRepository userRepository,
        AuthorizationRepository authorizationRepository
    ) {
        return new ReplaceAdminUserRolesUseCase(userRepository, authorizationRepository);
    }

    @Bean
    SetAdminUserEnabledUseCase setAdminUserEnabledUseCase(
        UserRepository userRepository,
        AuthorizationRepository authorizationRepository,
        PasswordResetTokenRepository passwordResetTokenRepository
    ) {
        return new SetAdminUserEnabledUseCase(
            userRepository,
            authorizationRepository,
            passwordResetTokenRepository
        );
    }

    @Bean
    ResetAdminUserPasswordUseCase resetAdminUserPasswordUseCase(
        UserRepository userRepository,
        PasswordResetTokenRepository passwordResetTokenRepository,
        PasswordHasher passwordHasher
    ) {
        return new ResetAdminUserPasswordUseCase(
            userRepository,
            passwordResetTokenRepository,
            passwordHasher
        );
    }

    @Bean
    TransactionalAdminUserService transactionalAdminUserService(
        CreateAdminUserUseCase createAdminUserUseCase,
        UpdateAdminUsernameUseCase updateAdminUsernameUseCase,
        SetAdminUserEnabledUseCase setAdminUserEnabledUseCase,
        ResetAdminUserPasswordUseCase resetAdminUserPasswordUseCase,
        ReplaceAdminUserRolesUseCase replaceAdminUserRolesUseCase
    ) {
        return new TransactionalAdminUserService(
            createAdminUserUseCase,
            updateAdminUsernameUseCase,
            setAdminUserEnabledUseCase,
            resetAdminUserPasswordUseCase,
            replaceAdminUserRolesUseCase
        );
    }

    @Bean
    AssignRoleToUserUseCase assignRoleToUserUseCase(AuthorizationRepository authorizationRepository) {
        return new AssignRoleToUserUseCase(authorizationRepository);
    }

    @Bean
    RemoveRoleFromUserUseCase removeRoleFromUserUseCase(AuthorizationRepository authorizationRepository) {
        return new RemoveRoleFromUserUseCase(authorizationRepository);
    }

    @Bean
    ApiTokenGenerator apiTokenGenerator() {
        return new ApiTokenGenerator();
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
    CreateApiTokenUseCase createApiTokenUseCase(
        UserRepository userRepository,
        ApiTokenRepository apiTokenRepository,
        ApiTokenGenerator apiTokenGenerator,
        TokenHasher tokenHasher
    ) {
        return new CreateApiTokenUseCase(userRepository, apiTokenRepository, apiTokenGenerator, tokenHasher);
    }

    @Bean
    ListApiTokensUseCase listApiTokensUseCase(ApiTokenRepository apiTokenRepository) {
        return new ListApiTokensUseCase(apiTokenRepository);
    }

    @Bean
    RevokeApiTokenUseCase revokeApiTokenUseCase(ApiTokenRepository apiTokenRepository) {
        return new RevokeApiTokenUseCase(apiTokenRepository);
    }

    @Bean
    AuthenticateApiTokenUseCase authenticateApiTokenUseCase(
        ApiTokenRepository apiTokenRepository,
        UserRepository userRepository,
        TokenHasher tokenHasher
    ) {
        return new AuthenticateApiTokenUseCase(apiTokenRepository, userRepository, tokenHasher);
    }

    @Bean
    TransactionalApiTokenService transactionalApiTokenService(
        CreateApiTokenUseCase createApiTokenUseCase,
        RevokeApiTokenUseCase revokeApiTokenUseCase
    ) {
        return new TransactionalApiTokenService(createApiTokenUseCase, revokeApiTokenUseCase);
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
    ChangeUsernameUseCase changeUsernameUseCase(UserRepository userRepository) {
        return new ChangeUsernameUseCase(userRepository);
    }

    @Bean
    ChangePasswordUseCase changePasswordUseCase(
        UserRepository userRepository,
        PasswordResetTokenRepository tokenRepository,
        PasswordHasher passwordHasher
    ) {
        return new ChangePasswordUseCase(userRepository, tokenRepository, passwordHasher);
    }

    @Bean
    TransactionalUserSelfService transactionalUserSelfService(
        ChangeUsernameUseCase changeUsernameUseCase,
        ChangePasswordUseCase changePasswordUseCase
    ) {
        return new TransactionalUserSelfService(changeUsernameUseCase, changePasswordUseCase);
    }

    @Bean
    AuthenticationManager authenticationManager(AuthenticateUserUseCase authenticateUserUseCase) {
        return new ProviderManager(new UserAuthenticationProvider(authenticateUserUseCase));
    }
}
