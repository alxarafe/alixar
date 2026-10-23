package es.alxarafe.alixar.authentication.infrastructure.security;

import es.alxarafe.alixar.audit.api.AuditEndpoints;
import es.alxarafe.alixar.authentication.api.AdminUserEndpoints;
import es.alxarafe.alixar.authentication.api.AuthenticationEndpoints;
import es.alxarafe.alixar.authentication.api.UserEndpoints;
import jakarta.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import org.springframework.http.HttpMethod;

/**
 * Classifies a request into a stable, non-identifying audit resource family.
 *
 * <p>Only static route families are returned. Path variables, query strings,
 * headers and request bodies are never part of the classification.</p>
 */
public class HttpAuditResourceFamilyClassifier {

    private static final Set<String> KNOWN_METHODS = Set.of(
        HttpMethod.GET.name(),
        HttpMethod.HEAD.name(),
        HttpMethod.POST.name(),
        HttpMethod.PUT.name(),
        HttpMethod.PATCH.name(),
        HttpMethod.DELETE.name(),
        HttpMethod.OPTIONS.name(),
        HttpMethod.TRACE.name()
    );

    private static final List<String> FAMILIES = List.of(
        UserEndpoints.API_TOKENS_PATH,
        UserEndpoints.PASSWORD_PATH,
        UserEndpoints.ME_PATH,
        AuthenticationEndpoints.ME_PATH,
        AdminUserEndpoints.BASE_PATH,
        AdminUserEndpoints.ROLES_BASE_PATH,
        AdminUserEndpoints.PERMISSIONS_BASE_PATH,
        AuditEndpoints.BASE_PATH,
        AuditEndpoints.CONFIGURATION_PATH
    );

    public Optional<String> classify(HttpServletRequest request) {
        Objects.requireNonNull(request, "request");
        String method = request.getMethod();
        if (method == null || !KNOWN_METHODS.contains(method)) {
            return Optional.empty();
        }

        String path = applicationPath(request);
        for (String family : FAMILIES) {
            if (path.equals(family) || path.startsWith(family + "/")) {
                return Optional.of(method + " " + family);
            }
        }
        return Optional.empty();
    }

    private String applicationPath(HttpServletRequest request) {
        String uri = request.getRequestURI();
        if (uri == null) {
            return "";
        }
        String contextPath = request.getContextPath();
        if (contextPath != null && !contextPath.isEmpty() && uri.startsWith(contextPath)) {
            uri = uri.substring(contextPath.length());
        }
        return withoutPathParameters(uri);
    }

    private String withoutPathParameters(String path) {
        if (path.indexOf(';') < 0) {
            return path;
        }
        String[] segments = path.split("/", -1);
        for (int index = 0; index < segments.length; index++) {
            int separator = segments[index].indexOf(';');
            if (separator >= 0) {
                segments[index] = segments[index].substring(0, separator);
            }
        }
        return String.join("/", segments);
    }
}
