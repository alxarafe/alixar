<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('commande_fournisseur', function (Blueprint $table) {
            $table->id();
            $table->string('ref', 180);
            $table->integer('entity')->default(1);
            $table->string('ref_ext', 255)->nullable();
            $table->string('ref_supplier', 255)->nullable();
            $table->integer('fk_soc');
            $table->integer('fk_projet')->nullable()->default(0);
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('date_creation')->nullable();
            $table->dateTime('date_valid')->nullable();
            $table->dateTime('date_approve')->nullable();
            $table->dateTime('date_approve2')->nullable();
            $table->date('date_commande')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->integer('fk_user_approve')->nullable();
            $table->integer('fk_user_approve2')->nullable();
            $table->integer('source');
            $table->integer('fk_statut')->nullable()->default(0);
            $table->integer('billed')->nullable()->default(0);
            $table->decimal('amount_ht')->nullable();
            $table->decimal('remise_percent')->nullable()->default(0);
            $table->decimal('remise')->nullable()->default(0);
            $table->decimal('total_tva')->nullable();
            $table->decimal('localtax1')->nullable();
            $table->decimal('localtax2')->nullable();
            $table->decimal('total_ht')->nullable();
            $table->decimal('total_ttc')->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('last_main_doc', 255)->nullable();
            $table->dateTime('date_livraison')->nullable();
            $table->integer('fk_account')->nullable();
            $table->integer('fk_cond_reglement')->nullable();
            $table->integer('fk_mode_reglement')->nullable();
            $table->integer('fk_input_method')->nullable()->default(0);
            $table->integer('fk_incoterms')->nullable();
            $table->string('location_incoterms', 255)->nullable();
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
        Capsule::schema()->dropIfExists('commande_fournisseur');
    }
};
