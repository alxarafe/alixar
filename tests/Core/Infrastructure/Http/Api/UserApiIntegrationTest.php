<?php

declare(strict_types=1);

namespace Tests\Core\Infrastructure\Http\Api;

use PDO;
use PHPUnit\Framework\TestCase;

/**
 * End-to-End API Integration test confirming the Core Hexagonal flow is sound.
 * Requires to be run inside the Docker container to hit the Nginx service.
 */
class UserApiIntegrationTest extends TestCase
{
    private string $baseUrl = 'http://alixar_nginx';
    private static ?PDO $pdo = null;

    public static function setUpBeforeClass(): void
    {
        // Re-run the clean install test logic to ensure a completely pristine DB
        if (file_exists('/.dockerenv')) {
            $config = require __DIR__ . '/../../../../../config/api.php';
            $db = $config['database'] ?? [];

            self::$pdo = new PDO(
                sprintf('mysql:host=%s;port=%d;dbname=%s;charset=%s', 
                    $db['host'] ?? 'alixar_db', $db['port'] ?? 3306, $db['database'] ?? 'alixar_db', $db['charset'] ?? 'utf8mb4'
                ),
                $db['username'] ?? 'root',
                $db['password'] ?? 'root',
                [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
            );

            // Wipe specific tables to ensure clean suite if ran multiple times
            self::$pdo->exec('SET FOREIGN_KEY_CHECKS = 0; DELETE FROM user_roles; DELETE FROM users WHERE username != "admin"; SET FOREIGN_KEY_CHECKS = 1;');
        }
    }

    protected function setUp(): void
    {
        parent::setUp();
        if (!file_exists('/.dockerenv')) {
            $this->markTestSkipped('Integration tests must be run inside Docker via `./bin/test.sh`');
        }
    }

    private function request(string $method, string $path, array $data = [], ?string $token = null): array
    {
        $opts = [
            'http' => [
                'method' => $method,
                'header' => "Content-Type: application/json\r\nAccept: application/json",
                'ignore_errors' => true,
            ]
        ];

        if (!empty($data) && in_array($method, ['POST', 'PUT', 'PATCH'])) {
            $opts['http']['content'] = json_encode($data);
        }

        if ($token) {
            $opts['http']['header'] .= "\r\nAuthorization: Bearer " . $token;
        }

        $context = stream_context_create($opts);
        $result = @file_get_contents($this->baseUrl . $path, false, $context);
        
        $statusLine = $http_response_header[0] ?? '';
        preg_match('{HTTP\/\S*\s(\d{3})}', $statusLine, $match);
        $statusCode = isset($match[1]) ? (int) $match[1] : 500;

        return [
            'status' => $statusCode,
            'body' => $result ? json_decode($result, true) : null
        ];
    }

    public function testSuperadminCanLoginAndCreateUserWithTimezoneAndLanguage(): array
    {
        // 1. Login as Admin
        $loginRes = $this->request('POST', '/api/auth/login', [
            'username' => 'admin',
            'password' => 'admin'
        ]);

        $this->assertEquals(200, $loginRes['status'], 'Admin should be able to login');
        $this->assertArrayHasKey('token', $loginRes['body']);
        $adminToken = $loginRes['body']['token'];

        // 2. Create User with specific i18n/timezone (ES/Madrid)
        $userData = [
            'username' => 'es_user',
            'email' => 'es_user@alixar.local',
            'password' => 'secret123',
            'first_name' => 'Spanish',
            'last_name' => 'User',
            'language' => 'es',
            'timezone' => 'Europe/Madrid'
        ];

        $createRes = $this->request('POST', '/api/users', $userData, $adminToken);
        
        $this->assertEquals(201, $createRes['status'], 'Admin should be able to create a user');
        $this->assertEquals('es', $createRes['body']['data']['language']);
        $this->assertEquals('Europe/Madrid', $createRes['body']['data']['timezone']);

        $newUserId = $createRes['body']['data']['id'];

        // 3. Assign generic 'user' role
        $roleRes = $this->request('PUT', "/api/users/{$newUserId}/roles", [
            'role_ids' => [3] // Assuming ID 3 is standard user role
        ], $adminToken);

        $this->assertEquals(200, $roleRes['status'], 'Admin should be able to assign roles');

        return [
            'adminToken' => $adminToken,
            'userId' => $newUserId
        ];
    }

    /**
     * @depends testSuperadminCanLoginAndCreateUserWithTimezoneAndLanguage
     */
    public function testStandardUserCannotCreateAnotherUser(array $context): void
    {
        // Login as the newly created standard user
        $loginRes = $this->request('POST', '/api/auth/login', [
            'username' => 'es_user',
            'password' => 'secret123'
        ]);

        $this->assertEquals(200, $loginRes['status']);
        $userToken = $loginRes['body']['token'];

        // Attempt to create another user
        $createRes = $this->request('POST', '/api/users', [
            'username' => 'hacker',
            'email' => 'hacker@alixar.local',
            'password' => '123'
        ], $userToken);

        $this->assertEquals(403, $createRes['status'], 'Standard user should be forbidden to create users');
        $this->assertEquals('Insufficient permissions.', $createRes['body']['error']['message'] ?? '');
    }

    /**
     * @depends testSuperadminCanLoginAndCreateUserWithTimezoneAndLanguage
     */
    public function testAdminCanDeleteUser(array $context): void
    {
        $deleteRes = $this->request('DELETE', "/api/users/{$context['userId']}", [], $context['adminToken']);
        $this->assertEquals(200, $deleteRes['status'], 'Admin should be able to delete the user');
    }
}
