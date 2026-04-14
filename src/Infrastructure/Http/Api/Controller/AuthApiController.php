<?php

declare(strict_types=1);

namespace Core\Infrastructure\Http\Api\Controller;

use Core\Application\Auth\LoginHandler;
use Core\Domain\Auth\AuthenticationException;
use Core\Domain\Auth\JwtTokenPort;

/**
 * REST controller for authentication endpoints.
 *
 * Endpoints:
 * - POST   /api/auth/login   — Authenticate and get JWT
 * - POST   /api/auth/logout  — Revoke current token
 * - GET    /api/auth/me      — Get authenticated user info
 */
final class AuthApiController
{
    public function __construct(
        private readonly LoginHandler $loginHandler,
        private readonly JwtTokenPort $jwtPort,
    ) {
    }

    /**
     * POST /api/auth/login
     *
     * Body: { "username": "...", "password": "..." }
     * Response: { "token": "...", "expires_at": 1234567890, "user": {...} }
     */
    public function login(): void
    {
        $body = \Flight::request()->data->getData();

        $identifier = $body['username'] ?? $body['email'] ?? '';
        $password = $body['password'] ?? '';

        if (empty($identifier) || empty($password)) {
            \Flight::json([
                'error'   => 'validation_error',
                'message' => 'Username/email and password are required.',
            ], 422);
            return;
        }

        try {
            $result = $this->loginHandler->handle($identifier, $password);

            \Flight::json([
                'token'      => $result['token'],
                'expires_at' => $result['expires_at'],
                'user'       => $result['user']->toPublicArray(),
            ]);
        } catch (AuthenticationException $e) {
            \Flight::json([
                'error'   => 'authentication_error',
                'message' => $e->getMessage(),
            ], $e->getCode());
        }
    }

    /**
     * POST /api/auth/logout
     *
     * Revokes the current JWT by adding its JTI to the blacklist.
     */
    public function logout(): void
    {
        $claims = \Flight::get('auth.claims');

        if ($claims === null) {
            \Flight::json([
                'error'   => 'authentication_error',
                'message' => 'No active session.',
            ], 401);
            return;
        }

        $this->jwtPort->revoke(
            $claims['jti'],
            $claims['user_id'],
            $claims['exp'],
        );

        \Flight::json(['message' => 'Logged out successfully.']);
    }

    /**
     * GET /api/auth/me
     *
     * Returns the currently authenticated user's public data.
     */
    public function me(): void
    {
        $user = \Flight::get('auth.user');

        if ($user === null) {
            \Flight::json([
                'error'   => 'authentication_error',
                'message' => 'Not authenticated.',
            ], 401);
            return;
        }

        \Flight::json(['user' => $user->toPublicArray()]);
    }
}
