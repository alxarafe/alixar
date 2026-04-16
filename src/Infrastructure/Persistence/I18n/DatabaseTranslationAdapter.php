<?php

declare(strict_types=1);

namespace Core\Infrastructure\Persistence\I18n;

use Core\Domain\I18n\TranslationRepositoryInterface;

/**
 * Database + YAML hybrid translation adapter.
 *
 * Strategy:
 * 1. YAML files are the canonical source of translations (shipped with plugins).
 * 2. YAML translations are imported into the `translations` DB table via bulkImport().
 * 3. Users can override individual translations via the DB (save()).
 * 4. At runtime, all translations are read from the DB (single source of truth).
 *
 * The YAML import is done during plugin bootstrap or migration, not at runtime.
 */
final class DatabaseTranslationAdapter implements TranslationRepositoryInterface
{
    public function __construct(
        private readonly \PDO $pdo,
    ) {
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function loadByLocale(string $locale): array
    {
        $stmt = $this->pdo->prepare("
            SELECT `group`, `key`, value
            FROM translations
            WHERE locale = :locale
            ORDER BY `group`, `key`
        ");
        $stmt->execute(['locale' => $locale]);

        $translations = [];
        while ($row = $stmt->fetch()) {
            // Build full key: 'group.key' (e.g., 'core.login_success')
            $fullKey = $row['group'] . '.' . $row['key'];
            $translations[$fullKey] = $row['value'];
        }

        return $translations;
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function loadByLocaleAndGroup(string $locale, string $group): array
    {
        $stmt = $this->pdo->prepare("
            SELECT `key`, value
            FROM translations
            WHERE locale = :locale AND `group` = :group
            ORDER BY `key`
        ");
        $stmt->execute(['locale' => $locale, 'group' => $group]);

        $translations = [];
        while ($row = $stmt->fetch()) {
            $translations[$row['key']] = $row['value'];
        }

        return $translations;
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function getAvailableLocales(): array
    {
        $stmt = $this->pdo->query('SELECT DISTINCT locale FROM translations ORDER BY locale');

        return $stmt->fetchAll(\PDO::FETCH_COLUMN) ?: [];
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function save(string $locale, string $group, string $key, string $value): void
    {
        $stmt = $this->pdo->prepare("
            INSERT INTO translations (locale, `group`, `key`, value)
            VALUES (:locale, :group, :key, :value)
            ON DUPLICATE KEY UPDATE value = :value2
        ");
        $stmt->execute([
            'locale' => $locale,
            'group'  => $group,
            'key'    => $key,
            'value'  => $value,
            'value2' => $value,
        ]);
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function bulkImport(string $locale, string $group, array $translations): void
    {
        if (empty($translations)) {
            return;
        }

        $stmt = $this->pdo->prepare("
            INSERT INTO translations (locale, `group`, `key`, value)
            VALUES (:locale, :group, :key, :value)
            ON DUPLICATE KEY UPDATE value = VALUES(value)
        ");

        foreach ($translations as $key => $value) {
            $stmt->execute([
                'locale' => $locale,
                'group'  => $group,
                'key'    => $key,
                'value'  => $value,
            ]);
        }
    }

    /**
     * Import translations from a YAML file into the database.
     *
     * Expected YAML structure:
     *   login_success: "Login successful"
     *   login_failed: "Invalid credentials"
     *
     * @param string $yamlFile Absolute path to the YAML file
     * @param string $locale   Target locale (e.g., 'en')
     * @param string $group    Translation group (e.g., 'core')
     * @return int Number of translations imported
     */
    public function importFromYaml(string $yamlFile, string $locale, string $group): int
    {
        if (!file_exists($yamlFile)) {
            return 0;
        }

        $content = file_get_contents($yamlFile);
        if ($content === false) {
            return 0;
        }

        // Simple YAML parser for flat key:value files (no nested structures)
        $translations = $this->parseSimpleYaml($content);

        if (empty($translations)) {
            return 0;
        }

        $this->bulkImport($locale, $group, $translations);

        return count($translations);
    }

    /**
     * Parse a simple flat YAML file (key: value pairs only).
     *
     * Handles:
     * - key: value
     * - key: "value with spaces"
     * - key: 'value with quotes'
     * - # comments
     * - empty lines
     *
     * Does NOT handle nested structures, arrays, or multi-line values.
     *
     * @return array<string, string>
     */
    private function parseSimpleYaml(string $content): array
    {
        $result = [];
        $lines = explode("\n", $content);

        foreach ($lines as $line) {
            $line = trim($line);

            // Skip empty lines and comments
            if ($line === '' || str_starts_with($line, '#')) {
                continue;
            }

            // Match key: value
            $colonPos = strpos($line, ':');
            if ($colonPos === false) {
                continue;
            }

            $key = trim(substr($line, 0, $colonPos));
            $value = trim(substr($line, $colonPos + 1));

            // Remove surrounding quotes
            if (
                (str_starts_with($value, '"') && str_ends_with($value, '"')) ||
                (str_starts_with($value, "'") && str_ends_with($value, "'"))
            ) {
                $value = substr($value, 1, -1);
            }

            if ($key !== '') {
                $result[$key] = $value;
            }
        }

        return $result;
    }
}
