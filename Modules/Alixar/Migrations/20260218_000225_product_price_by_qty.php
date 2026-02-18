<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product_price_by_qty', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_product_price');
            $table->decimal('price')->nullable();
            $table->string('price_base_type', 3)->nullable()->default('HT');
            $table->decimal('quantity')->nullable();
            $table->decimal('remise_percent')->default(0);
            $table->decimal('remise')->default(0);
            $table->decimal('unitprice')->nullable();
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_multicurrency')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_tx')->nullable();
            $table->decimal('multicurrency_price')->nullable();
            $table->decimal('multicurrency_price_ttc')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product_price_by_qty');
    }
};
