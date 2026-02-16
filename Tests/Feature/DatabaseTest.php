<?php

namespace Tests\Feature;

use PHPUnit\Framework\TestCase;
use Alxarafe\Base\Config;
use Alxarafe\Base\Database;

class DatabaseTest extends TestCase
{
    /**
     * Test that we can connect to the database.
     */
    public function testDatabaseConnection(): void
    {
        // Alxarafe uses Config to manage the environment
        $config = Config::getConfig();

        $this->assertNotNull($config, "Config should not be null");
        $this->assertObjectHasProperty('db', $config, "Config should have 'db' property");

        // Ensure connection is established
        Database::createConnection($config->db);

        // Use Eloquent to check connection
        $connection = \Illuminate\Database\Capsule\Manager::connection();
        $this->assertNotNull($connection);

        // Simple query to verify
        $result = $connection->select('SELECT 1 as connected');
        $this->assertEquals(1, $result[0]->connected);
    }
}
