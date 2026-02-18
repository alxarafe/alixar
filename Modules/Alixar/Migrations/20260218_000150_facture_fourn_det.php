<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('facture_fourn_det', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_facture_fourn');
            $table->integer('fk_parent_line')->nullable();
            $table->integer('fk_product')->nullable();
            $table->string('ref', 128)->nullable();
            $table->string('label', 255)->nullable();
            $table->text('description')->nullable();
            $table->decimal('pu_ht')->nullable();
            $table->decimal('pu_ttc')->nullable();
            $table->decimal('qty')->nullable();
            $table->decimal('remise_percent')->nullable()->default(0);
            $table->integer('fk_remise_except')->nullable();
            $table->string('vat_src_code', 10)->nullable()->default('');
            $table->decimal('tva_tx')->nullable();
            $table->decimal('localtax1_tx')->nullable();
            $table->string('localtax1_type', 10)->nullable();
            $table->decimal('localtax2_tx')->nullable();
            $table->string('localtax2_type', 10)->nullable();
            $table->decimal('total_ht')->nullable();
            $table->decimal('tva')->nullable();
            $table->decimal('total_localtax1')->nullable();
            $table->decimal('total_localtax2')->nullable();
            $table->decimal('total_ttc')->nullable();
            $table->integer('product_type')->nullable()->default(0);
            $table->dateTime('date_start')->nullable();
            $table->dateTime('date_end')->nullable();
            $table->integer('info_bits')->nullable()->default(0);
            $table->integer('fk_code_ventilation')->default(0);
            $table->integer('special_code')->nullable()->default(0);
            $table->integer('rang')->nullable()->default(0);
            $table->string('import_key', 14)->nullable();
            $table->integer('fk_unit')->nullable();
            $table->integer('fk_multicurrency')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_subprice')->nullable();
            $table->decimal('multicurrency_subprice_ttc')->nullable();
            $table->decimal('multicurrency_total_ht')->nullable();
            $table->decimal('multicurrency_total_tva')->nullable();
            $table->decimal('multicurrency_total_ttc')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('facture_fourn_det');
    }
};
