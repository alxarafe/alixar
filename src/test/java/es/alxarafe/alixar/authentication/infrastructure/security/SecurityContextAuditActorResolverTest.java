package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import static org.assertj.core.api.Assertions.assertThat;

class SecurityContextAuditActorResolverTest {

    private static final UUID USER_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");

    private final SecurityContextAuditActorResolver resolver =
        new SecurityContextAuditActorResolver();

    @AfterEach
    void clearContexts() {
        SecurityContextHolder.clearContext();
        RequestContextHolder.resetRequestAttributes();
    }

    @Test
    void resolvesSessionActorFromAuthenticatedPrincipal() {
        authenticate();
        MockHttpServletRequest request = request();

        Optional<AuditActor> actor = resolver.resolveCurrentActor();

        assertThat(actor).contains(new AuditActor(
            USER_ID,
            "alice",
            AuditAuthenticationType.SESSION
        ));
        assertThat(request.getAttribute(ApiTokenAuthenticationFilter.PAT_REQUEST_ATTRIBUTE)).isNull();
    }

    @Test
    void resolvesPatActorWhenPatFilterMarkedTheRequest() {
        authenticate();
        MockHttpServletRequest request = request();
        request.setAttribute(ApiTokenAuthenticationFilter.PAT_REQUEST_ATTRIBUTE, Boolean.TRUE);

        Optional<AuditActor> actor = resolver.resolveCurrentActor();

        assertThat(actor).contains(new AuditActor(
            USER_ID,
            "alice",
            AuditAuthenticationType.PAT
        ));
    }

    @Test
    void returnsEmptyWithoutAuthenticatedPrincipal() {
        RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(new MockHttpServletRequest()));

        assertThat(resolver.resolveCurrentActor()).isEmpty();
    }

    @Test
    void returnsEmptyWithoutRequestContext() {
        authenticate();

        assertThat(resolver.resolveCurrentActor()).isEmpty();
    }

    private void authenticate() {
        AuthenticatedUserPrincipal principal =
            new AuthenticatedUserPrincipal(USER_ID, "alice", "alice@example.test", 0);
        SecurityContextHolder.getContext().setAuthentication(
            UsernamePasswordAuthenticationToken.authenticated(principal, null, List.of())
        );
    }

    private MockHttpServletRequest request() {
        MockHttpServletRequest request = new MockHttpServletRequest();
        RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(request));
        return request;
    }
}
