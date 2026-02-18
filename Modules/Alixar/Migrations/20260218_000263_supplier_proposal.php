<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('supplier_proposal', function (Blueprint $table) {
            $table->id();
            $table->string('ref', 30);
            $table->integer('entity')->default(1);
            $table->string('ref_ext', 255)->nullable();
            $table->integer('fk_soc')->nullable();
            $table->integer('fk_projet')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datec')->nullable();
            $table->dateTime('date_valid')->nullable();
            $table->dateTime('date_cloture')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->integer('fk_user_cloture')->nullable();
            $table->integer('fk_statut')->default(0);
            $table->decimal('price')->nullable()->default(0);
            $table->decimal('remise_percent')->nullable()->default(0);
            $table->decimal('remise_absolue')->nullable()->default(0);
            $table->decimal('remise')->nullable()->default(0);
            $table->decimal('total_ht')->nullable();
            $table->decimal('total_tva')->nullable();
            $table->decimal('localtax1')->nullable();
            $table->decimal('localtax2')->nullable();
            $table->decimal('total_ttc')->nullable();
            $table->integer('fk_account')->nullable();
            $table->string('fk_currency', 3)->nullable();
            $table->integer('fk_cond_reglement')->nullable();
            $table->integer('fk_mode_reglement')->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('last_main_doc', 255)->nullable();
            $table->date('date_livraison')->nullable();
            $table->integer('fk_shipping_method')->nullable();
            $table->string('import_key', 14)->nullable();
            $table->string('extraparams', 255)->nullable();
            $table->integer('fk_multicurrency')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_tx')->nullable();
            $table->decimal('multicurrency_total_ht')->nullable();
            $table->decimal('multicurrency_total_tva')->nullable();
            $table->decimal('multicurrency_total_ttc')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('supplier_proposal');
    }
};
