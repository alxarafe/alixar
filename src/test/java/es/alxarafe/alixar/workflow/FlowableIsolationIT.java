package es.alxarafe.alixar.workflow;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import es.alxarafe.alixar.audit.application.AuditTrail;
import es.alxarafe.alixar.audit.infrastructure.ConfiguredAuditTrail;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.infrastructure.security.UserAuthenticationProvider;
import java.sql.Connection;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import org.flywaydb.core.Flyway;
import org.junit.jupiter.api.Test;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Import;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

@SpringBootTest(
    properties = "spring.autoconfigure.exclude=",
    webEnvironment = SpringBootTest.WebEnvironment.MOCK
)
@Import(AuthenticationTestConfig.class)
class FlowableIsolationIT {

    private static final int FLYWAY_MIGRATION_COUNT = 13;

    private static final List<String> ALIXAR_TABLES = List.of(
        "authentication_user",
        "authentication_password_reset",
        "authentication_api_token",
        "authentication_role",
        "authentication_permission",
        "authentication_role_permission",
        "authentication_user_role",
        "audit_chain_head",
        "audit_event",
        "audit_configuration",
        "audit_read_policy",
        "third_party",
        "contact",
        "flyway_schema_history"
    );

    @Autowired
    private ConfigurableApplicationContext context;

    @Autowired
    private WebApplicationContext webApplicationContext;

    @Autowired
    private Flyway flyway;

    @Test
    void flowableDoesNotChangeAlixarSecurityAuditOrEndpoints() throws Exception {
        assertPostgresqlVersion();
        assertNoFlowableBeans();

        assertThat(flyway.info().all()).hasSize(FLYWAY_MIGRATION_COUNT);
        assertThat(flyway.info().current()).isNotNull();
        assertThat(flyway.info().current().getVersion().getVersion())
            .isEqualTo(String.valueOf(FLYWAY_MIGRATION_COUNT));

        assertThat(WorkflowSpikeDatabase.tableNames(WorkflowSpikeDatabase.PUBLIC_SCHEMA))
            .containsExactlyInAnyOrderElementsOf(ALIXAR_TABLES);
        assertThat(WorkflowSpikeDatabase.hasFlowableTables(WorkflowSpikeDatabase.PUBLIC_SCHEMA))
            .isFalse();

        assertThat(context.getBeanNamesForType(UserDetailsService.class)).isEmpty();
        AuthenticationManager authenticationManager = context.getBean(AuthenticationManager.class);
        assertThat(authenticationManager).isInstanceOf(ProviderManager.class);
        assertThat(((ProviderManager) authenticationManager).getProviders())
            .anyMatch(UserAuthenticationProvider.class::isInstance);
        assertThat(context.getBeanNamesForType(SecurityFilterChain.class)).hasSize(1);
        assertThat(context.getBean(AuditTrail.class)).isInstanceOf(ConfiguredAuditTrail.class);

        assertNoFlowableRequestHandlers();
        assertEndpointSecurityIsUnchanged();
    }

    private void assertNoFlowableBeans() {
        List<String> flowableNamedBeans = Arrays.stream(context.getBeanDefinitionNames())
            .filter(name -> name.toLowerCase(Locale.ROOT).contains("flowable"))
            .toList();
        assertThat(flowableNamedBeans).isEmpty();

        List<String> flowableTypedBeans = Arrays.stream(context.getBeanDefinitionNames())
            .map(this::beanType)
            .filter(Objects::nonNull)
            .map(Class::getName)
            .filter(name -> name.startsWith("org.flowable."))
            .toList();
        assertThat(flowableTypedBeans).isEmpty();
    }

    private Class<?> beanType(String beanName) {
        try {
            return context.getType(beanName);
        } catch (BeansException exception) {
            return null;
        }
    }

    private void assertNoFlowableRequestHandlers() {
        List<String> flowableHandlers = context.getBeansOfType(RequestMappingHandlerMapping.class)
            .values()
            .stream()
            .flatMap(mapping -> mapping.getHandlerMethods().values().stream())
            .map(handlerMethod -> handlerMethod.getBeanType().getName())
            .filter(name -> name.startsWith("org.flowable."))
            .toList();
        assertThat(flowableHandlers).isEmpty();
    }

    private void assertEndpointSecurityIsUnchanged() throws Exception {
        MockMvc mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext)
            .apply(springSecurity())
            .build();

        mockMvc.perform(get("/health")).andExpect(status().isOk());
        mockMvc.perform(get("/api/contacts")).andExpect(status().isUnauthorized());
        mockMvc.perform(get("/api/admin/users")).andExpect(status().isUnauthorized());
    }

    private void assertPostgresqlVersion() throws Exception {
        try (Connection connection = WorkflowSpikeDatabase.connection()) {
            assertThat(connection.getMetaData().getDatabaseProductVersion()).startsWith("18.6");
        }
    }
}
