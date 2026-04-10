<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('deliverydet', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_delivery')->nullable();
            $table->integer('fk_origin_line')->nullable();
            $table->integer('fk_product')->nullable();
            $table->text('description')->nullable();
            $table->decimal('qty')->nullable();
            $table->decimal('subprice')->nullable();
            $table->decimal('subprice_ttc')->nullable();
            $table->decimal('total_ht')->nullable();
            $table->integer('rang')->nullable()->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('deliverydet');
    }
};
