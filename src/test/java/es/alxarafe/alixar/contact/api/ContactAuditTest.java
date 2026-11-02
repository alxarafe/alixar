package es.alxarafe.alixar.contact.api;

import es.alxarafe.alixar.audit.AuditModeTestSupport;
import es.alxarafe.alixar.audit.InMemoryAuditEventRepository;
import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.domain.AuditResult;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestApiTokenRepository;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestAuthorizationRepository;
import es.alxarafe.alixar.authentication.AuthenticationTestConfig.TestUserRepository;
import es.alxarafe.alixar.authentication.api.AuthenticationEndpoints;
import es.alxarafe.alixar.authentication.application.ApiTokenRepository;
import es.alxarafe.alixar.authentication.application.AuthorizationRepository;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixar.authentication.application.RoleCodes;
import es.alxarafe.alixar.authentication.application.TokenHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.ApiToken;
import es.alxarafe.alixar.authentication.domain.User;
import es.alxarafe.alixar.contact.ContactTestConfig;
import es.alxarafe.alixar.contact.application.ContactRepository;
import es.alxarafe.alixar.contact.application.CreateContactCommand;
import es.alxarafe.alixar.contact.application.CreateContactUseCase;
import jakarta.servlet.http.Cookie;
import java.time.Instant;
import java.util.List;
import java.util.UUID;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.reset;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import({ContactTestConfig.class, AuthenticationTestConfig.class})
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
class ContactAuditTest {

    private static final UUID ALICE_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final String USERNAME = "alice";
    private static final String PASSWORD = "correct-test-password";
    private static final String CSRF_COOKIE = "XSRF-TOKEN";
    private static final String CSRF_HEADER = "X-XSRF-TOKEN";
    private static final String BODY = "{\"lastName\":\"Doe\",\"email\":\"john@example.test\"}";

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private CreateContactUseCase createContactUseCase;

    @Autowired
    private ContactRepository contactRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthorizationRepository authorizationRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    @Autowired
    private ApiTokenRepository apiTokenRepository;

    @Autowired
    private TokenHasher tokenHasher;

    @Autowired
    private AuditModeTestSupport auditMode;

    @Autowired
    private InMemoryAuditEventRepository auditEventRepository;

    private MockMvc mockMvc;

    @BeforeEach
    void setup() {
        reset(createContactUseCase, contactRepository);
        mockMvc = MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
        Instant now = Instant.parse("2026-11-02T10:00:00Z");
        ((TestUserRepository) userRepository).replaceWith(new User(
            ALICE_ID,
            USERNAME,
            "alice@example.test",
            passwordHasher.hash(PASSWORD),
            true,
            0,
            now,
            now
        ));
        ((TestApiTokenRepository) apiTokenRepository).replaceWith();
        ((TestAuthorizationRepository) authorizationRepository).reset();
        authorizationRepository.assignRoleToUser(ALICE_ID, RoleCodes.SYSTEM_ADMIN);
        auditMode.reset();
        auditEventRepository.seedChain(AuditChain.DEFAULT_CHAIN_ID);
    }

    @Test
    void offMode_create_doesNotAppendAuditEvent() throws Exception {
        when(createContactUseCase.execute(anyCommand())).thenReturn(1L);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        create(session, csrfCookie).andExpect(status().isCreated());

        assertThat(auditEvents()).isEmpty();
    }

    @Test
    void basicAndSelectiveModes_create_appendSuccessEventWithoutBusinessPayload() throws Exception {
        when(createContactUseCase.execute(anyCommand())).thenReturn(1L, 2L);
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        auditMode.setMode(AuditMode.BASIC);
        try {
            create(session, csrfCookie).andExpect(status().isCreated());
            auditMode.setMode(AuditMode.SELECTIVE);
            create(session, csrfCookie).andExpect(status().isCreated());

            assertThat(auditEvents()).hasSize(2).allSatisfy(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.CONTACT_CREATED.name());
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.CONTACT.name());
                assertThat(event.result()).isEqualTo(AuditResult.SUCCESS);
                assertThat(event.actorUserId()).isEqualTo(ALICE_ID);
                assertThat(event.actorUsername()).isEqualTo(USERNAME);
                assertThat(event.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
                assertThat(event.toString()).doesNotContain("Doe", "john@example.test");
            });
            assertThat(auditEvents())
                .extracting(AuditEvent::resourceId)
                .containsExactly("1", "2");
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void bearerCreate_appendsPatAuthenticationType() throws Exception {
        when(createContactUseCase.execute(anyCommand())).thenReturn(3L);
        String rawToken = personalAccessToken();
        auditMode.setMode(AuditMode.BASIC);
        try {
            mockMvc.perform(post(ContactEndpoints.BASE_PATH)
                    .header("Authorization", "Bearer " + rawToken)
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(BODY))
                .andExpect(status().isCreated());

            assertThat(auditEvents()).singleElement().satisfies(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.CONTACT_CREATED.name());
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.CONTACT.name());
                assertThat(event.resourceId()).isEqualTo("3");
                assertThat(event.authenticationType()).isEqualTo(AuditAuthenticationType.PAT);
            });
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void deniedCreate_appendsAccessDeniedForContactFamily() throws Exception {
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        authorizationRepository.replaceRolePermissions(
            RoleCodes.SYSTEM_ADMIN,
            List.of(PermissionCodes.CONTACTS_READ)
        );
        auditMode.setMode(AuditMode.BASIC);
        try {
            create(session, csrfCookie).andExpect(status().isForbidden());

            assertThat(auditEvents()).singleElement().satisfies(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.ACCESS_DENIED.name());
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.HTTP_REQUEST.name());
                assertThat(event.resourceId()).isEqualTo("POST /api/contacts");
            });
        } finally {
            auditMode.reset();
        }
    }

    private org.springframework.test.web.servlet.ResultActions create(
        MockHttpSession session,
        Cookie csrfCookie
    ) throws Exception {
        return mockMvc.perform(post(ContactEndpoints.BASE_PATH)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(MediaType.APPLICATION_JSON)
            .content(BODY));
    }

    private CreateContactCommand anyCommand() {
        return org.mockito.ArgumentMatchers.any(CreateContactCommand.class);
    }

    private List<AuditEvent> auditEvents() {
        return auditEventRepository.events(AuditChain.DEFAULT_CHAIN_ID);
    }

    private String personalAccessToken() {
        Instant now = Instant.now();
        String rawToken = "alx_pat_test-" + UUID.randomUUID();
        apiTokenRepository.create(
            new ApiToken(UUID.randomUUID(), ALICE_ID, "test", 0, now, now.plusSeconds(3600), null, null),
            tokenHasher.hash(rawToken)
        );
        return rawToken;
    }

    private MockHttpSession authenticatedSession() throws Exception {
        Cookie csrfCookie = csrfCookieFromSafeRequest();
        MvcResult result = mockMvc.perform(post(AuthenticationEndpoints.LOGIN_PATH)
                .cookie(csrfCookie)
                .header(CSRF_HEADER, csrfCookie.getValue())
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"identifier\":\"" + USERNAME + "\",\"password\":\"" + PASSWORD + "\"}"))
            .andExpect(status().isOk())
            .andReturn();
        return (MockHttpSession) result.getRequest().getSession(false);
    }

    private Cookie csrfCookieFromSafeRequest() throws Exception {
        MvcResult result = mockMvc.perform(get("/health"))
            .andExpect(status().isOk())
            .andReturn();
        return result.getResponse().getCookie(CSRF_COOKIE);
    }
}
