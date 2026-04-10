<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product_customer_price_log', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->dateTime('datec')->nullable();
            $table->integer('fk_product');
            $table->integer('fk_soc')->default(0);
            $table->string('ref_customer', 30)->nullable();
            $table->decimal('price')->nullable();
            $table->decimal('price_ttc')->nullable();
            $table->decimal('price_min')->nullable();
            $table->decimal('price_min_ttc')->nullable();
            $table->string('price_base_type', 3)->nullable()->default('HT');
            $table->string('default_vat_code', 10)->nullable();
            $table->decimal('tva_tx')->nullable();
            $table->integer('recuperableonly')->default(0);
            $table->decimal('localtax1_tx')->nullable();
            $table->string('localtax1_type', 10)->default('0');
            $table->decimal('localtax2_tx')->nullable();
            $table->string('localtax2_type', 10)->default('0');
            $table->integer('fk_user')->nullable();
            $table->string('price_label', 255)->nullable();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product_customer_price_log');
    }
};
