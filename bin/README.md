# Alixar Scripts Documentation

This directory contains shell scripts to automate testing, code styling, and static analysis tasks. These scripts are designed to run commands inside the Docker container `alixar_php`, ensuring consistency with the development and CI environments.

## Docker Scripts

### `docker_start.sh`
*   **Purpose:** Starts the Alixar project containers in detached mode.

### `docker_stop.sh`
*   **Purpose:** Stops the running containers for Alixar.

### `run_migrations.sh`
*   **Purpose:** Runs database migrations and seeders inside the `alixar_php` container.

---

## Quality Assurance Scripts

### `check_standards.sh`
*   **Tool:** `phpcs` (PHP Code Sniffer)
*   **Purpose:** Reports coding standard violations (PSR-12) in `src` and `Tests`.

### `static_analysis.sh`
*   **Tools:** `phpstan` and `psalm`
*   **Purpose:** Detects bugs and type inconsistencies early by analyzing code structure.

### `test.sh`
*   **Tool:** `phpunit`
*   **Purpose:** Executes the application's Unit and Feature tests.

### `api_test.sh` & `api_compare.sh`
*   **Tool:** Bruno (`npx @usebruno/cli`) & Docker Compose
*   **Purpose:** Tests the new Hexagonal API compatibility against Dolibarr Legacy in parallel.

### `test_clean_install.php`
*   **Purpose:** Development utility to test bootstrapping the ERP tables and defaults from absolute zero.
