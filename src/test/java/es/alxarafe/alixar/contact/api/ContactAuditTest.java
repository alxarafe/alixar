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
import es.alxarafe.alixar.contact.application.ContactListQuery;
import es.alxarafe.alixar.contact.application.ContactPage;
import es.alxarafe.alixar.contact.application.ContactRepository;
import es.alxarafe.alixar.contact.application.CreateContactCommand;
import es.alxarafe.alixar.contact.application.CreateContactUseCase;
import es.alxarafe.alixar.contact.application.DeleteContactUseCase;
import es.alxarafe.alixar.contact.application.UpdateContactCommand;
import es.alxarafe.alixar.contact.application.UpdateContactResult;
import es.alxarafe.alixar.contact.application.UpdateContactUseCase;
import es.alxarafe.alixar.contact.domain.Contact;
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
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.reset;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
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
    private UpdateContactUseCase updateContactUseCase;

    @Autowired
    private DeleteContactUseCase deleteContactUseCase;

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
        reset(createContactUseCase, updateContactUseCase, deleteContactUseCase, contactRepository);
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
    void list_doesNotAppendReadAuditEvents() throws Exception {
        when(contactRepository.findPage(new ContactListQuery(0, 20, null)))
            .thenReturn(new ContactPage(List.of(), 0, 20, 0));
        MockHttpSession session = authenticatedSession();

        for (AuditMode mode : List.of(AuditMode.BASIC, AuditMode.SELECTIVE)) {
            auditMode.setMode(mode);
            try {
                mockMvc.perform(get(ContactEndpoints.BASE_PATH).session(session))
                    .andExpect(status().isOk());
                assertThat(auditEvents()).isEmpty();
            } finally {
                auditMode.reset();
            }
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

    @Test
    void offMode_update_doesNotAppendAuditEvent() throws Exception {
        stubUpdated(1L, "Updated");
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        update(session, csrfCookie, 1L, "{\"lastName\":\"Updated\"}")
            .andExpect(status().isOk());

        assertThat(auditEvents()).isEmpty();
    }

    @Test
    void basicAndSelectiveModes_update_appendUpdatedEventWithoutBusinessPayload() throws Exception {
        stubUpdated(1L, "Basic Updated");
        stubUpdated(2L, "Selective Updated");
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        auditMode.setMode(AuditMode.BASIC);
        try {
            update(session, csrfCookie, 1L, "{\"lastName\":\"Basic Updated\"}")
                .andExpect(status().isOk());
            auditMode.setMode(AuditMode.SELECTIVE);
            update(session, csrfCookie, 2L, "{\"lastName\":\"Selective Updated\"}")
                .andExpect(status().isOk());

            assertThat(auditEvents()).hasSize(2).allSatisfy(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.CONTACT_UPDATED.name());
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.CONTACT.name());
                assertThat(event.result()).isEqualTo(AuditResult.SUCCESS);
                assertThat(event.actorUserId()).isEqualTo(ALICE_ID);
                assertThat(event.actorUsername()).isEqualTo(USERNAME);
                assertThat(event.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
                assertThat(event.toString()).doesNotContain("Updated", "Doe", "john@example.test");
            });
            assertThat(auditEvents())
                .extracting(AuditEvent::resourceId)
                .containsExactly("1", "2");
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void bearerUpdate_appendsPatAuthenticationType() throws Exception {
        stubUpdated(3L, "Bearer Updated");
        String rawToken = personalAccessToken();
        auditMode.setMode(AuditMode.BASIC);
        try {
            mockMvc.perform(patch(ContactEndpoints.BASE_PATH + "/3")
                    .header("Authorization", "Bearer " + rawToken)
                    .contentType(ContactEndpoints.MERGE_PATCH_MEDIA_TYPE)
                    .content("{\"lastName\":\"Bearer Updated\"}"))
                .andExpect(status().isOk());

            assertThat(auditEvents()).singleElement().satisfies(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.CONTACT_UPDATED.name());
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.CONTACT.name());
                assertThat(event.resourceId()).isEqualTo("3");
                assertThat(event.authenticationType()).isEqualTo(AuditAuthenticationType.PAT);
            });
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void update_noOp_doesNotAppendUpdatedEvent() throws Exception {
        when(updateContactUseCase.execute(eq(3L), any(UpdateContactCommand.class)))
            .thenReturn(new UpdateContactResult(
                new Contact(3L, "Doe", "John", "john@example.test", null),
                false
            ));
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        auditMode.setMode(AuditMode.BASIC);
        try {
            update(session, csrfCookie, 3L, "{}").andExpect(status().isOk());
            update(session, csrfCookie, 3L, "{\"lastName\":\"Doe\"}")
                .andExpect(status().isOk());

            assertThat(auditEvents())
                .noneMatch(event -> event.action().equals(AuditAction.CONTACT_UPDATED.name()));
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void update_rejectedRequests_doNotAppendMutationAudit() throws Exception {
        when(updateContactUseCase.execute(eq(3L), any(UpdateContactCommand.class)))
            .thenThrow(new es.alxarafe.alixar.contact.application.InvalidContactDataException(
                es.alxarafe.alixar.core.application.ErrorCode.VALIDATION_REQUIRED,
                "lastName"
            ));
        when(updateContactUseCase.execute(eq(404L), any(UpdateContactCommand.class)))
            .thenThrow(new es.alxarafe.alixar.contact.application.ContactNotFoundException(404L));
        when(updateContactUseCase.execute(eq(5L), any(UpdateContactCommand.class)))
            .thenThrow(new es.alxarafe.alixar.contact.application.InvalidThirdPartyReferenceException());

        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        auditMode.setMode(AuditMode.BASIC);
        try {
            update(session, csrfCookie, 3L, "{\"lastName\":\"   \"}")
                .andExpect(status().isBadRequest());
            update(session, csrfCookie, 404L, "{\"lastName\":\"Doe\"}")
                .andExpect(status().isNotFound());
            update(session, csrfCookie, 5L, "{\"thirdPartyId\":999}")
                .andExpect(status().isUnprocessableEntity());

            mockMvc.perform(patch(ContactEndpoints.BASE_PATH + "/3")
                    .session(session)
                    .contentType(ContactEndpoints.MERGE_PATCH_MEDIA_TYPE)
                    .content("{\"lastName\":\"Doe\"}"))
                .andExpect(status().isForbidden());

            authorizationRepository.replaceRolePermissions(
                RoleCodes.SYSTEM_ADMIN,
                List.of(PermissionCodes.CONTACTS_READ)
            );
            update(session, csrfCookie, 3L, "{\"lastName\":\"Doe\"}")
                .andExpect(status().isForbidden());

            assertThat(auditEvents())
                .noneMatch(event -> event.action().equals(AuditAction.CONTACT_UPDATED.name()));
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void offMode_delete_doesNotAppendAuditEvent() throws Exception {
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        deleteContact(session, csrfCookie, 1L).andExpect(status().isNoContent());

        assertThat(auditEvents()).isEmpty();
    }

    @Test
    void basicAndSelectiveModes_delete_appendDeletedEventWithoutBusinessPayload() throws Exception {
        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        auditMode.setMode(AuditMode.BASIC);
        try {
            deleteContact(session, csrfCookie, 1L).andExpect(status().isNoContent());
            auditMode.setMode(AuditMode.SELECTIVE);
            deleteContact(session, csrfCookie, 2L).andExpect(status().isNoContent());

            assertThat(auditEvents()).hasSize(2).allSatisfy(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.CONTACT_DELETED.name());
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.CONTACT.name());
                assertThat(event.result()).isEqualTo(AuditResult.SUCCESS);
                assertThat(event.actorUserId()).isEqualTo(ALICE_ID);
                assertThat(event.actorUsername()).isEqualTo(USERNAME);
                assertThat(event.authenticationType()).isEqualTo(AuditAuthenticationType.SESSION);
                assertThat(event.toString()).doesNotContain("Doe", "John", "john@example.test");
            });
            assertThat(auditEvents())
                .extracting(AuditEvent::resourceId)
                .containsExactly("1", "2");
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void bearerDelete_appendsPatAuthenticationType() throws Exception {
        String rawToken = personalAccessToken();
        auditMode.setMode(AuditMode.BASIC);
        try {
            mockMvc.perform(delete(ContactEndpoints.BASE_PATH + "/3")
                    .header("Authorization", "Bearer " + rawToken))
                .andExpect(status().isNoContent());

            assertThat(auditEvents()).singleElement().satisfies(event -> {
                assertThat(event.action()).isEqualTo(AuditAction.CONTACT_DELETED.name());
                assertThat(event.resourceType()).isEqualTo(AuditResourceType.CONTACT.name());
                assertThat(event.resourceId()).isEqualTo("3");
                assertThat(event.authenticationType()).isEqualTo(AuditAuthenticationType.PAT);
            });
        } finally {
            auditMode.reset();
        }
    }

    @Test
    void delete_rejectedRequests_doNotAppendMutationAudit() throws Exception {
        doThrow(new es.alxarafe.alixar.contact.application.InvalidContactDataException(
            es.alxarafe.alixar.core.application.ErrorCode.VALIDATION_INVALID,
            "id"
        )).when(deleteContactUseCase).execute(0L);
        doThrow(new es.alxarafe.alixar.contact.application.ContactNotFoundException(404L))
            .when(deleteContactUseCase).execute(404L);

        MockHttpSession session = authenticatedSession();
        Cookie csrfCookie = csrfCookieFromSafeRequest();

        auditMode.setMode(AuditMode.BASIC);
        try {
            deleteContact(session, csrfCookie, 0L).andExpect(status().isBadRequest());
            deleteContact(session, csrfCookie, 404L).andExpect(status().isNotFound());

            mockMvc.perform(delete(ContactEndpoints.BASE_PATH + "/3").session(session))
                .andExpect(status().isForbidden());

            authorizationRepository.replaceRolePermissions(
                RoleCodes.SYSTEM_ADMIN,
                List.of(PermissionCodes.CONTACTS_READ)
            );
            deleteContact(session, csrfCookie, 3L).andExpect(status().isForbidden());

            assertThat(auditEvents())
                .noneMatch(event -> event.action().equals(AuditAction.CONTACT_DELETED.name()));
        } finally {
            auditMode.reset();
        }
    }

    private void stubUpdated(long id, String lastName) {
        when(updateContactUseCase.execute(eq(id), any(UpdateContactCommand.class)))
            .thenReturn(new UpdateContactResult(
                new Contact(id, lastName, "John", "john@example.test", null),
                true
            ));
    }

    private org.springframework.test.web.servlet.ResultActions update(
        MockHttpSession session,
        Cookie csrfCookie,
        long id,
        String body
    ) throws Exception {
        return mockMvc.perform(patch(ContactEndpoints.BASE_PATH + "/" + id)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue())
            .contentType(ContactEndpoints.MERGE_PATCH_MEDIA_TYPE)
            .content(body));
    }

    private org.springframework.test.web.servlet.ResultActions deleteContact(
        MockHttpSession session,
        Cookie csrfCookie,
        long id
    ) throws Exception {
        return mockMvc.perform(delete(ContactEndpoints.BASE_PATH + "/" + id)
            .session(session)
            .cookie(csrfCookie)
            .header(CSRF_HEADER, csrfCookie.getValue()));
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
