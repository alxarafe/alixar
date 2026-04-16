<?php

declare(strict_types=1);

namespace Core\Application\I18n;

use Core\Domain\I18n\TranslationRepositoryInterface;
use Core\Domain\I18n\TranslatorInterface;

/**
 * Application service — Core translator with caching and fallback chain.
 *
 * Features:
 * - In-memory cache per locale (lazy-loaded on first access)
 * - Fallback chain: es_ES → es → en (always falls back to English)
 * - Parameter replacement: ':name' → $params['name']
 * - Thread-safe: each request gets its own instance
 */
final class CoreTranslator implements TranslatorInterface
{
    private string $locale = 'en';

    /**
     * In-memory cache: [locale => [full_key => value]]
     *
     * @var array<string, array<string, string>>
     */
    private array $cache = [];

    /**
     * @param TranslationRepositoryInterface $repository The translation data source
     * @param string $defaultLocale Default locale if none is set
     */
    public function __construct(
        private readonly TranslationRepositoryInterface $repository,
        string $defaultLocale = 'en',
    ) {
        $this->locale = $defaultLocale;
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function translate(string $key, array $params = [], ?string $locale = null): string
    {
        $targetLocale = $locale ?? $this->locale;

        // Try the exact locale first, then fallback chain
        foreach ($this->buildFallbackChain($targetLocale) as $fallback) {
            $translations = $this->loadLocale($fallback);

            if (isset($translations[$key])) {
                return $this->replaceParams($translations[$key], $params);
            }
        }

        // No translation found — return the key itself
        return $key;
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function setLocale(string $locale): void
    {
        $this->locale = $locale;
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function getLocale(): string
    {
        return $this->locale;
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function getAvailableLocales(): array
    {
        return $this->repository->getAvailableLocales();
    }

    /**
     * @inheritDoc
     */
    #[\Override]
    public function getAll(string $locale, ?string $group = null): array
    {
        if ($group !== null) {
            return $this->repository->loadByLocaleAndGroup($locale, $group);
        }

        return $this->loadLocale($locale);
    }

    /**
     * Clear the in-memory cache (useful for testing or after imports).
     */
    public function clearCache(): void
    {
        $this->cache = [];
    }

    // ── Private Helpers ──────────────────────────────────────

    /**
     * Load all translations for a locale into the cache.
     *
     * @return array<string, string>
     */
    private function loadLocale(string $locale): array
    {
        if (!isset($this->cache[$locale])) {
            $this->cache[$locale] = $this->repository->loadByLocale($locale);
        }

        return $this->cache[$locale];
    }

    /**
     * Build a fallback chain for a locale.
     *
     * Examples:
     * - 'es_ES' → ['es_ES', 'es', 'en']
     * - 'fr'    → ['fr', 'en']
     * - 'en'    → ['en']
     *
     * @return string[]
     */
    private function buildFallbackChain(string $locale): array
    {
        $chain = [$locale];

        // If locale has a region (e.g., 'es_ES'), add the base language
        if (str_contains($locale, '_')) {
            $base = explode('_', $locale)[0];
            if ($base !== $locale) {
                $chain[] = $base;
            }
        }

        // Always fall back to English as last resort
        if (!in_array('en', $chain, true)) {
            $chain[] = 'en';
        }

        return $chain;
    }

    /**
     * Replace :param placeholders in a translation string.
     *
     * @param string $text   The translation with :param placeholders
     * @param array<string, string> $params Key-value pairs for replacement
     */
    private function replaceParams(string $text, array $params): string
    {
        if (empty($params)) {
            return $text;
        }

        $replacements = [];
        foreach ($params as $key => $value) {
            $replacements[':' . $key] = $value;
        }

        return strtr($text, $replacements);
    }
}
