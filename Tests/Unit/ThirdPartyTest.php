<?php

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;
use Modules\Alixar\Model\ThirdParty;

class ThirdPartyTest extends TestCase
{
    /**
     * Test that the model has the correct table name.
     */
    public function testModelTableIsCorrect(): void
    {
        $model = new ThirdParty();
        $this->assertEquals('societe', $model->getTable());
    }

    /**
     * Test that the model has the correct primary key.
     */
    public function testModelPrimaryKeyIsCorrect(): void
    {
        $model = new ThirdParty();
        $this->assertEquals('rowid', $model->getKeyName());
    }

    /**
     * Test fillable attributes.
     */
    public function testFillableAttributes(): void
    {
        $model = new ThirdParty();
        $this->assertContains('nom', $model->getFillable());
        $this->assertContains('email', $model->getFillable());
        $this->assertContains('code_client', $model->getFillable());
    }
}
