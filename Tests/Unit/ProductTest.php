<?php

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;
use Modules\Alixar\Model\Product;

class ProductTest extends TestCase
{
    /**
     * Test that the model has the correct table name.
     */
    public function testModelTableIsCorrect(): void
    {
        $model = new Product();
        $this->assertEquals('product', $model->getTable());
    }

    /**
     * Test that the model has the correct primary key.
     */
    public function testModelPrimaryKeyIsCorrect(): void
    {
        $model = new Product();
        $this->assertEquals('rowid', $model->getKeyName());
    }

    /**
     * Test fillable attributes.
     */
    public function testFillableAttributes(): void
    {
        $model = new Product();
        $this->assertContains('ref', $model->getFillable());
        $this->assertContains('label', $model->getFillable());
        $this->assertContains('price', $model->getFillable());
    }
}
