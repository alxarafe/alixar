package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.SecurityAuditTrail;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import java.util.Optional;
import java.util.UUID;
import org.junit.jupiter.api.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import static org.assertj.core.api.Assertions.assertThatCode;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.inOrder;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

class AuditedLogoutSuccessHandlerTest {

    private static final UUID USER_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final AuditActor ACTOR = new AuditActor(
        USER_ID,
        "alice",
        AuditAuthenticationType.SESSION
    );

    private final LogoutSuccessHandler delegate = mock(LogoutSuccessHandler.class);
    private final SecurityAuditTrail securityAuditTrail = mock(SecurityAuditTrail.class);
    private final SecurityContextAuditActorResolver actorResolver =
        mock(SecurityContextAuditActorResolver.class);
    private final AuditedLogoutSuccessHandler handler =
        new AuditedLogoutSuccessHandler(delegate, securityAuditTrail, actorResolver);

    private final MockHttpServletRequest request = new MockHttpServletRequest();
    private final MockHttpServletResponse response = new MockHttpServletResponse();
    private final Authentication authentication =
        UsernamePasswordAuthenticationToken.authenticated("alice", null, java.util.List.of());

    @Test
    void authenticatedLogoutAuditsActorThenDelegates() throws Exception {
        when(actorResolver.resolve(authentication, request)).thenReturn(Optional.of(ACTOR));

        handler.onLogoutSuccess(request, response, authentication);

        var order = inOrder(securityAuditTrail, delegate);
        order.verify(securityAuditTrail).logout(ACTOR);
        order.verify(delegate).onLogoutSuccess(request, response, authentication);
    }

    @Test
    void unresolvedActorStillDelegatesWithoutAuditing() throws Exception {
        when(actorResolver.resolve(authentication, request)).thenReturn(Optional.empty());

        handler.onLogoutSuccess(request, response, authentication);

        verify(securityAuditTrail, never()).logout(ACTOR);
        verify(delegate).onLogoutSuccess(request, response, authentication);
    }

    @Test
    void auditFailureDoesNotPreventDelegation() throws Exception {
        when(actorResolver.resolve(authentication, request)).thenReturn(Optional.of(ACTOR));
        doThrow(new IllegalStateException("database down"))
            .when(securityAuditTrail).logout(ACTOR);

        assertThatCode(() -> handler.onLogoutSuccess(request, response, authentication))
            .doesNotThrowAnyException();
        verify(delegate).onLogoutSuccess(request, response, authentication);
    }

    @Test
    void actorResolutionFailureDoesNotPreventDelegation() throws Exception {
        when(actorResolver.resolve(authentication, request))
            .thenThrow(new IllegalStateException("request unavailable"));

        assertThatCode(() -> handler.onLogoutSuccess(request, response, authentication))
            .doesNotThrowAnyException();
        verifyNoInteractions(securityAuditTrail);
        verify(delegate).onLogoutSuccess(request, response, authentication);
    }
}
