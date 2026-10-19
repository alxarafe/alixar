# Authentication

## Current scope

ALIXAR-DEV-003A provides the initial authentication foundation for web clients
such as Solucar. It stores Alixar-owned security identities in PostgreSQL and
authenticates them through a server-side HTTP session managed by Spring
Security.

ALIXAR-DEV-003B adds password recovery on top of that foundation: constant-time
forgot/reset endpoints, single-use hashed reset tokens, credential-version based
session revocation, and email delivery of the reset link through a replaceable
application port.

A user has a stable UUID, a unique username, a unique email address, an
adaptive password hash, an enabled flag, and creation/update timestamps.
Username and email comparisons and uniqueness checks are case-insensitive.
The UUID, not either login identifier, is the internal identity.

User is a security identity. It is not linked to Contact and does not depend on
the Contact model or Dolibarr.

## HTTP contract

### `POST /api/auth/login`

Requires the `XSRF-TOKEN` cookie value in the `X-XSRF-TOKEN` header and accepts:

```json
{
  "identifier": "alice@example.test",
  "password": "provided-at-runtime"
}
```

`identifier` may be either username or email. A successful response is `200`
and creates the authenticated session:

```json
{
  "id": "8f796219-e501-44e8-a4ab-4c014821ba58",
  "username": "alice",
  "email": "alice@example.test"
}
```

Unknown identifiers, incorrect passwords, disabled users, and ambiguous
cross-identifier matches all return the same `401` error with code
`AUTH_INVALID_CREDENTIALS`.

### `GET /api/auth/me`

Returns the same explicit identity DTO for the current authenticated session.
It returns `401` without an authenticated session. Password hashes, enabled
state, timestamps, and security internals are never returned.

### `POST /api/auth/logout`

Requires a valid CSRF cookie/header pair. It invalidates the HTTP session when
present, clears the security context and CSRF token, expires the session cookie,
and returns `204`. The operation is intentionally idempotent for an anonymous
client with a valid CSRF token.

### `POST /api/auth/password/forgot`

Requires a valid CSRF cookie/header pair and accepts `{"email": "..."}`. It
always returns `202 Accepted` with an empty body, whether or not the email
belongs to an enabled user, to avoid disclosing account existence. For an
enabled matching user it invalidates previous pending tokens, creates a new
single-use token, and asks the configured `PasswordResetNotifier` to deliver the
reset link.

### `POST /api/auth/password/reset`

Requires a valid CSRF cookie/header pair and accepts
`{"token": "...", "password": "..."}`. A successful response is `200` with an
empty body. Invalid, expired, already-used, or superseded tokens return `400`
with code `AUTH_INVALID_RESET_TOKEN`; a password shorter than 12 characters
returns `400` with code `AUTH_INVALID_PASSWORD`. On success it changes the
password hash, increments `credentials_version`, marks the token as used and
invalidates any other pending tokens in one transaction.

## Browser session policy

- Authentication is stored in the servlet container's process-local session.
- The session identifier changes during login to prevent session fixation.
- Session tracking uses cookies only; URL rewriting is disabled.
- The session cookie is `HttpOnly` and `SameSite=Lax`.
- The default inactivity timeout is 30 minutes and is configurable with
  `ALIXAR_SESSION_TIMEOUT`.
- `ALIXAR_SESSION_COOKIE_SECURE` defaults to `false` for the supported local
  HTTP workflow. It must be set to `true` when Alixar is served through HTTPS.
- CSRF protection uses Spring Security's Angular-compatible `XSRF-TOKEN`
  cookie and `X-XSRF-TOKEN` request header.

Any safe request, including `GET /health`, issues an `XSRF-TOKEN` cookie. The
client must send that cookie value as `X-XSRF-TOKEN` for login and logout.
Authentication and logout rotate or clear the token, so the client must make a
subsequent safe request before its next unsafe request.

No CORS policy is defined in this iteration. A cross-origin Solucar deployment
requires an explicit future decision covering trusted origins, credentials and
cookie attributes.

## Password recovery

Reset tokens are 256-bit random values, Base64 URL-safe encoded. Only the
SHA-256 hash is stored, tokens expire after 30 minutes, and a token is
single-use. Requesting a new token invalidates previous pending tokens.

The reset link is built from `ALIXAR_PASSWORD_RESET_FRONTEND_URL` concatenated
with `?token=<raw-token>`. No frontend is hardcoded; the base URL must be
provided by deployment configuration.

Delivery goes through the `PasswordResetNotifier` application port. When a
standard Spring mail host is configured (`SPRING_MAIL_HOST` or `spring.mail.host`,
plus optional `SPRING_MAIL_PORT`, `SPRING_MAIL_USERNAME`, `SPRING_MAIL_PASSWORD`,
`SPRING_MAIL_AUTH`, `SPRING_MAIL_STARTTLS_ENABLE`), the SMTP adapter sends the
email. The sender address is `ALIXAR_PASSWORD_RESET_MAIL_FROM`, falling back to
`spring.mail.username`. When no mail host is configured the application uses a
no-op notifier that logs a warning and sends nothing; this is the default for
local development and tests. Credentials are never hardcoded and must come from
external configuration.

`forgot` and `reset` are atomic. In `reset`, changing the password hash,
incrementing `credentials_version`, marking the token as used and invalidating
other pending tokens happen in a single transaction. In `forgot`, invalidating
previous tokens and creating the new token happen in a single transaction; if
creation fails the previous token is not left invalidated. The transaction
boundary is declared by the infrastructure facade
`TransactionalPasswordRecovery`, not by the HTTP controller. jOOQ repositories
participate in the same Spring transaction through Boot's
`TransactionAwareDataSourceProxy`.

## Session revocation

`credentials_version` is stored per user and embedded in the authenticated
principal. `CredentialsVersionCheckFilter` runs on every request, including
`permitAll` endpoints. For an authenticated principal it reloads the user and, if
the user no longer exists, is disabled, or its `credentials_version` changed, it
clears the security context and invalidates the HTTP session. The affected
request then proceeds unauthenticated: `GET /api/auth/me` returns `401`, while
the public `forgot`/`reset` endpoints still run and a fresh `login` creates a new
session. Changing a password through `reset` increments `credentials_version`, so
sessions created before the reset stop being valid.

## Bootstrap user

Development and testing can create one initial user by setting all three
variables before the first startup:

```bash
export ALIXAR_BOOTSTRAP_USERNAME='alice'
export ALIXAR_BOOTSTRAP_EMAIL='alice@example.test'
export ALIXAR_BOOTSTRAP_PASSWORD='choose-a-temporary-secret'
./bin/up
```

The password is hashed immediately with Spring Security's delegating adaptive
password encoder, which writes bcrypt hashes in this version. No plaintext or
fixed bootstrap password is stored in a migration or source file.

> **Development/testing mechanism only.** Supplying `ALIXAR_BOOTSTRAP_PASSWORD`
> through an environment variable places the plaintext secret in the process
> environment, where it can be observed through `docker inspect`, the container
> runtime, or host process inspection. It is intended exclusively to seed one
> initial user in local development and automated testing. It is **not** a
> production secret-management recommendation, and it does not replace a
> dedicated secret manager. Production credential provisioning requires a
> separate, explicit decision that is outside the scope of ALIXAR-DEV-003A; no
> Docker Secrets, Vault, or other secret manager is implemented here.

All three variables must be supplied together. The initializer creates the
user only when neither identifier exists. Restarting with the same username
and email does not reset its password; conflicting identifiers fail startup.
Remove the variables after the initial user has been created. This mechanism
is not registration or user administration. Bootstrap must run with a single
application instance; concurrent initial startup can make one instance fail on
the database uniqueness constraint.

## Current public access

`/health`, the login endpoint, the `password/forgot` and `password/reset`
endpoints, and the existing Contact endpoints remain anonymous. Contact remains
public solely to preserve its established contract and the real Dolibarr
compatibility check during this authentication foundation. Its existing POST is
temporarily excluded from CSRF protection.
Protecting migrated business capabilities is an authorization decision for a
later iteration.

### Tracked debt: CSRF exclusion for Contact

The temporary CSRF exclusion covers the whole `/api/contacts/**` pattern, not
only its current POST method. It is **pending/trackable debt**, not a target
state: it currently weakens CSRF protection for any Contact request and would
also exempt future mutating Contact methods (`PUT`, `PATCH`, `DELETE`) once they
are introduced. Removing the exclusion requires Contact to obtain a CSRF
token/header pair, which is a change to the Contact contract and must be
decided explicitly in a dedicated iteration. ALIXAR-DEV-003A intentionally
leaves the Contact contract unchanged.

## Mandatory pending decision

The session-based authentication implemented in ALIXAR-DEV-003A provides the
initial mechanism for web clients such as Solucar, but it is not the definitive
authentication contract for the Alixar API. Authentication for independent API
consumers remains pending definition and implementation.

The future iteration must evaluate the appropriate independent-API mechanism
without assuming JWT. Its evaluation may include opaque bearer tokens, JWT,
OAuth 2.x, OpenID Connect, machine-to-machine authentication, and credential
revocation and renewal.

Roles, permissions and functional authorization are also not implemented.
Rate limiting and password-attempt policy remain pending security decisions.
Disabling a user or deleting it now invalidates its existing session on the next
request through `CredentialsVersionCheckFilter`, but that check requires a
database read per authenticated request and executes on public endpoints too.
