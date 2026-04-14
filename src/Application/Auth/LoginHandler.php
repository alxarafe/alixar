<?php

declare(strict_types=1);

namespace Core\Application\Auth;

use Core\Domain\Auth\AuthenticationService;
use Core\Domain\Auth\JwtTokenPort;
use Core\Domain\Auth\User;

/**
 * Use case: User login.
 *
 * Authenticates the user and returns a JWT access token.
 */
final class LoginHandler
{
    public function __construct(
        private readonly AuthenticationService $authService,
        private readonly JwtTokenPort $jwtPort,
    ) {
    }

    /**
     * @param string $identifier Username or email
     * @param string $password   Plain-text password
     * @return array{user: User, token: string, expires_at: int}
     */
    public function handle(string $identifier, string $password): array
    {
        // Authenticate (throws AuthenticationException on failure)
        $user = $this->authService->authenticate($identifier, $password);

        // Generate JWT
        $tokenData = $this->jwtPort->generate($user);

        return [
            'user'       => $user,
            'token'      => $tokenData['token'],
            'expires_at' => $tokenData['expires_at'],
        ];
    }
}
