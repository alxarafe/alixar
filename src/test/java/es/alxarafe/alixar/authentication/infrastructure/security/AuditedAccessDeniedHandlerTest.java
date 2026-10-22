package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditUnavailableException;
import es.alxarafe.alixar.audit.application.SecurityAuditTrail;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import java.util.List;
import java.util.UUID;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.csrf.MissingCsrfTokenException;

import static org.assertj.core.api.Assertions.assertThatCode;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.inOrder;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

class AuditedAccessDeniedHandlerTest {

    private static final UUID USER_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final AuditActor SESSION_ACTOR = new AuditActor(
        USER_ID,
        "alice",
        AuditAuthenticationType.SESSION
    );
    private static final AuditActor PAT_ACTOR = new AuditActor(
        USER_ID,
        "alice",
        AuditAuthenticationType.PAT
    );

    private final SecurityAuditTrail securityAuditTrail = mock(SecurityAuditTrail.class);
    private final AccessDeniedHandler delegate = mock(AccessDeniedHandler.class);
    private final SecurityContextAuditActorResolver actorResolver =
        new SecurityContextAuditActorResolver();
    private final HttpAuditResourceFamilyClassifier resourceClassifier =
        new HttpAuditResourceFamilyClassifier();
    private final AuditedAccessDeniedHandler handler = new AuditedAccessDeniedHandler(
        delegate,
        securityAuditTrail,
        actorResolver,
        resourceClassifier
    );

    private final MockHttpServletRequest request =
        new MockHttpServletRequest("GET", "/api/admin/users/123");
    private final MockHttpServletResponse response = new MockHttpServletResponse();
    private final AccessDeniedException exception = new AccessDeniedException("denied");

    @AfterEach
    void clearContext() {
        SecurityContextHolder.clearContext();
    }

    @Test
    void sessionActorAuditsThenDelegates() throws Exception {
        authenticate();

        handler.handle(request, response, exception);

        var order = inOrder(securityAuditTrail, delegate);
        order.verify(securityAuditTrail).accessDenied(SESSION_ACTOR, "GET /api/admin/users");
        order.verify(delegate).handle(request, response, exception);
    }

    @Test
    void patActorAuditsWithPatAuthenticationType() throws Exception {
        authenticate();
        request.setAttribute(ApiTokenAuthenticationFilter.PAT_REQUEST_ATTRIBUTE, Boolean.TRUE);

        handler.handle(request, response, exception);

        verify(securityAuditTrail).accessDenied(PAT_ACTOR, "GET /api/admin/users");
        verify(delegate).handle(request, response, exception);
    }

    @Test
    void csrfRejectionDoesNotAuditAndDelegates() throws Exception {
        authenticate();
        var csrfException = new MissingCsrfTokenException("missing");

        handler.handle(request, response, csrfException);

        verifyNoInteractions(securityAuditTrail);
        verify(delegate).handle(request, response, csrfException);
    }

    @Test
    void unresolvedActorDoesNotAuditAndDelegates() throws Exception {
        handler.handle(request, response, exception);

        verifyNoInteractions(securityAuditTrail);
        verify(delegate).handle(request, response, exception);
    }

    @Test
    void unknownResourceFamilyDoesNotAuditAndDelegates() throws Exception {
        authenticate();
        var unknownRequest = new MockHttpServletRequest("GET", "/foo/bar");

        handler.handle(unknownRequest, response, exception);

        verifyNoInteractions(securityAuditTrail);
        verify(delegate).handle(unknownRequest, response, exception);
    }

    @Test
    void auditFailureDoesNotPreventDelegation() throws Exception {
        authenticate();
        doThrow(new AuditUnavailableException())
            .when(securityAuditTrail).accessDenied(SESSION_ACTOR, "GET /api/admin/users");

        assertThatCode(() -> handler.handle(request, response, exception))
            .doesNotThrowAnyException();
        verify(delegate).handle(request, response, exception);
    }

    @Test
    void actorResolverFailureDoesNotPreventDelegation() throws Exception {
        authenticate();
        SecurityContextAuditActorResolver failingResolver = mock(SecurityContextAuditActorResolver.class);
        when(failingResolver.resolve(org.mockito.ArgumentMatchers.any(), org.mockito.ArgumentMatchers.any()))
            .thenThrow(new IllegalStateException("resolver down"));
        var failingHandler = new AuditedAccessDeniedHandler(
            delegate,
            securityAuditTrail,
            failingResolver,
            resourceClassifier
        );

        assertThatCode(() -> failingHandler.handle(request, response, exception))
            .doesNotThrowAnyException();
        verifyNoInteractions(securityAuditTrail);
        verify(delegate).handle(request, response, exception);
    }

    @Test
    void resourceClassifierFailureDoesNotPreventDelegation() throws Exception {
        authenticate();
        HttpAuditResourceFamilyClassifier failingClassifier =
            mock(HttpAuditResourceFamilyClassifier.class);
        when(failingClassifier.classify(request))
            .thenThrow(new IllegalStateException("classifier down"));
        var failingHandler = new AuditedAccessDeniedHandler(
            delegate,
            securityAuditTrail,
            actorResolver,
            failingClassifier
        );

        assertThatCode(() -> failingHandler.handle(request, response, exception))
            .doesNotThrowAnyException();
        verifyNoInteractions(securityAuditTrail);
        verify(delegate).handle(request, response, exception);
    }

    private void authenticate() {
        AuthenticatedUserPrincipal principal =
            new AuthenticatedUserPrincipal(USER_ID, "alice", "alice@example.test", 0);
        SecurityContextHolder.getContext().setAuthentication(
            UsernamePasswordAuthenticationToken.authenticated(principal, null, List.of())
        );
    }
}
