<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product_price', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_product');
            $table->dateTime('date_price');
            $table->integer('price_level')->nullable()->default(1);
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
            $table->integer('fk_user_author')->nullable();
            $table->string('price_label', 255)->nullable();
            $table->integer('tosell')->nullable()->default(1);
            $table->integer('price_by_qty')->default(0);
            $table->integer('fk_price_expression')->nullable();
            $table->string('import_key', 14)->nullable();
            $table->integer('fk_multicurrency')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_tx')->nullable();
            $table->decimal('multicurrency_price')->nullable();
            $table->decimal('multicurrency_price_ttc')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product_price');
    }
};
