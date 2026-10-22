package es.alxarafe.alixar.authentication.infrastructure.security;

import org.junit.jupiter.api.Test;
import org.springframework.mock.web.MockHttpServletRequest;

import static org.assertj.core.api.Assertions.assertThat;

class HttpAuditResourceFamilyClassifierTest {

    private final HttpAuditResourceFamilyClassifier classifier =
        new HttpAuditResourceFamilyClassifier();

    @Test
    void classifiesExactKnownFamily() {
        var request = request("GET", "/api/admin/users");

        assertThat(classifier.classify(request)).contains("GET /api/admin/users");
    }

    @Test
    void classifiesKnownFamilyWithPathVariable() {
        var request = request("GET", "/api/admin/users/123");

        assertThat(classifier.classify(request)).contains("GET /api/admin/users");
    }

    @Test
    void doesNotClassifyPathWithoutSegmentBoundary() {
        var request = request("GET", "/api/admin/usersXYZ");

        assertThat(classifier.classify(request)).isEmpty();
    }

    @Test
    void ignoresQueryString() {
        var request = request("GET", "/api/admin/audit-events");
        request.setQueryString("actorUserId=8f796219-e501-44e8-a4ab-4c014821ba58");

        assertThat(classifier.classify(request)).contains("GET /api/admin/audit-events");
    }

    @Test
    void selectsMostSpecificFamilyFirst() {
        var request = request("GET", "/api/users/me/api-tokens/123");

        assertThat(classifier.classify(request)).contains("GET /api/users/me/api-tokens");
    }

    @Test
    void ignoresRoleCodeAndUuidPathSegments() {
        var request = request("PUT", "/api/admin/roles/system-admin/permissions");

        assertThat(classifier.classify(request)).contains("PUT /api/admin/roles");
    }

    @Test
    void ignoresUnknownPath() {
        var request = request("GET", "/foo/bar");

        assertThat(classifier.classify(request)).isEmpty();
    }

    @Test
    void ignoresUnknownMethod() {
        var request = request("CUSTOM", "/api/admin/users");

        assertThat(classifier.classify(request)).isEmpty();
    }

    @Test
    void ignoresPathParameters() {
        var request = request("GET", "/api/admin/users/123;jsessionid=abc");

        assertThat(classifier.classify(request)).contains("GET /api/admin/users");
    }

    @Test
    void ignoresContextPath() {
        var request = request("GET", "/alixar/api/admin/users/123");
        request.setContextPath("/alixar");

        assertThat(classifier.classify(request)).contains("GET /api/admin/users");
    }

    private MockHttpServletRequest request(String method, String path) {
        return new MockHttpServletRequest(method, path);
    }
}
