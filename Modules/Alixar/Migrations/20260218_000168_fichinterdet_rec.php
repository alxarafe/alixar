<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('fichinterdet_rec', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_fichinter');
            $table->dateTime('date')->nullable();
            $table->text('description')->nullable();
            $table->integer('duree')->nullable();
            $table->integer('rang')->nullable()->default(0);
            $table->decimal('total_ht')->nullable();
            $table->decimal('subprice')->nullable();
            $table->decimal('subprice_ttc')->nullable();
            $table->integer('fk_parent_line')->nullable();
            $table->integer('fk_product')->nullable();
            $table->string('label', 255)->nullable();
            $table->decimal('tva_tx')->nullable();
            $table->decimal('localtax1_tx')->nullable();
            $table->string('localtax1_type', 1)->nullable();
            $table->decimal('localtax2_tx')->nullable();
            $table->string('localtax2_type', 1)->nullable();
            $table->decimal('qty')->nullable();
            $table->decimal('remise_percent')->nullable()->default(0);
            $table->integer('fk_remise_except')->nullable();
            $table->decimal('price')->nullable();
            $table->decimal('total_tva')->nullable();
            $table->decimal('total_localtax1')->nullable();
            $table->decimal('total_localtax2')->nullable();
            $table->decimal('total_ttc')->nullable();
            $table->integer('product_type')->nullable()->default(0);
            $table->dateTime('date_start')->nullable();
            $table->dateTime('date_end')->nullable();
            $table->integer('info_bits')->nullable()->default(0);
            $table->decimal('buy_price_ht')->nullable();
            $table->integer('fk_product_fournisseur_price')->nullable();
            $table->integer('fk_code_ventilation')->default(0);
            $table->integer('special_code')->nullable()->default(0);
            $table->integer('fk_unit')->nullable();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('fichinterdet_rec');
    }
};
