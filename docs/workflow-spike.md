# Workflow engine compatibility spike (ALIXAR-WF-001)

## Status

**Technical spike only. Not an approved production capability or dependency.**

Flowable OSS 8.0.0 is present exclusively in the test scope. It is not packaged
in the Alixar runtime image, is not enabled in normal tests, and does not change
the canonical API, authentication, authorization, audit, Flyway ownership or the
`public` PostgreSQL schema. Dolibarr remains the functional reference for any
future Workflow module.

## Scope

The spike answers whether Flowable OSS 8.0.0 can run against the current Alixar
technical baseline without contaminating the application:

| Element | Value |
|---------|-------|
| Flowable | 8.0.0 OSS, Apache-2.0 |
| Alixar baseline | Java 25, Spring Boot 4.1.1, Spring Framework 7.0.9 |
| Database | PostgreSQL 18.6 Alpine, isolated Compose project |
| Flowable schema | `flowable_spike`, controlled by the spike |
| Flowable DataSource | Dedicated Hikari pool; never Alixar's DataSource |
| Alixar schema | `public`, owned by Flyway V1-V13 |
| Production runtime | No Flowable artifacts |

The spike does **not** define a Workflow domain model, API, persistence adapter,
authorization model or migration strategy. Those require separate approval.

## Verified behaviour

`./bin/check-workflow` runs `FlowableCompatibilityIT` and
`FlowableIsolationIT` against an isolated PostgreSQL 18.6 service:

1. A BPMN process containing a start event, one user task and an end event is
   deployed from `src/test/resources/bpmn/alixar-wf-001.bpmn20.xml`.
2. A process instance starts, a pending task is found, and the task completes.
3. The process and task history contain completed records.
4. Flowable is stopped and restarted in a new application context. The pending
   task is still present, then completes, and the historic process/task end
   times are populated.
5. Flowable creates and uses its tables only in `flowable_spike`. The `public`
   schema keeps exactly the 14 Alixar tables and the 13 Flyway migrations.
6. A normal Alixar `@SpringBootTest` with Flowable on the test classpath contains
   no Flowable beans, no Flowable request handlers, the same
   `UserAuthenticationProvider`/`AuthenticationManager`, the same
   `SecurityFilterChain`, `ConfiguredAuditTrail`, and the same `/health`,
   `/api/contacts`, `/api/admin/users` security outcomes.
7. `./bin/test` and `./bin/check` remain green; `./bin/check` is unchanged and
   still verifies `PersistenceIT` against Alixar's own schema.

Observed on 2026-11-06:

- `./bin/check-workflow`: 2 tests, 0 failures.
- `./bin/check`: `PersistenceIT` 115 tests, 0 failures; `/health` passed.
- `./bin/test`: successful.

## Dependencies and licenses

Direct test dependencies:

| Artifact | Version | Scope | License |
|----------|---------|-------|---------|
| `org.flowable:flowable-spring-boot-starter-process` | 8.0.0 | test | Apache-2.0 |
| `org.flowable:flowable-spring-configurator` | 8.0.0 | test | Apache-2.0 |
| `org.flowable:flowable-app-engine-spring` | 8.0.0 | test | Apache-2.0 |

The explicit configurator and app-engine artifacts are required because the
Flowable 8.0.0 starter does not pull its optional
`flowable-spring-configurator`, and `ProcessEngineAutoConfiguration` links
`org.flowable.app.spring.SpringAppEngineConfiguration`. Without them the
auto-configuration context fails with `ClassNotFoundException`. This is a
Flowable starter packaging issue, not an Alixar production dependency change.

Key transitive artifacts include MyBatis 3.5.19 (Apache-2.0), Joda-Time 2.14.0
(Apache-2.0) and Angus Mail 2.0.5 (test-only). Flowable POMs do not declare an
individual license per module; the Flowable 8.0.0 root declares Apache v2.
Because every Flowable artifact is test-scoped, none is present in the runtime
image and no production distribution obligation is introduced by this spike.
A full transitive license audit is still required before any runtime adoption.

## Compatibility notes and risks

- **Boot generation gap**: Flowable 8.0.0 was built against Spring Boot 4.0.2 /
  Spring Framework 7.0.3; Alixar runs Boot 4.1.1 / Framework 7.0.9. The process
  engine lifecycle works in this spike, but that is not a guarantee for the
  complete Flowable feature set.
- **Dedicated DataSource is mandatory**: Flowable's database session sets the
  JDBC schema and does not restore it. Sharing Alixar's Hikari pool can leak
  `search_path` into jOOQ queries. The spike uses an independent pool and
  schema.
- **Schema creation**: `flowable.database-schema` does not create the schema.
  `flowable_spike` must exist before the engine starts. The spike resets it
  explicitly.
- **Schema updates**: `flowable.database-schema-update=true` is used only for
  this ephemeral test schema. A future production use would require an explicit,
  reviewed schema provisioning/upgrade mechanism. Flyway remains the owner of
  `public`; no V14 was added.
- **Security/IDM coupling**: `flowable-spring-security` is a non-optional
  transitive dependency. The spike disables Flowable process/app/CMMN/DMN/
  event-registry/IDM auto-configuration by default in test properties and never
  includes Flowable security auto-configuration. A future runtime integration
  must explicitly review identity and authorization ownership.
- **Jackson**: Flowable uses Jackson 3 by default in this setup. The conditional
  Jackson 2 path was not enabled; adding `spring-boot-jackson2` is not required.
- **Test-only boundary**: Flowable auto-configuration is disabled by default in
  `src/test/resources/application.properties`; only the isolated compatibility
  test enables the process engine.

## Recommendation

Do not adopt Flowable as a production dependency yet. The spike proves basic
lifecycle, restart persistence and schema isolation under the current baseline.
Before a Workflow module is approved, define:

1. the Alixar-owned workflow domain contract and use cases;
2. schema ownership, migration and upgrade responsibility;
3. identity, authorization and audit integration boundaries;
4. runtime dependency and transitive license review;
5. a production-grade PostgreSQL and operational model.

Until then, Flowable stays test-only and Dolibarr remains the functional
reference.
