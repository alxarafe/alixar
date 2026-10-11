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
- a stable Spring Boot release officially compatible with Java 25;
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

## Domain boundary

The future domain of Alixar must not depend directly on:

- Spring
- HTTP
- JSON
- jOOQ
- Flyway
- Docker
- Dolibarr
- llx_*

No domain objects are created in this bootstrap to demonstrate this rule.
The rule applies when domain code is introduced in future tasks.

## Legacy boundary

`alixar-legacy` and Dolibarr are references of behaviour and knowledge.

Do not copy code from either of them.

Do not import packages or files from `alixar-legacy`.

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

## Safe repository changes

Preserve unrelated user changes. Inspect the working tree before editing. Use
`apply_patch` for repository edits.

Do not use destructive commands such as broad recursive deletion, hard resets,
or checkout-based overwrites unless the human explicitly requests the exact
operation. Resolve targets before destructive actions and prefer recoverable
operations where practical.

Do not expose secrets, credentials, tokens, or private data in source code,
logs, documentation, commits, or final reports.

## Language and documentation

Comments and versioned public documentation are written in English.

Detailed Spanish working documentation may be kept under the local `private/`
directory. That directory must remain excluded by `.gitignore` and must not be
included in Docker build contexts or deployed artifacts. It is not a security
boundary and must not be used to store secrets.

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