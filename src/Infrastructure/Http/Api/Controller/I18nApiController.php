<?php

declare(strict_types=1);

namespace Core\Infrastructure\Http\Api\Controller;

use Core\Domain\Auth\AuthorizationService;
use Core\Domain\I18n\TranslatorInterface;
use Core\Infrastructure\Persistence\I18n\DatabaseTranslationAdapter;

/**
 * REST controller for internationalization (i18n) endpoints.
 *
 * Endpoints:
 * - GET  /api/i18n/:locale          — Get all translations for a locale
 * - GET  /api/i18n/:locale/:group   — Get translations for a locale + group
 * - GET  /api/i18n/locales          — List available locales
 * - PUT  /api/i18n/:locale/:group/:key — Override a single translation
 */
final class I18nApiController
{
    public function __construct(
        private readonly TranslatorInterface $translator,
        private readonly DatabaseTranslationAdapter $translationAdapter,
        private readonly AuthorizationService $authzService,
    ) {
    }

    /**
     * GET /api/i18n/locales
     *
     * Returns the list of available locales.
     */
    public function listLocales(): void
    {
        \Flight::json([
            'data' => $this->translator->getAvailableLocales(),
        ]);
    }

    /**
     * GET /api/i18n/:locale
     *
     * Returns all translations for a given locale.
     * Public endpoint — no auth required (frontend needs translations before login).
     */
    public function getByLocale(string $locale): void
    {
        $translations = $this->translator->getAll($locale);

        \Flight::json([
            'locale' => $locale,
            'count'  => count($translations),
            'data'   => $translations,
        ]);
    }

    /**
     * GET /api/i18n/:locale/:group
     *
     * Returns translations for a specific locale and group.
     */
    public function getByLocaleAndGroup(string $locale, string $group): void
    {
        $translations = $this->translator->getAll($locale, $group);

        \Flight::json([
            'locale' => $locale,
            'group'  => $group,
            'count'  => count($translations),
            'data'   => $translations,
        ]);
    }

    /**
     * PUT /api/i18n/:locale/:group/:key
     *
     * Override a single translation value.
     * Body: { "value": "New translation text" }
     *
     * Requires: core.translation.update
     */
    public function update(string $locale, string $group, string $key): void
    {
        $this->requirePermission('core.translation.update');

        $body = \Flight::request()->data->getData();

        if (!isset($body['value']) || !is_string($body['value'])) {
            \Flight::json([
                'error'   => 'validation_error',
                'message' => "Field 'value' is required and must be a string.",
            ], 422);
            return;
        }

        $this->translationAdapter->save($locale, $group, $key, $body['value']);

        \Flight::json([
            'message' => 'Translation updated successfully.',
            'locale'  => $locale,
            'group'   => $group,
            'key'     => $key,
            'value'   => $body['value'],
        ]);
    }

    // ── Helpers ──────────────────────────────────────────────

    private function requirePermission(string $permissionKey): void
    {
        $user = \Flight::get('auth.user');

        if ($user === null || !$this->authzService->can($user, $permissionKey)) {
            \Flight::json([
                'error'   => 'authorization_error',
                'message' => 'Insufficient permissions.',
            ], 403);
            \Flight::stop();
        }
    }
}
