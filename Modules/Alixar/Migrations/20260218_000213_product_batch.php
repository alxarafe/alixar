<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product_batch', function (Blueprint $table) {
            $table->id();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_product_stock');
            $table->dateTime('eatby')->nullable();
            $table->dateTime('sellby')->nullable();
            $table->string('batch', 128);
            $table->decimal('qty')->default(0);
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product_batch');
    }
};
