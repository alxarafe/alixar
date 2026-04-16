<?php

declare(strict_types=1);

namespace Core\Domain\I18n;

/**
 * Port (driven) — Persistence contract for translations.
 *
 * Implementations can load from database, YAML files, or any other source.
 * The CoreTranslator uses this port to fetch translation data.
 */
interface TranslationRepositoryInterface
{
    /**
     * Load all translations for a locale.
     *
     * @param string $locale The locale to load (e.g., 'es', 'en')
     * @return array<string, string> Map of [full_key => value] where full_key = 'group.key'
     */
    public function loadByLocale(string $locale): array;

    /**
     * Load translations for a specific locale and group.
     *
     * @param string $locale The locale (e.g., 'es')
     * @param string $group  The group (e.g., 'core', 'crm.thirdparty')
     * @return array<string, string> Map of [key => value] (key without group prefix)
     */
    public function loadByLocaleAndGroup(string $locale, string $group): array;

    /**
     * Get all locales that have at least one translation.
     *
     * @return string[]
     */
    public function getAvailableLocales(): array;

    /**
     * Save or update a single translation.
     *
     * Used for user overrides of YAML-imported translations.
     *
     * @param string $locale The locale
     * @param string $group  The group
     * @param string $key    The key (without group prefix)
     * @param string $value  The translated value
     */
    public function save(string $locale, string $group, string $key, string $value): void;

    /**
     * Bulk import translations (e.g., from YAML files).
     *
     * Uses INSERT ... ON DUPLICATE KEY UPDATE to allow user overrides.
     *
     * @param string $locale The locale
     * @param string $group  The group
     * @param array<string, string> $translations Map of [key => value]
     */
    public function bulkImport(string $locale, string $group, array $translations): void;
}
