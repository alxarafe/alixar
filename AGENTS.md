# Alixar Agent Working Agreement

This document defines the project-specific working rules for AI agents and
human collaborators working in this repository.

System, platform, security, and higher-priority instructions always take
precedence over this document. User instructions for the current task take
precedence over this document when they are more specific or more recent.

## Project scope

**Alixar is the backend and business authority of the Alixar ERP.**

Solucar is the Angular web frontend.

Alixar:
- owns business rules;
- provides the canonical API;
- manages persistence;
- handles authentication and authorization.

Alixar must not:
- depend on Solucar;
- reproduce frontend concerns;
- know UI implementation details.

## Mandatory task lifecycle

Work must be split into small, independently verifiable vertical tasks. Do not
implement a large modification as one task.

For every task, follow this order:

1. Study the repository and the relevant official sources.
2. Define one small task with one verifiable outcome.
3. State acceptance criteria.
4. Identify risks and pending decisions.
5. Obtain explicit human approval.
6. Implement only the approved task.
7. Verify it with the applicable tests.
8. Run post-change checks when applicable.
9. Present evidence.
10. Review the diff to confirm it contains only the approved task's changes.
11. Review documentation impact and update relevant docs when needed.
12. Close the completed, validated task with a local atomic commit.
13. Obtain approval before starting another task.

Explicit task approval also authorizes staging and its final local commit once
implementation, applicable validations and scope review are complete. No second
authorization is required solely for that commit. Use one atomic commit, or the
minimum number of atomic commits the task's structure requires, with clear
messages consistent with repository conventions.

Do not commit incomplete tasks or tasks with failed validations. Correct and
revalidate any defect found before closing a task. Never start the next task
with uncommitted changes from the previous one; if a task exceptionally starts
with another task's pending changes, separate their commits correctly before
continuing. Preserve all other repository-specific rules.

Task approval does not authorize push, PR creation, merge, tag, release,
publication or deployment; each requires separate express authorization.

If a request combines independent capabilities, stop and split it into ordered
tasks. Request approval for the first task only. Do not silently expand the
scope of an approved task.

## Decision status

Do not attribute undocumented decisions to the team. Clearly label decisions as
one of:

- **Approved**: explicitly accepted by the human collaborator.
- **Proposed**: suggested but not yet accepted.
- **Pending**: requires information or a decision before implementation.
- **Discarded**: considered and rejected.
- **Antecedent**: historical context that must not be treated as a current
  decision.

A technology mentioned in a proposal, prototype, recommendation, or previous
conversation is not a final decision unless explicitly approved.

## Technology and dependency policy

The current technical baseline is a proposal unless separately approved:

- Java 25 LTS;
- Spring Boot 4.1.1 (stable, compatible with Java 25);
- Maven and Maven Wrapper;
- Docker and Docker Compose as the only supported project environment.

Before introducing or changing a framework, library, image, or tool:

1. Consult current official documentation.
2. Check compatibility with the project baseline.
3. Check maintenance status.
4. Check licensing.
5. Record the exact version.
6. Explain why it is needed.
7. Request approval when it introduces a decision not already approved.

Do not replace Java 25 with another Java version without explicit approval. Do
not use milestone, release-candidate, snapshot, preview, or Docker `latest`
versions.

## Docker-only environment

Docker and Docker Compose are the only supported environment for building,
running, testing, and deploying the project.

The host may be expected to provide only Git, Docker, Docker Compose, and the
programming agent. Do not require host-installed Java, Maven, PostgreSQL,
Node.js, or other project dependencies.

Documented commands must run directly through Docker or Docker Compose, or
through versioned scripts that invoke Docker or Docker Compose.

Application images must:

- use a multi-stage build;
- separate build and runtime stages;
- contain only the required runtime contents;
- run as a non-privileged user;
- contain no secrets;
- contain neither source code nor Maven in the final image;
- provide a verifiable health check;
- use explicitly versioned and reproducibly pinned images.

Keep development, unit testing, integration testing, deployed API testing, and
local verified deployment as separate concerns and environments.

## Docker port policy

Application containers should keep conventional internal service ports, but
host ports must not be assumed to be available. Alixar uses container port 8080
and publishes it on host port 48081 by default, bound to loopback only. The host
port is configurable through `ALIXAR_JAVA_PORT`. Ephemeral verification and CI
should avoid fixed host ports when they are unnecessary; when host HTTP access
is required, dynamically assigned host ports should be preferred and discovered
programmatically. Infrastructure services such as PostgreSQL must not publish
host ports unless host access is explicitly required.

## Pragmatic hexagonal architecture

Alixar follows a pragmatic hexagonal architecture that **emerges from real use
cases**. Domain and application logic must not depend directly on Spring, Docker,
Flyway, PostgreSQL, HTTP, JSON, Dolibarr, or other infrastructure technologies.
Infrastructure should remain replaceable behind appropriate boundaries when actual
use cases require them. Controllers, persistence implementations, and external
integrations belong to adapters or infrastructure rather than business logic.

**Ports, adapters, repositories, services, domain types and package structures
exist only when a concrete capability needs them.** Hexagonal architecture is used
to keep business logic and external systems replaceable, not to produce visual
package symmetry.

Do not create speculative ports, adapters, repositories, domain entities,
services, or empty package structures before a real use case needs them. Do not
create architecture for visual package symmetry; avoid both framework-driven
domain design and unnecessary abstraction.

**Small duplication is preferable to a more complex abstraction when abstraction
would reduce clarity.**

## Validation-layer separation

Alixar has three complementary validation levels that must not be treated as
interchangeable:

- **`./bin/test`** — Deterministic application/component tests. Runs in Docker,
  uses controlled HTTP doubles. Proves internal logic correctness.

- **`./bin/check`** — Self-contained complete validation of Alixar itself. Builds
  image, runs tests, starts container, verifies `/health`, cleans up. Does not
  depend on any external reference system.

- **`./bin/check-reference`** — Real compatibility/integration verification
  against the sibling `dolibarr-reference` repository. Uses actual Dolibarr 24.0.1
  to prove the adapter works against observed legacy behavior.

A green `./bin/test` does not prove real Dolibarr compatibility.
A passing `./bin/check-reference` does not replace normal tests or CI.
Do not make `./bin/check` depend on the sibling reference repository.

## Dolibarr reference authority rule

`dolibarr-reference` is the authority for reproducible observed legacy behavior.

But:
- `dolibarr-reference` is **not** Alixar's domain model,
- `dolibarr-reference` is **not** Alixar's canonical API,
- `dolibarr-reference` is **not** an implementation dependency of the domain/application layers.

The transformation flow is:

```text
observed Dolibarr behavior
        ↓
explicit Alixar contract decision
        ↓
anti-corruption adapter
```

Never:

```text
Dolibarr Swagger/DTO
        ↓
copied Alixar API
```

Swagger and source inspection are evidence sources only.
Observed behavior wins over assumptions or incomplete documentation.
Legacy names such as `llx_*`, `fk_soc`, `socid`, `lastname` must remain confined
to the legacy boundary when needed.

## Verification requirements

Compilation alone does not complete a task. Run the applicable checks, which
may include:

1. compilation;
2. static analysis;
3. unit tests;
4. integration tests;
5. security tests;
6. final image build;
7. Docker Compose deployment;
8. health check;
9. post-deployment smoke test.

Report commands, results, relevant warnings, environment limitations, and
cleanup evidence. Do not claim a check that was not actually executed.

## Efficient validation execution

The full validation authority is unchanged. This section only changes how
wait-heavy checks are executed during agent-assisted work; it does not relax
whether required checks must pass.

During implementation, use the narrowest applicable validation first:

- focused unit tests;
- focused integration tests;
- feature/module-specific tests;
- repository-provided fast or scoped checks, when they actually exist;
- broader or full validation only when required.

Do not run a long-running repository-wide, integration, end-to-end, conformance,
build/deployment or full validation command inside an agent session merely to
wait for it when the developer or CI can execute it directly. Repeated polling
of long-running commands is specifically discouraged: it can trigger additional
agent turns that reprocess the existing repository and conversation context even
though the external process needs no reasoning, consuming model resources without
adding engineering value.

When a required complete validation is expected to take materially longer than
focused checks:

- normally provide the exact command for the developer or CI to execute;
- stop and wait for its result when that validation is required before task
  completion or commit;
- continue only once the actual result is known;
- never claim a validation passed unless its result was actually observed or
  provided.

Any validation currently required before task completion, commit, deployment or
publication remains required, and any missing or failed mandatory validation
remains blocking. This policy changes execution responsibility, not validation
authority.

When a long-running command genuinely must be executed by the agent, avoid
repeated polling, wait as efficiently as the available tooling permits, do not
repeatedly reread unchanged files, and do not rerun unchanged validations without
a concrete reason. Whether a validation is long-running depends on the repository
and the task; do not fix a duration threshold, and keep this policy model- and
tool-neutral.

For Alixar, the validation levels defined under *Validation-layer separation*
keep their exact meaning: `./bin/test` for deterministic application/component
tests, `./bin/check` as the complete local validation authority (mandatory
wherever this agreement already requires it), and `./bin/check-reference` for
real Dolibarr compatibility. Use the narrower tests for iterative implementation
work. Relatively expensive suites — `./bin/check`, `./bin/check-reference`,
persistence/Flyway/jOOQ integration, and Docker build/deployment checks — should
normally be executed by the developer or CI; when such a check is mandatory
before task completion or commit, require its actual successful result before
closing the task. Do not invent fast or scoped commands that do not exist.

## Safe repository changes

Preserve unrelated user changes. **Inspect staged, unstaged, and untracked
changes before editing.** Use focused patches for repository edits.

Do not use destructive commands such as broad recursive deletion, hard resets,
stash, checkout-based overwrites, or broad deletes unless the human explicitly
requests the exact operation. Resolve targets before destructive actions and
prefer recoverable operations where practical.

If an approved change cannot be isolated from unrelated user work, stop and
report the conflict.

Do not expose secrets, credentials, tokens, or private data in source code,
logs, documentation, commits, or final reports.

## Language and documentation

Comments and versioned public documentation are written in English.

Detailed Spanish working documentation may be kept under the local `private/`
directory. That directory must remain excluded by `.gitignore` and must not be
included in Docker build contexts or deployed artifacts. It is not a security
boundary and must not be used to store secrets.

## Public documentation policy

`README.md` is a **stable public landing page** for project purpose, high-level
capabilities, architecture and ecosystem relationships, essential quick start,
onboarding and configuration, principal limitations, verifiable badges, and
links to detailed documentation.

README is **NOT**:
- a changelog;
- a task history;
- an endpoint catalogue;
- a test inventory;
- a running list of completed slices.

Functional and technical detail belongs primarily under `docs/`.

**Every task must review documentation impact** after implementation, validation
and scope review, before the final local commit. If the change makes public
behavior, architecture, configuration, workflow, capability or limitations
materially false or incomplete, update the relevant documentation **within the
same task**. Do not modify docs merely to record that a review happened.

## Cross-repository documentation policy

Alixar participates in:
- `dolibarr-reference`
- `alxarafe/alixar`
- `alxarafe/solucar-web`

Cross-repository documentation synchronization is required only when a change
affects:
- shared policy;
- canonical API/contract expectations;
- architecture/ecosystem relationship;
- materially false information in another repository;
- a significant milestone genuinely visible across repositories.

Do not modify multiple repositories for every small feature.
Changes in each repository must remain separate commits/tasks.
Historical reports must remain historical and must not be rewritten to appear
current.

## Badge policy

Badges may represent only **real and verifiable facts**.

Distinguish at least:
- GitHub CI status;
- local Alixar validation (`./bin/check`);
- real `dolibarr-reference` compatibility check (`./bin/check-reference`);
- future full-stack Solucar → Alixar verification.

Never use a static green badge to imply a check that GitHub does not actually
execute continuously.
Badge links and workflow names must remain current.

## No magic literals

Any literal with meaningful **domain, contract, protocol, configuration, or
behavioral** semantics should have an explicit source of truth rather than being
scattered. This includes, where applicable:

- endpoint paths;
- HTTP headers;
- media types;
- status/error codes;
- configuration keys;
- environment-variable names;
- legacy integration header names;
- timeouts;
- limits;
- state names;
- regular expressions;
- database/schema identifiers with semantic meaning.

Preference order:
1. framework/platform constant or enum;
2. existing project/domain type or constant;
3. configuration;
4. narrowly scoped named constant.

Do not mechanically replace all literals. Explicitly allow incidental fixture
values, array indexes, loop counters, and obvious structural values to remain
inline. Do not create useless constants such as `ZERO`, `ONE`, `TRUE`.

During final scope review, inspect newly introduced meaningful literals.

## Engineering simplicity

Prefer simple, explicit and maintainable solutions.

Apply these principles:

- **KISS** — keep solutions as simple as the requirements allow.
- **DRY** — avoid duplicated logic and duplicated sources of truth.
- **YAGNI** — do not build abstractions, extension points or infrastructure without a concrete current need.
- **Occam's razor** — when several solutions satisfy the requirements equally well, prefer the one with fewer concepts, dependencies and moving parts.
- **Reuse before invention** — prefer existing mechanisms, conventions and components before introducing new ones.

Do not introduce layers, helpers, factories, interfaces, services or abstractions merely for architectural symmetry or possible future use.

Simplicity must not compromise correctness, security, performance, clarity, testability or contractual behavior.

When duplication is small and removing it would create a more complex abstraction, prefer the clearer solution over mechanically applying DRY.

## Internationalization (i18n)

### Human-readable text

User-facing localizable human-readable text must not be hardcoded in domain, application, controller, adapter or frontend-facing response logic when it belongs to i18n.

Use the project's standard i18n infrastructure (Spring `MessageSource`, Jakarta Validation, `ProblemDetail`).

### Do not translate stable technical identifiers

Do not translate:
- error codes;
- canonical API field names;
- enum/state identifiers;
- paths;
- media types;
- configuration keys;
- protocol/header names;
- database identifiers.

### Reusable parameterized messages

Prefer:
```text
validation.required + localized field name
```
over:
```text
one required-message key per field
```
when semantics are genuinely shared.

### Module ownership

Translations belong to the module or feature that owns the translated concept. Shared/core bundles contain only genuinely cross-module messages.

Message keys for module-owned concepts must be namespaced by the owning module/feature so modules can evolve, package or disappear independently without relying on a global monolithic translation catalogue.

### Standard mechanisms first

Explicitly require use of Jakarta Validation / Spring MessageSource and related standard facilities before introducing custom translation mechanisms.

### Final literal review

During final scope review, inspect newly introduced human-readable literals and verify whether they should use i18n.

Integrate this cleanly with the existing `No magic literals` policy rather than duplicating that entire section.

## Deployment authorization

Implementation approval permits implementation, validation, staging, and final
local atomic commit. It does **NOT** authorize:

- push
- PR creation
- merge
- tag
- release
- publication
- deployment

Deployment requires separate express authorization.
Post-deployment checks only apply when deployment itself has been authorized.

## Legacy boundary

`alixar-legacy` and Dolibarr are references for behavior and knowledge only.

Do not copy code from either of them.

Do not import packages or files from `alixar-legacy`.

## Domain boundary

The domain layer must not depend directly on:

- Spring
- HTTP
- JSON
- jOOQ
- Flyway
- Docker
- Dolibarr
- llx_* naming conventions

This rule applies when domain code is introduced in future tasks.