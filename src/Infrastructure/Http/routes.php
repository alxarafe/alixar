<?php

/**
 * Core REST routes — registered by the Core bootstrap.
 *
 * All routes are prefixed with /api/ and organized by resource.
 * Authentication is handled by AuthMiddleware (registered globally).
 * Login and i18n locale endpoints are public.
 *
 * @param \Core\Infrastructure\Http\Api\Controller\AuthApiController $authController
 * @param \Core\Infrastructure\Http\Api\Controller\UserApiController $userController
 * @param \Core\Infrastructure\Http\Api\Controller\RoleApiController $roleController
 * @param \Core\Infrastructure\Http\Api\Controller\I18nApiController|null $i18nController
 */

declare(strict_types=1);

return function (
    \Core\Infrastructure\Http\Api\Controller\AuthApiController $authController,
    \Core\Infrastructure\Http\Api\Controller\UserApiController $userController,
    \Core\Infrastructure\Http\Api\Controller\RoleApiController $roleController,
    ?\Core\Infrastructure\Http\Api\Controller\I18nApiController $i18nController = null,
): void {
    // ── Authentication (public: login) ──────────────────────────
    \Flight::route('POST /api/auth/login', [$authController, 'login']);
    \Flight::route('POST /api/auth/logout', [$authController, 'logout']);
    \Flight::route('GET  /api/auth/me', [$authController, 'me']);

    // ── Users ───────────────────────────────────────────────────
    \Flight::route('GET    /api/users', [$userController, 'index']);
    \Flight::route('POST   /api/users', [$userController, 'store']);
    \Flight::route('GET    /api/users/@id:[0-9]+', [$userController, 'show']);
    \Flight::route('PUT    /api/users/@id:[0-9]+', [$userController, 'update']);
    \Flight::route('DELETE /api/users/@id:[0-9]+', [$userController, 'destroy']);
    \Flight::route('PUT    /api/users/@id:[0-9]+/roles', [$userController, 'assignRoles']);

    // ── Roles ───────────────────────────────────────────────────
    \Flight::route('GET    /api/roles', [$roleController, 'index']);
    \Flight::route('POST   /api/roles', [$roleController, 'store']);
    \Flight::route('GET    /api/roles/@id:[0-9]+', [$roleController, 'show']);
    \Flight::route('PUT    /api/roles/@id:[0-9]+', [$roleController, 'update']);
    \Flight::route('DELETE /api/roles/@id:[0-9]+', [$roleController, 'destroy']);
    \Flight::route('PUT    /api/roles/@id:[0-9]+/permissions', [$roleController, 'syncPermissions']);

    // ── Permissions ─────────────────────────────────────────────
    \Flight::route('GET /api/permissions', [$roleController, 'listPermissions']);
    \Flight::route('GET /api/permissions/@plugin', [$roleController, 'listPermissionsByPlugin']);

    // ── i18n (public: locale endpoints needed before login) ─────
    if ($i18nController !== null) {
        \Flight::route('GET /api/i18n/locales', [$i18nController, 'listLocales']);
        \Flight::route('GET /api/i18n/@locale', [$i18nController, 'getByLocale']);
        \Flight::route('GET /api/i18n/@locale/@group', [$i18nController, 'getByLocaleAndGroup']);
        \Flight::route('PUT /api/i18n/@locale/@group/@key', [$i18nController, 'update']);
    }
};
