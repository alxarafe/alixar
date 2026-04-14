<?php

declare(strict_types=1);

namespace Core\Infrastructure\Http\Middleware;

use Core\Domain\Auth\AuthenticationException;
use Core\Domain\Auth\JwtTokenPort;
use Core\Domain\Auth\UserRepositoryInterface;

/**
 * Authentication middleware for FlightPHP.
 *
 * Flow:
 * 1. Extracts JWT from the `Authorization: Bearer <token>` header.
 * 2. Verifies signature and expiration via JwtTokenPort.
 * 3. Checks token JTI against the blacklist (for logout/revocation).
 * 4. Loads the authenticated User and stores it in Flight's request context.
 *
 * Routes that require authentication should be registered AFTER this middleware.
 * Public routes (login, health, etc.) should be whitelisted.
 */
final class AuthMiddleware
{
    /**
     * Routes that do NOT require authentication.
     *
     * @var string[]
     */
    private array $publicRoutes = [
        '/api/auth/login',
        '/api/health',
        '/api/status',
    ];

    public function __construct(
        private readonly JwtTokenPort $jwtPort,
        private readonly UserRepositoryInterface $userRepository,
    ) {
    }

    /**
     * Add a route to the public (no-auth) whitelist.
     */
    public function addPublicRoute(string $route): void
    {
        $this->publicRoutes[] = $route;
    }

    /**
     * FlightPHP "before" filter callback.
     *
     * Register with: $app->before('start', [$middleware, 'handle']);
     */
    public function handle(): bool
    {
        $path = parse_url($_SERVER['REQUEST_URI'] ?? '/', PHP_URL_PATH) ?: '/';

        // Skip authentication for public routes
        foreach ($this->publicRoutes as $publicRoute) {
            if (str_starts_with($path, $publicRoute)) {
                return true;
            }
        }

        // Only protect /api/* routes
        if (!str_starts_with($path, '/api/')) {
            return true;
        }

        try {
            $token = $this->extractBearerToken();
            $claims = $this->jwtPort->verify($token);

            // Check blacklist
            if ($this->jwtPort->isRevoked($claims['jti'])) {
                throw AuthenticationException::tokenRevoked();
            }

            // Load the full user entity
            $user = $this->userRepository->findById($claims['user_id']);
            if ($user === null) {
                throw AuthenticationException::tokenInvalid();
            }

            if (!$user->isActive()) {
                throw AuthenticationException::accountInactive();
            }

            // Store authenticated user and token claims in Flight's context
            \Flight::set('auth.user', $user);
            \Flight::set('auth.claims', $claims);

            return true;
        } catch (AuthenticationException $e) {
            \Flight::json([
                'error'   => 'authentication_error',
                'message' => $e->getMessage(),
            ], $e->getCode());
            \Flight::stop();
            return false;
        }
    }

    /**
     * Extract the Bearer token from the Authorization header.
     */
    private function extractBearerToken(): string
    {
        $header = $_SERVER['HTTP_AUTHORIZATION']
            ?? $_SERVER['REDIRECT_HTTP_AUTHORIZATION']
            ?? '';

        // Apache may strip the Authorization header; try getallheaders() as fallback
        if (empty($header) && function_exists('getallheaders')) {
            $headers = getallheaders();
            $header = $headers['Authorization'] ?? $headers['authorization'] ?? '';
        }

        if (empty($header)) {
            throw AuthenticationException::unauthorized();
        }

        if (!preg_match('/^Bearer\s+(.+)$/i', $header, $matches)) {
            throw AuthenticationException::unauthorized();
        }

        return trim($matches[1]);
    }
}
