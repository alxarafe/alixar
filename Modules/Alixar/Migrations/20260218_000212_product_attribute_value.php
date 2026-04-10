<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product_attribute_value', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_product_attribute');
            $table->string('ref', 180);
            $table->string('value', 255);
            $table->integer('entity')->default(1);
            $table->integer('position')->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product_attribute_value');
    }
};
