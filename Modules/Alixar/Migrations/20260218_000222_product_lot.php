<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product_lot', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->nullable()->default(1);
            $table->integer('fk_product');
            $table->string('batch', 128)->nullable();
            $table->text('note_public')->nullable();
            $table->text('note_private')->nullable();
            $table->date('eatby')->nullable();
            $table->date('sellby')->nullable();
            $table->dateTime('eol_date')->nullable();
            $table->dateTime('manufacturing_date')->nullable();
            $table->dateTime('scrapping_date')->nullable();
            $table->integer('qc_frequency')->nullable();
            $table->integer('lifetime')->nullable();
            $table->string('barcode', 180)->nullable();
            $table->integer('fk_barcode_type')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('last_main_doc', 255)->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('import_key')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product_lot');
    }
};
