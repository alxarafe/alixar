<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 128);
            $table->integer('entity')->default(1);
            $table->string('ref_ext', 128)->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_parent')->nullable()->default(0);
            $table->string('label', 255);
            $table->text('description')->nullable();
            $table->text('note_public')->nullable();
            $table->text('note')->nullable();
            $table->string('customcode', 32)->nullable();
            $table->integer('fk_country')->nullable();
            $table->integer('fk_state')->nullable();
            $table->decimal('price')->nullable();
            $table->decimal('price_ttc')->nullable();
            $table->decimal('price_min')->nullable();
            $table->decimal('price_min_ttc')->nullable();
            $table->string('price_base_type', 3)->nullable()->default('HT');
            $table->string('price_label', 255)->nullable();
            $table->decimal('cost_price')->nullable();
            $table->string('default_vat_code', 10)->nullable();
            $table->decimal('tva_tx')->nullable();
            $table->integer('recuperableonly')->default(0);
            $table->decimal('localtax1_tx')->nullable();
            $table->string('localtax1_type', 10)->default('0');
            $table->decimal('localtax2_tx')->nullable();
            $table->string('localtax2_type', 10)->default('0');
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('tosell')->nullable()->default(1);
            $table->integer('tobuy')->nullable()->default(1);
            $table->integer('tobatch')->default(0);
            $table->integer('sell_or_eat_by_mandatory')->default(0);
            $table->string('batch_mask', 32)->nullable();
            $table->integer('fk_product_type')->nullable()->default(0);
            $table->string('duration', 6)->nullable();
            $table->decimal('seuil_stock_alerte')->nullable();
            $table->string('url', 255)->nullable();
            $table->string('barcode', 180)->nullable();
            $table->integer('fk_barcode_type')->nullable();
            $table->string('accountancy_code_sell', 32)->nullable();
            $table->string('accountancy_code_sell_intra', 32)->nullable();
            $table->string('accountancy_code_sell_export', 32)->nullable();
            $table->string('accountancy_code_buy', 32)->nullable();
            $table->string('accountancy_code_buy_intra', 32)->nullable();
            $table->string('accountancy_code_buy_export', 32)->nullable();
            $table->string('partnumber', 32)->nullable();
            $table->decimal('net_measure')->nullable();
            $table->integer('net_measure_units')->nullable();
            $table->decimal('weight')->nullable();
            $table->integer('weight_units')->nullable();
            $table->decimal('length')->nullable();
            $table->integer('length_units')->nullable();
            $table->decimal('width')->nullable();
            $table->integer('width_units')->nullable();
            $table->decimal('height')->nullable();
            $table->integer('height_units')->nullable();
            $table->decimal('surface')->nullable();
            $table->integer('surface_units')->nullable();
            $table->decimal('volume')->nullable();
            $table->integer('volume_units')->nullable();
            $table->integer('stockable_product')->default(1);
            $table->decimal('stock')->nullable();
            $table->decimal('pmp')->nullable();
            $table->decimal('fifo')->nullable();
            $table->decimal('lifo')->nullable();
            $table->integer('fk_default_warehouse')->nullable();
            $table->integer('fk_default_bom')->nullable();
            $table->integer('fk_default_workstation')->nullable();
            $table->string('canvas', 32)->nullable();
            $table->integer('finished')->nullable();
            $table->integer('lifetime')->nullable();
            $table->integer('qc_frequency')->nullable();
            $table->integer('hidden')->nullable()->default(0);
            $table->string('import_key', 14)->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->integer('fk_price_expression')->nullable();
            $table->decimal('desiredstock')->nullable()->default(0);
            $table->integer('fk_unit')->nullable();
            $table->integer('price_autogen')->nullable()->default(0);
            $table->integer('fk_project')->nullable();
            $table->integer('mandatory_period')->nullable()->default(0);
            $table->string('last_main_doc', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product');
    }
};
