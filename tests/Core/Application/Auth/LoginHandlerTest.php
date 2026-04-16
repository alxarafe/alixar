<?php

declare(strict_types=1);

namespace Tests\Core\Application\Auth;

use Core\Application\Auth\LoginHandler;
use Core\Domain\Auth\AuthenticationException;
use Core\Domain\Auth\AuthenticationService;
use Core\Domain\Auth\JwtTokenPort;
use Core\Domain\Auth\User;
use PHPUnit\Framework\TestCase;

class LoginHandlerTest extends TestCase
{
    public function testHandleReturnsUserAndTokenOnSuccess(): void
    {
        $authService = $this->createMock(AuthenticationService::class);
        $jwtPort = $this->createMock(JwtTokenPort::class);

        $handler = new LoginHandler($authService, $jwtPort);

        $user = User::register('tester', 'tester@example.com', 'password123');

        $authService->expects($this->once())
            ->method('authenticate')
            ->with('tester', 'password123')
            ->willReturn($user);

        $jwtPort->expects($this->once())
            ->method('generate')
            ->with($user)
            ->willReturn(['token' => 'jwt.token.here', 'expires_at' => 1234567890]);

        $result = $handler->handle('tester', 'password123');

        $this->assertIsArray($result);
        $this->assertEquals($user, $result['user']);
        $this->assertEquals('jwt.token.here', $result['token']);
        $this->assertEquals(1234567890, $result['expires_at']);
    }

    public function testHandleThrowsExceptionOnFailure(): void
    {
        $authService = $this->createMock(AuthenticationService::class);
        $jwtPort = $this->createMock(JwtTokenPort::class);

        $handler = new LoginHandler($authService, $jwtPort);

        $authService->expects($this->once())
            ->method('authenticate')
            ->with('tester', 'wrongpassword')
            ->willThrowException(new AuthenticationException('Invalid credentials'));

        $jwtPort->expects($this->never())
            ->method('generate');

        $this->expectException(AuthenticationException::class);
        $this->expectExceptionMessage('Invalid credentials');

        $handler->handle('tester', 'wrongpassword');
    }
}
