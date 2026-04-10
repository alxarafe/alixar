<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product_pricerules', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('level');
            $table->integer('fk_level');
            $table->decimal('var_percent');
            $table->decimal('var_min_percent');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product_pricerules');
    }
};
