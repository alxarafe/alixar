package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import es.alxarafe.alixar.authentication.application.AuthenticationErrorCode;
import es.alxarafe.alixar.authentication.application.PasswordHasher;
import es.alxarafe.alixar.authentication.application.UserRepository;
import es.alxarafe.alixar.authentication.domain.User;
import java.net.CookieManager;
import java.net.CookiePolicy;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.time.Instant;
import java.util.UUID;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.test.annotation.DirtiesContext;

import static org.assertj.core.api.Assertions.assertThat;

/** Exercises the servlet container's real error dispatch, which MockMvc does not perform. */
@Import(AuthenticationTestConfig.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_CLASS)
class AuthHttpStatusTest {

    private static final UUID USER_ID = UUID.fromString("8f796219-e501-44e8-a4ab-4c014821ba58");
    private static final String PASSWORD = "correct-test-password";
    private static final String CSRF_COOKIE_NAME = "XSRF-TOKEN";
    private static final String CSRF_HEADER_NAME = "X-XSRF-TOKEN";
    private static final String ERROR_PATH = "/error";
    private static final String UNKNOWN_PATH = "/unmapped-security-status-test";
    private static final Duration REQUEST_TIMEOUT = Duration.ofSeconds(10);

    @LocalServerPort
    private int port;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordHasher passwordHasher;

    private CookieManager cookies;
    private HttpClient client;

    @BeforeEach
    void setup() {
        Instant now = Instant.parse("2026-10-17T10:00:00Z");
        ((AuthenticationTestConfig.TestUserRepository) userRepository).replaceWith(
            new User(USER_ID, "alice", "alice@example.test", passwordHasher.hash(PASSWORD), true, 0, now, now)
        );
        cookies = new CookieManager(null, CookiePolicy.ACCEPT_ALL);
        client = HttpClient.newBuilder().cookieHandler(cookies).connectTimeout(REQUEST_TIMEOUT).build();
    }

    @AfterEach
    void closeClient() {
        client.close();
    }

    @Test
    void login_withoutCsrfCookieOrHeader_returnsForbiddenOverHttp() throws Exception {
        assertThat(login(PASSWORD, null).statusCode()).isEqualTo(HttpStatus.FORBIDDEN.value());
    }

    @Test
    void login_withCookieButWithoutCsrfHeader_returnsForbiddenOverHttp() throws Exception {
        primeCsrf();
        assertThat(login(PASSWORD, null).statusCode()).isEqualTo(HttpStatus.FORBIDDEN.value());
    }

    @Test
    void login_withMismatchedCsrfHeader_returnsForbiddenOverHttp() throws Exception {
        primeCsrf();
        assertThat(login(PASSWORD, "incorrect-csrf-token").statusCode()).isEqualTo(HttpStatus.FORBIDDEN.value());
    }

    @Test
    void login_withValidCsrfAndInvalidCredentials_remainsUnauthorized() throws Exception {
        String csrf = primeCsrf();
        HttpResponse<String> response = login("wrong-password", csrf);
        assertThat(response.statusCode()).isEqualTo(HttpStatus.UNAUTHORIZED.value());
        assertThat(response.body()).contains(AuthenticationErrorCode.AUTH_INVALID_CREDENTIALS.name());
    }

    @Test
    void me_withoutSession_remainsUnauthorized() throws Exception {
        assertThat(get(AuthenticationEndpoints.ME_PATH).statusCode()).isEqualTo(HttpStatus.UNAUTHORIZED.value());
    }

    @Test
    void authenticatedUser_withoutPermission_remainsForbidden() throws Exception {
        authenticate();
        assertThat(get(AdminUserEndpoints.BASE_PATH).statusCode()).isEqualTo(HttpStatus.FORBIDDEN.value());
    }

    @Test
    void authenticatedUser_onUnmappedRoute_isStillDenied() throws Exception {
        authenticate();
        assertThat(get(UNKNOWN_PATH).statusCode()).isEqualTo(HttpStatus.FORBIDDEN.value());
    }

    @Test
    void directAnonymousRequest_toErrorPath_isStillDenied() throws Exception {
        assertThat(get(ERROR_PATH).statusCode()).isEqualTo(HttpStatus.UNAUTHORIZED.value());
    }

    private void authenticate() throws Exception {
        String csrf = primeCsrf();
        assertThat(login(PASSWORD, csrf).statusCode()).isEqualTo(HttpStatus.OK.value());
        assertThat(get(AuthenticationEndpoints.ME_PATH).statusCode()).isEqualTo(HttpStatus.OK.value());
    }

    private String primeCsrf() throws Exception {
        assertThat(get(AuthenticationEndpoints.ME_PATH).statusCode()).isEqualTo(HttpStatus.UNAUTHORIZED.value());
        return cookies.getCookieStore().getCookies().stream()
            .filter(cookie -> cookie.getName().equals(CSRF_COOKIE_NAME))
            .findFirst().orElseThrow().getValue();
    }

    private HttpResponse<String> login(String password, String csrf) throws Exception {
        HttpRequest.Builder request = request(AuthenticationEndpoints.LOGIN_PATH)
            .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
            .POST(HttpRequest.BodyPublishers.ofString(
                "{\"identifier\":\"alice\",\"password\":\"" + password + "\"}"
            ));
        if (csrf != null) {
            request.header(CSRF_HEADER_NAME, csrf);
        }
        return client.send(request.build(), HttpResponse.BodyHandlers.ofString());
    }

    private HttpResponse<String> get(String path) throws Exception {
        return client.send(request(path).GET().build(), HttpResponse.BodyHandlers.ofString());
    }

    private HttpRequest.Builder request(String path) {
        return HttpRequest.newBuilder(URI.create("http://127.0.0.1:" + port + path))
            .timeout(REQUEST_TIMEOUT)
            .header(HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON_VALUE);
    }
}
