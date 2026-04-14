<?php

declare(strict_types=1);

namespace Tests\Core\Domain\Auth;

use Core\Domain\Auth\AuthorizationService;
use Core\Domain\Auth\User;
use PHPUnit\Framework\TestCase;

class AuthorizationServiceTest extends TestCase
{
    private AuthorizationService $service;

    protected function setUp(): void
    {
        parent::setUp();
        $this->service = new AuthorizationService();
    }

    private function createUser(bool $isSuperadmin = false, array $permissions = [], array $roleIds = []): User
    {
        return User::fromArray([
            'id' => 1,
            'username' => 'testuser',
            'email' => 'test@example.com',
            'password_hash' => 'hash',
            'is_superadmin' => $isSuperadmin,
        ], $roleIds, $permissions);
    }

    public function testSuperadminCanDoAnything(): void
    {
        $superadmin = $this->createUser(true);

        $this->assertTrue($this->service->can($superadmin, 'any.strange.permission'));
        $this->assertTrue($this->service->canAll($superadmin, ['a', 'b', 'c']));
        $this->assertTrue($this->service->canAny($superadmin, ['x', 'y', 'z']));
    }

    public function testCanCheckSpecificPermission(): void
    {
        $user = $this->createUser(false, ['core.user.read', 'core.user.write']);

        $this->assertTrue($this->service->can($user, 'core.user.read'));
        $this->assertTrue($this->service->can($user, 'core.user.write'));
        $this->assertFalse($this->service->can($user, 'core.user.delete'));
    }

    public function testCanAllChecksMultiplePermissions(): void
    {
        $user = $this->createUser(false, ['a', 'b']);

        $this->assertTrue($this->service->canAll($user, ['a']));
        $this->assertTrue($this->service->canAll($user, ['a', 'b']));
        $this->assertFalse($this->service->canAll($user, ['a', 'b', 'c']));
    }

    public function testCanAnyChecksMultiplePermissions(): void
    {
        $user = $this->createUser(false, ['a', 'b']);

        $this->assertTrue($this->service->canAny($user, ['a', 'c']));
        $this->assertTrue($this->service->canAny($user, ['b', 'd']));
        $this->assertFalse($this->service->canAny($user, ['c', 'd']));
    }

    public function testHasRoleChecksRoleIds(): void
    {
        $user = $this->createUser(false, [], [1, 2, 5]);

        $this->assertTrue($this->service->hasRole($user, 1));
        $this->assertTrue($this->service->hasRole($user, 5));
        $this->assertFalse($this->service->hasRole($user, 3));
    }
}
