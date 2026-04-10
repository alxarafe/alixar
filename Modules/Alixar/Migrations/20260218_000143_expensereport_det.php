<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('expensereport_det', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_expensereport');
            $table->string('docnumber', 128)->nullable();
            $table->integer('fk_c_type_fees');
            $table->integer('fk_c_exp_tax_cat')->nullable();
            $table->integer('fk_projet')->nullable();
            $table->text('comments');
            $table->integer('product_type')->nullable()->default(-1);
            $table->decimal('qty');
            $table->decimal('subprice')->nullable();
            $table->decimal('subprice_ttc')->nullable();
            $table->decimal('value_unit')->nullable();
            $table->decimal('remise_percent')->nullable();
            $table->string('vat_src_code', 10)->nullable()->default('');
            $table->decimal('tva_tx')->nullable();
            $table->decimal('localtax1_tx')->nullable();
            $table->string('localtax1_type', 10)->nullable();
            $table->decimal('localtax2_tx')->nullable();
            $table->string('localtax2_type', 10)->nullable();
            $table->decimal('total_ht')->nullable();
            $table->decimal('total_tva')->nullable();
            $table->decimal('total_localtax1')->nullable();
            $table->decimal('total_localtax2')->nullable();
            $table->decimal('total_ttc')->nullable();
            $table->date('date');
            $table->integer('info_bits')->nullable()->default(0);
            $table->integer('special_code')->nullable()->default(0);
            $table->integer('fk_multicurrency')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_subprice')->nullable();
            $table->decimal('multicurrency_subprice_ttc')->nullable();
            $table->decimal('multicurrency_total_ht')->nullable();
            $table->decimal('multicurrency_total_tva')->nullable();
            $table->decimal('multicurrency_total_ttc')->nullable();
            $table->integer('fk_facture')->nullable()->default(0);
            $table->integer('fk_ecm_files')->nullable();
            $table->integer('fk_code_ventilation')->nullable()->default(0);
            $table->integer('rang')->nullable()->default(0);
            $table->string('import_key', 14)->nullable();
            $table->text('rule_warning_message')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('expensereport_det');
    }
};
