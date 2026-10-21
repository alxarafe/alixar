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

ALIXAR-DEV-003C adds self-service management of the authenticated identity: the
user can change its own username and its own password. At that stage,
administration of other users, roles, permissions, and email change were
explicitly out of scope.

ALIXAR-DEV-003D adds authentication for independent API consumers through
opaque Personal Access Tokens (PATs) presented as
`Authorization: Bearer <token>`. The existing browser session mechanism is
unchanged: Solucar keeps using `JSESSIONID` plus CSRF, while API clients use a
Bearer token. Both mechanisms represent the same `User`. JWT, OAuth 2.x,
OpenID Connect, refresh tokens, PAT scopes and machine-to-machine grants are
not implemented.

ALIXAR-DEV-003E adds role-based authorization. Authentication answers who the
caller is; authorization answers what the caller may do. Roles are
administrative groupings of permissions, permissions belong exclusively to
roles, and effective permissions are the union of the permissions of the user's
current roles. There are no per-user permission overrides and no explicit
`DENY`. An enabled user can authenticate with zero roles. `users.manage` is the
first permission and `system-admin` is the first built-in role.

ALIXAR-DEV-003F adds administrative user management over that RBAC foundation.
The iteration provides endpoints for listing, searching and inspecting users
and for reading the role catalogue, plus creation of disabled users,
administrative username changes, enablement changes, password resets and full
role replacement. The user-management endpoints require `users.manage`,
independently of the authentication mechanism.

ALIXAR-DEV-003G begins role administration. Its first delivered slice adds the
`roles.manage` permission, built-in role metadata, a restrictive foreign key for
assigned roles and a read-only permission catalogue. T2 adds role detail and
creation, and T3 adds role rename, permission replacement and deletion of
unassigned custom roles.

ALIXAR-DEV-003H T1.4a adds the `audit.read` permission for querying audit
events. The read endpoint accepts session or Bearer authentication and applies
the same deny-by-default authorization model as the other administrative
endpoints. Reading audit events does not append audit events in this slice.

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

Returns the same explicit identity DTO for the current authenticated identity.
It accepts either a valid browser session or a valid
`Authorization: Bearer <token>` header, and returns `401` when neither is valid.
The response does not reveal which mechanism was used. Password hashes, enabled
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

## Self-service profile management

ALIXAR-DEV-003C lets an authenticated user manage only its own security
identity. No endpoint in this iteration creates, lists, edits, enables,
disables or administratively resets another user, and role or permission
checks are not involved. Every request acts on the identity of the
authenticated principal and never on another user's identifier.

### `PATCH /api/users/me`

Requires an authenticated session and a valid CSRF cookie/header pair, and
accepts:

```json
{
  "username": "nueva-identidad"
}
```

A successful response is `200` with the same explicit identity DTO returned by
`GET /api/auth/me`:

```json
{
  "id": "8f796219-e501-44e8-a4ab-4c014821ba58",
  "username": "nueva-identidad",
  "email": "alice@example.test"
}
```

Only the authenticated user's own username is modified. The `id` is immutable
and the `email`, `enabled` flag and `credentials_version` are never changed or
exposed. The username is normalized to stripped lowercase, matching existing
username handling, and uniqueness remains case-insensitive. A blank username
returns `400` with code `VALIDATION_REQUIRED`; a username already taken by
another user returns `409` with code `AUTH_USERNAME_ALREADY_EXISTS`. `GET
/api/auth/me` reflects the new username immediately because the current
session principal is refreshed after the change. Changing the email is **not**
part of this iteration.

### `POST /api/users/me/password`

Requires an authenticated session and a valid CSRF cookie/header pair, and
accepts:

```json
{
  "currentPassword": "contraseña-actual",
  "newPassword": "nueva-contraseña-segura"
}
```

A successful response is `204` with an empty body. The current password is
verified against the stored hash; the new password must be at least 12
characters and has no artificial uppercase, digit or symbol rules. An incorrect
current password returns `400` with code `AUTH_INVALID_CURRENT_PASSWORD`; a new
password shorter than the minimum returns `400` with code
`AUTH_INVALID_PASSWORD`. Password hashes, `credentials_version` and other
security internals are never returned.

A successful change is atomic: it updates the password hash, increments
`credentials_version` and invalidates all pending password reset tokens for the
user within a single transaction. The transaction boundary is declared by the
infrastructure facade `TransactionalUserSelfService`, not by the HTTP
controller.

### Current session after a password change

The user who just changed its password is not logged out. After the persistent
change succeeds, the controller rebuilds the authenticated principal with the
new `credentials_version` and stores it in the current session's security
context. The next request on that session stays authenticated.

Sessions created before the change, and not the current one, keep the previous
`credentials_version` and are revoked by `CredentialsVersionCheckFilter` on
their next request, exactly like a password reset. This reuses the existing
`credentials_version` mechanism: there is no central session store and no
`JSESSIONID` enumeration.

Changing the username does not revoke sessions and does not increment
`credentials_version`.

## Personal access tokens for API consumers

ALIXAR-DEV-003D introduces self-service Personal Access Tokens. A PAT is an
opaque secret that an authenticated user creates for an independent API client
(for example, a local CI job). A PAT represents the user that created it and
has exactly the same capabilities that user would have through an authenticated
session. With ALIXAR-DEV-003E, those capabilities are the user's current
effective permissions through its roles. PAT scopes and machine-to-machine
identities are **not** implemented.

### `POST /api/users/me/api-tokens`

Requires an authenticated identity (session with a valid CSRF cookie/header
pair, or a valid Bearer token) and accepts:

```json
{
  "name": "ci-local",
  "expiresAt": "2026-11-20T10:00:00Z"
}
```

`name` is mandatory and cannot be blank. `expiresAt` is an absolute ISO-8601
instant, is mandatory, must be in the future and cannot exceed 365 days from
creation. A successful creation returns `201`:

```json
{
  "id": "0f4c1a7e-0d1f-4a8b-9c1d-2e3f4a5b6c7d",
  "name": "ci-local",
  "createdAt": "2026-10-20T10:00:00Z",
  "expiresAt": "2026-11-20T10:00:00Z",
  "token": "alx_pat_<opaque-secret>"
}
```

The `token` field is the only place where the clear-text secret is ever
returned. It is never stored and never appears again. The token is generated
from 256 bits obtained through `SecureRandom`, Base64 URL-safe encoded without
padding and prefixed with `alx_pat_`. Only `SHA-256(token)` is persisted; PATs
do not use `PasswordEncoder`.

The user identifier always comes from the authenticated principal, never from
the request body. Creation is atomic through the infrastructure facade
`TransactionalApiTokenService`: the hash and metadata are persisted before the
clear token is returned.

### `GET /api/users/me/api-tokens`

Requires an authenticated identity and lists only the caller's tokens. It
returns metadata only:

```json
[
  {
    "id": "0f4c1a7e-0d1f-4a8b-9c1d-2e3f4a5b6c7d",
    "name": "ci-local",
    "createdAt": "2026-10-20T10:00:00Z",
    "expiresAt": "2026-11-20T10:00:00Z",
    "lastUsedAt": null,
    "revokedAt": null
  }
]
```

Clear tokens, token hashes and `credentials_version` are never exposed.

### `DELETE /api/users/me/api-tokens/{id}`

Requires an authenticated identity and revokes one of the caller's own tokens.
It returns `204` and does not delete the row: `revoked_at` is set for
traceability. A token that is already revoked returns `204` as well
(idempotent). A token that does not exist or belongs to another user is reported
as `404` with code `AUTH_API_TOKEN_NOT_FOUND`; no user can list, create or
revoke a token for another user, and no administrative API token endpoint
exists.

### Bearer authentication

API clients present the clear token in:

```text
Authorization: Bearer alx_pat_<opaque-secret>
```

Authentication succeeds only when all of the following hold:

```text
token hash exists
AND revoked_at IS NULL
AND expires_at > now
AND user exists
AND user.enabled = true
AND token.credentials_version == user.credentials_version
```

Any failure produces the same external result: `401 Unauthorized`. The response
does not distinguish a non-existent, malformed, expired, revoked, orphaned,
disabled-user or stale-version token.

A valid Bearer request does not depend on `JSESSIONID`, does not create an HTTP
session, and does not require CSRF, because the credential is explicitly
presented in the `Authorization` header. When a request contains an explicit
Bearer credential, it takes precedence over any session authentication. Invalid
Bearer credentials are not silently downgraded to a session identity.

The Bearer adapter is encapsulated in infrastructure security. Domain and
application layers do not depend on Spring Security. The authenticated principal
is the existing `AuthenticatedUserPrincipal` (`id`, `username`, `email`,
`credentialsVersion`); no parallel identity model is introduced.

On each successful Bearer authentication, `last_used_at` is updated. This is an
auxiliary write: a failure while updating it is logged without tokens or
hashes, and it does not turn a valid authentication into a `401`. The update
only happens after the token and user have been validated.

### CSRF coexistence

CSRF protection is not disabled globally. Requests authenticated by the session
cookie continue to require the `XSRF-TOKEN` cookie and `X-XSRF-TOKEN` header.
Requests that present an `Authorization: Bearer ...` header are exempt from CSRF
because browsers do not attach that header automatically; this exemption does
not apply to session-only requests. The existing Contact CSRF debt is unchanged.

### `credentials_version` and PAT revocation

The current `credentials_version` is captured when a PAT is created and stored
in `authentication_api_token.credentials_version`. A password reset or a
voluntary password change increments the user's `credentials_version`, so all
PATs created before that change stop authenticating on their next use. No bulk
token update or token traversal is required. Explicit `revoked_at` revocation
invalidates a token immediately as well.

## Authorization (RBAC)

ALIXAR-DEV-003E adds role-based authorization. Authentication and authorization
are independent. An enabled user can authenticate with zero roles and can use
all existing self-service operations: login, `GET /api/auth/me`, changing its
own username and password, and creating, listing or revoking its own PATs.
Roles are not required to identify a user and there is no synthetic
"authenticated" role.

### Model

```text
User
  └── Roles
        └── Permissions
```

- `authentication_user_role` stores user-to-role assignments. Its role foreign
  key uses `ON DELETE RESTRICT`, so PostgreSQL prevents deleting a role that is
  still assigned to any user.
- `authentication_role_permission` stores role-to-permission assignments.
- `authentication_permission` is the stable permission catalogue.
- `authentication_role.built_in` distinguishes roles with a controlled lifecycle
  from custom roles. It defaults to `false` and is `true` for `system-admin`.
- Permissions are assigned exclusively to roles. There is no
  `authentication_user_permission` table, no user-level grant or deny, and no
  override for a particular user.
- Effective permissions are exactly the union of the permissions of all the
  user's roles. Absence means denied; there is no explicit `DENY` and no
  precedence between effects.
- Changing a role's permissions affects every user of that role.
- A user cannot add or remove a permission for itself or another user outside
  its roles.

### Permissions and roles

The initial catalogue contains:

| Permission | Meaning |
|------------|---------|
| `users.manage` | Administrative capability over users (ALIXAR-DEV-003F) |
| `roles.manage` | Manage roles and their permission assignments (ALIXAR-DEV-003G) |
| `audit.read` | Read audit events (ALIXAR-DEV-003H T1.4a) |

The built-in role `system-admin` contains all three permissions. The role name
and code are stable identifiers, but application code authorizes by permission,
not by role name. No role is special in authorization: `system-admin` is simply
a role whose permissions are maintained by migrations. The `built_in` flag marks
roles whose lifecycle is reserved for controlled provisioning; it is not an
authorization bypass. There is no mandatory basic role.

### Effective permissions per request

Effective permissions are resolved from persistence on every authenticated
request, after the identity and `credentials_version` checks and before Spring
Security authorizes the request. `EffectivePermissionsFilter` loads the current
permission codes and replaces the authenticated principal's authorities with
the corresponding `GrantedAuthority` values.

Consequences:

- assigning a role affects the next request;
- removing a role affects the next request;
- changing a role's name or permissions affects the next request of every user
  of that role, with no logout, session invalidation, PAT revocation or
  `credentials_version` increment;
- a caller can revoke its own effective `roles.manage`; the current operation
  still completes and the next administrative request is denied;
- session and Bearer authentication produce exactly the same permissions;
- PATs do not contain scopes; a PAT represents the user and authorization uses
  the user's current roles.

`credentials_version` remains a credential-change mechanism only. Role and
permission changes never modify it.

### Deny by default and HTTP results

The security policy remains explicit:

```text
public endpoint      → permitAll
self-service         → authenticated
privileged endpoint  → concrete permission
anything else        → denyAll
```

The administrative namespace is split by capability:

| Path | Required authority |
|------|--------------------|
| `/api/admin/users/**` | `users.manage` |
| `GET /api/admin/roles` | `users.manage` or `roles.manage` |
| Any other `/api/admin/roles/**` method | `roles.manage` |
| `/api/admin/permissions` | `roles.manage` |
| `GET /api/admin/audit-events` | `audit.read` |
| `GET /api/admin/audit-events/verification` | `audit.read` |

The GET rule for the role catalogue is method-specific and is evaluated before
the general role namespace rule. Results:

| Caller | Result |
|--------|--------|
| Not authenticated | `401 Unauthorized` |
| Authenticated without a required permission | `403 Forbidden` |
| Authenticated with the required permission | The request reaches the operation |

This applies identically to session and Bearer authentication. An invalid
Bearer credential clears the session context and does not fall back to the
session identity, so it cannot bypass authorization.

Method security is enabled. Operations can be protected with
`@PreAuthorize("hasAuthority('users.manage')")` or
`@PreAuthorize("hasAuthority('roles.manage')")`; the stable permission
constants are `PermissionCodes.USERS_MANAGE`, `PermissionCodes.ROLES_MANAGE` and
`PermissionCodes.AUDIT_READ`.

### Bootstrap and the first administrator

Creating the bootstrap user does not make it an administrator. The built-in
role is granted only when explicitly requested with
`ALIXAR_BOOTSTRAP_SYSTEM_ADMIN=true`. The flag defaults to `false`, only assigns
`system-admin` to the bootstrap user, never creates a user by itself, is
idempotent, and has no effect when the bootstrap identity is not configured.
The create endpoint assigns only roles explicitly supplied in `roleCodes`; it
never adds `system-admin` automatically. See [Bootstrap user](#bootstrap-user).

### Administrative management

ALIXAR-DEV-003F exposes the user operations and the role catalogue.
ALIXAR-DEV-003G T1 adds the read-only permission catalogue, T2 adds role detail
and creation, and T3 adds role rename, permission replacement and deletion.

| Method and path | Result |
|-----------------|--------|
| `GET /api/admin/users` | Paginated user summaries |
| `GET /api/admin/users/{id}` | One user's safe fields and role codes |
| `GET /api/admin/roles` | Role catalogue with permission codes |
| `GET /api/admin/roles/{code}` | One role with permission codes |
| `POST /api/admin/roles` | Creates a custom role |
| `PATCH /api/admin/roles/{code}` | Renames a custom role |
| `PUT /api/admin/roles/{code}/permissions` | Replaces a role's permissions |
| `DELETE /api/admin/roles/{code}` | Deletes an unassigned custom role |
| `GET /api/admin/permissions` | Read-only permission catalogue |
| `GET /api/admin/audit-events` | Chain-scoped audit event list |
| `GET /api/admin/audit-events/verification` | Audit chain verification report |
| `POST /api/admin/users` | Creates a disabled user |
| `PATCH /api/admin/users/{id}` | Changes the username only |
| `PATCH /api/admin/users/{id}/enabled` | Enables or disables a user |
| `POST /api/admin/users/{id}/password-reset` | Replaces a user's password |
| `PUT /api/admin/users/{id}/roles` | Replaces all roles for a user |

`GET /api/admin/permissions` returns the read-only permission catalogue ordered
by `code`. Each item contains only `code` and `description`; database identifiers
and internal metadata are not exposed. It requires `roles.manage` for both
session and Bearer authentication. Permission creation, modification and
deletion are not exposed by the API.

`GET /api/admin/audit-events` and `GET /api/admin/audit-events/verification`
require `audit.read`. Their pagination, filters, verification response and
contracts are documented in [Audit](audit.md).

Role responses contain only `code`, `name`, `builtIn` and `permissionCodes`.
`GET /api/admin/roles` returns roles ordered by `code`, with permission codes
ordered deterministically. `GET /api/admin/roles/{code}` returns the same shape
and `404` with `ADMIN_ROLE_NOT_FOUND` when the code does not exist.

`POST /api/admin/roles` accepts:

```json
{
  "code": "operations-team",
  "name": "Operations team",
  "permissionCodes": ["users.manage"]
}
```

`code` is stripped and lower-cased, must be at most 100 characters, and must use
lowercase letters, digits and single hyphens between segments. `name` is stripped
and must not be blank. `permissionCodes` is optional; absent or `null` means no
permissions. Each permission code is stripped, lower-cased, de-duplicated and
sorted. All permission codes are validated against the catalogue before any
write, so an unknown permission aborts the whole operation without creating the
role. The role and its permissions are inserted in one transaction, and the
response is `201` with `Location: /api/admin/roles/{code}`.

Created roles are always custom (`builtIn=false`) and are never assigned to any
user automatically. A code that already exists, including a concurrent creation
that reaches PostgreSQL first, returns `409` with
`ADMIN_ROLE_ALREADY_EXISTS`. An unknown permission returns `404` with
`ADMIN_PERMISSION_NOT_FOUND`; invalid code syntax returns `400` with
`ADMIN_INVALID_ROLE_CODE`, and a blank name returns `400` with
`ADMIN_INVALID_ROLE_NAME`.

`PATCH /api/admin/roles/{code}` accepts only `name`:

```json
{ "name": "Renamed team" }
```

`name` is stripped and must not be blank; `code`, `builtIn`, permissions and
user assignments remain unchanged. `404` with `ADMIN_ROLE_NOT_FOUND` is returned
for an unknown role, and a built-in role returns `409` with
`ADMIN_BUILT_IN_ROLE_IMMUTABLE`.

`PUT /api/admin/roles/{code}/permissions` replaces the complete permission set:

```json
{ "permissionCodes": ["users.manage", "roles.manage"] }
```

`permissionCodes` is required and may be `[]` to leave the custom role without
permissions. Codes are stripped, lower-cased, de-duplicated and sorted, and all
of them are validated against the catalogue before any write, so an unknown
permission rolls the operation back and keeps the previous permissions. A
built-in role returns `409` with `ADMIN_BUILT_IN_ROLE_IMMUTABLE`. Replacing
permissions never assigns the role to users and never changes `credentials_version`,
sessions, PATs, passwords, enablement or reset tokens.

`DELETE /api/admin/roles/{code}` deletes an unassigned custom role and returns
`204`. A built-in role returns `409` with `ADMIN_BUILT_IN_ROLE_IMMUTABLE`. A role
still assigned to any user returns `409` with `ADMIN_ROLE_IN_USE`; assignments
are never deleted as a side effect. Role permission rows are removed by cascade
when the role is deleted.

`GET /api/admin/users` accepts:

- `page`: zero-based page, default `0`, must not be negative;
- `size`: page size, default `20`, between `1` and `100`;
- `q`: case-insensitive substring of username or email;
- `enabled`: `true` or `false` to filter by enablement.

Results are ordered by username and then id for stable pagination. The page
response contains `items`, `page`, `size` and `total`. Invalid pagination
returns `400` with code `ADMIN_INVALID_PAGINATION` and a `field` property.
Unknown users return `404` with `ADMIN_USER_NOT_FOUND`.

`POST /api/admin/users` accepts `username`, `email`, `password` and optional
`roleCodes`. Username and email are normalized to lower case and compared
case-insensitively. The password must satisfy `PasswordPolicy`. Absent or empty
`roleCodes` creates a user without roles. Every supplied role code is validated
before insertion; an unknown role aborts the whole operation. The user and its
role assignments are written in one transaction, and a failure in any assignment
rolls the user back. PostgreSQL remains the final authority for uniqueness: a
concurrent duplicate is translated to `409 Conflict`. A new user is always
created with `enabled=false`; `enabled` is not part of the create contract.
`system-admin` is assigned only when explicitly present in `roleCodes`, never
automatically. Invalid passwords or malformed email return `400`, duplicate
username or email returns `409`, and an unknown role returns `404` with
`ADMIN_ROLE_NOT_FOUND`.

`PATCH /api/admin/users/{id}` changes only the username, with the same
normalization and case-insensitive uniqueness rules. It does not change the
email, enablement, roles, password, reset tokens, sessions or PATs, and it does
not increment `credentials_version`, because a username change is not a
credential change. It returns the updated safe representation, `404` for an
unknown user, `409` for a duplicate username and `400` for invalid input.

`PATCH /api/admin/users/{id}/enabled` accepts `enabled` as a boolean. Disabling
an enabled user sets `enabled=false`, increments `credentials_version` and
invalidates pending password-reset tokens in one transaction. Disabling an
already disabled user is idempotent and does not increment the version again.
Enabling a user sets `enabled=true` without incrementing `credentials_version`;
enabling an already enabled user is idempotent. Sessions and PATs issued before
a disable remain invalid after a later enable. The endpoint returns the updated
safe representation, `404` for an unknown user and `400` for invalid input.

Administrators may disable their own account. The disabling request succeeds,
but the session or PAT used for it is rejected on the next request. There is no
self-preservation bypass, no last-administrator rule and no special
`system-admin` protection. A possible administrator lockout is an accepted
operational consequence.

`POST /api/admin/users/{id}/password-reset` accepts `newPassword` and requires
no current password. It enforces `PasswordPolicy`, stores the new hash,
increments `credentials_version` and invalidates all pending password-reset
tokens in one transaction. It can target the administrator's own account. Prior
sessions and PATs are rejected on their next request. It does not change the
username, email, enablement, roles, permissions or PAT records. It returns `204`
on success, `404` for an unknown user and `400` for invalid input.

`PUT /api/admin/users/{id}/roles` accepts `roleCodes` and performs a full
replacement, not an incremental assignment. An empty list removes every role.
Role codes are stripped and duplicate codes are normalized before assignment.
All codes are validated before any change; an unknown role aborts the operation
without modifying the current roles, and the whole replacement runs in one
transaction. It returns the updated safe representation, `404` for an unknown
user or role and `400` for invalid input. It does not change
`credentials_version`, password, email, username or enablement, and it does not
invalidate sessions or revoke PATs. It never adds `system-admin` automatically.
Effective permissions change on the next authenticated request for both session
and Bearer authentication. Administrators may replace their own roles,
including removing their own `users.manage`; the request succeeds, the next
administrative request returns `403`, while general authentication,
`GET /api/auth/me` and self-service remain available. There is no
last-administrator protection and the resulting lockout is accepted.

All administrative responses exclude password hashes, reset tokens, API tokens
and other secrets. Bearer authentication still updates the presented PAT's
`last_used_at`, as before. Every `/api/admin/users/**` endpoint requires
`users.manage`; `GET /api/admin/roles` accepts `users.manage` or `roles.manage`;
and `GET /api/admin/permissions` requires `roles.manage`, for both session and
Bearer authentication.

### Role groups (future decision)

Role groups are **not** implemented and no group tables exist. If introduced
later:

```text
RoleGroup
  └── Roles
```

A group only groups roles. It has no permissions of its own, cannot modify the
permissions of its roles, and a user may receive roles directly or indirectly
through groups. Effective permissions would still come exclusively from roles.

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

Development and testing can create one initial user by setting the three
identity variables before the first startup:

```bash
export ALIXAR_BOOTSTRAP_USERNAME='alice'
export ALIXAR_BOOTSTRAP_EMAIL='alice@example.test'
export ALIXAR_BOOTSTRAP_PASSWORD='choose-a-temporary-secret'
export ALIXAR_BOOTSTRAP_SYSTEM_ADMIN='false'   # true grants system-admin explicitly
./bin/up
```

The bootstrap user is **not** an administrator by default. Setting
`ALIXAR_BOOTSTRAP_SYSTEM_ADMIN=true` assigns the built-in `system-admin` role to
that user, idempotently. The flag does not create a user by itself and has no
effect when the three identity variables are absent.

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

The three identity variables must be supplied together. The initializer creates
the user only when neither identifier exists. Restarting with the same username
and email does not reset its password; conflicting identifiers fail startup.
Repeating the run with `ALIXAR_BOOTSTRAP_SYSTEM_ADMIN=true` ensures the
`system-admin` assignment without duplicating it. Remove the variables after the
initial user has been created. This mechanism is not registration or user
administration. Bootstrap must run with a single application instance;
concurrent initial startup can make one instance fail on the database
uniqueness constraint.

## Current public access

`/health`, the login endpoint, the `password/forgot` and `password/reset`
endpoints, and the existing Contact endpoints remain anonymous. The
`GET /api/auth/me`, `PATCH /api/users/me`, `POST /api/users/me/password` and
the `/api/users/me/api-tokens` endpoints require an authenticated identity:
either a valid session or a valid Bearer token. `/api/auth/me` works with both
mechanisms. The `/api/admin/users/**` namespace requires `users.manage`;
`GET /api/admin/roles` accepts `users.manage` or `roles.manage`; role detail,
role creation and the permission catalogue require `roles.manage`. Contact
remains public solely to preserve its established contract
and the real Dolibarr compatibility check during this authentication foundation.
Its existing POST is temporarily excluded from CSRF protection. Protecting
migrated business capabilities is an authorization decision for a later
iteration.

### Tracked debt: CSRF exclusion for Contact

The temporary CSRF exclusion covers the whole `/api/contacts/**` pattern, not
only its current POST method. It is **pending/trackable debt**, not a target
state: it currently weakens CSRF protection for any Contact request and would
also exempt future mutating Contact methods (`PUT`, `PATCH`, `DELETE`) once they
are introduced. Removing the exclusion requires Contact to obtain a CSRF
token/header pair, which is a change to the Contact contract and must be
decided explicitly in a dedicated iteration. ALIXAR-DEV-003A intentionally
leaves the Contact contract unchanged.

## Future API authentication evolution

ALIXAR-DEV-003D chooses opaque Bearer Personal Access Tokens for independent
API consumers. The following are explicitly **not** implemented in this
iteration:

- JWT;
- OAuth 2.x Authorization Server or grants;
- OAuth Authorization Code + PKCE;
- OpenID Connect;
- refresh tokens, client registration or client credentials;
- machine-to-machine identities;
- PAT scopes;
- administration of other users' tokens.

With ALIXAR-DEV-003E, a PAT grants the current effective permissions of the
owning user through its roles. It does not contain scopes or a permission
snapshot, so role changes affect the next request made with the same PAT. OAuth
Authorization Code + PKCE is a possible future evolution when delegated or
third-party clients exist; machine-to-machine authentication also remains
pending. This iteration does not commit to JWT: the future strategy is still an
open decision.

Rate limiting and password-attempt policy remain pending security decisions.
Disabling a user or deleting it invalidates existing sessions on the next
request through `CredentialsVersionCheckFilter` and invalidates PATs through the
`enabled` check and the user foreign key.

Two capabilities are intentionally deferred to later iterations:

- **Email change.** The email is currently the password-recovery channel.
  Changing it without verifying the new address would weaken account recovery,
  so it is pending a dedicated email-verification iteration.
- **Role groups.** Grouping roles is a possible future evolution; no group
  model or tables exist in ALIXAR-DEV-003E.
