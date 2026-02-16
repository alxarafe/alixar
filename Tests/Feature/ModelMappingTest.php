<?php

namespace Tests\Feature;

use PHPUnit\Framework\TestCase;
use Alxarafe\Base\Config;
use Alxarafe\Base\Database;
use Modules\Alixar\Model\ThirdParty;
use Modules\Alixar\Model\Product;

class ModelMappingTest extends TestCase
{
    #[\Override]
    protected function setUp(): void
    {
        parent::setUp();

        // Initialize Alxarafe connection for tests
        $config = Config::getConfig();
        Database::createConnection($config->db);
    }

    /**
     * Test mapping for ThirdParty.
     */
    public function testThirdPartyMapping(): void
    {
        // We try to get the first record if any, or just check the schema
        try {
            $count = ThirdParty::count();
            $this->assertIsInt($count);
        } catch (\Exception $e) {
            $this->fail("Failed to query 'societe' table for ThirdParty model: " . $e->getMessage());
        }
    }

    /**
     * Test mapping for Product.
     */
    public function testProductMapping(): void
    {
        try {
            $count = Product::count();
            $this->assertIsInt($count);
        } catch (\Exception $e) {
            $this->fail("Failed to query 'product' table for Product model: " . $e->getMessage());
        }
    }
}
