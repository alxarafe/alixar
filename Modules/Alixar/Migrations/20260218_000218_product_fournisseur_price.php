<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product_fournisseur_price', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_product')->nullable();
            $table->integer('fk_soc')->nullable();
            $table->string('ref_fourn', 128)->nullable();
            $table->text('desc_fourn')->nullable();
            $table->integer('fk_availability')->nullable();
            $table->decimal('price')->nullable();
            $table->decimal('quantity')->nullable();
            $table->decimal('remise_percent')->default(0);
            $table->decimal('remise')->default(0);
            $table->decimal('unitprice')->nullable();
            $table->decimal('charges')->nullable();
            $table->string('default_vat_code', 10)->nullable();
            $table->string('barcode', 180)->nullable();
            $table->integer('fk_barcode_type')->nullable();
            $table->decimal('tva_tx')->nullable();
            $table->decimal('localtax1_tx')->nullable();
            $table->string('localtax1_type', 10)->default('0');
            $table->decimal('localtax2_tx')->nullable();
            $table->string('localtax2_type', 10)->default('0');
            $table->integer('info_bits')->default(0);
            $table->integer('fk_user')->nullable();
            $table->integer('fk_supplier_price_expression')->nullable();
            $table->integer('delivery_time_days')->nullable();
            $table->string('supplier_reputation', 10)->nullable();
            $table->decimal('packaging')->nullable();
            $table->integer('fk_multicurrency')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_tx')->nullable();
            $table->decimal('multicurrency_unitprice')->nullable();
            $table->decimal('multicurrency_price')->nullable();
            $table->string('import_key', 14)->nullable();
            $table->integer('status')->nullable()->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product_fournisseur_price');
    }
};
