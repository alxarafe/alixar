<?php

declare(strict_types=1);

namespace Core\Domain\I18n;

/**
 * Port (driving) — Contract for the translation service.
 *
 * The domain defines WHAT translation capabilities are needed.
 * Application and infrastructure layers provide the HOW.
 *
 * Supports:
 * - Parameterized translations: translate('greeting', ['name' => 'Ana']) → "Hola, Ana"
 * - Locale switching at runtime
 * - Discovery of available locales
 */
interface TranslatorInterface
{
    /**
     * Translate a key with optional parameter replacement.
     *
     * Keys use dot notation: 'core.auth.login_success'
     * Parameters are replaced: ':name' → $params['name']
     *
     * If no translation is found, the key itself is returned.
     *
     * @param string      $key    Dot-notation key (e.g., 'core.auth.login_success')
     * @param array<string, string> $params Replacement parameters
     * @param string|null $locale Override locale for this call (null = use current)
     * @return string The translated (or fallback) string
     */
    public function translate(string $key, array $params = [], ?string $locale = null): string;

    /**
     * Set the active locale.
     *
     * @param string $locale ISO locale code (e.g., 'es', 'en', 'fr')
     */
    public function setLocale(string $locale): void;

    /**
     * Get the currently active locale.
     */
    public function getLocale(): string;

    /**
     * Get all available locales.
     *
     * @return string[] e.g., ['es', 'en', 'fr']
     */
    public function getAvailableLocales(): array;

    /**
     * Get all translations for a locale, optionally filtered by group.
     *
     * @param string      $locale The locale to fetch
     * @param string|null $group  Optional group filter (e.g., 'core', 'crm')
     * @return array<string, string> Map of [key => translated_value]
     */
    public function getAll(string $locale, ?string $group = null): array;
}
