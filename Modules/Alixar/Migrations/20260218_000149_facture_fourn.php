<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('facture_fourn', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 180);
            $table->string('ref_supplier', 180);
            $table->integer('entity')->default(1);
            $table->string('ref_ext', 255)->nullable();
            $table->integer('type')->default(0);
            $table->integer('subtype')->nullable();
            $table->integer('fk_soc');
            $table->dateTime('datec')->nullable();
            $table->date('datef')->nullable();
            $table->date('date_pointoftax')->nullable();
            $table->date('date_valid')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('date_closing')->nullable();
            $table->string('libelle', 255)->nullable();
            $table->integer('paye')->default(0);
            $table->decimal('amount')->nullable();
            $table->decimal('remise')->nullable();
            $table->string('close_code', 16)->nullable();
            $table->decimal('close_missing_amount')->nullable();
            $table->string('close_note', 128)->nullable();
            $table->integer('vat_reverse_charge')->nullable()->default(0);
            $table->decimal('tva')->nullable();
            $table->decimal('total_tva')->nullable();
            $table->decimal('localtax1')->nullable();
            $table->decimal('localtax2')->nullable();
            $table->decimal('revenuestamp')->nullable();
            $table->decimal('total_ht')->nullable();
            $table->decimal('total_ttc')->nullable();
            $table->integer('fk_statut')->default(0);
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->integer('fk_user_closing')->nullable();
            $table->integer('fk_fac_rec_source')->nullable();
            $table->integer('fk_facture_source')->nullable();
            $table->integer('fk_projet')->nullable();
            $table->integer('fk_account')->nullable();
            $table->integer('fk_cond_reglement')->nullable();
            $table->integer('fk_mode_reglement')->nullable();
            $table->date('date_lim_reglement')->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->integer('fk_incoterms')->nullable();
            $table->string('location_incoterms', 255)->nullable();
            $table->integer('fk_transport_mode')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('last_main_doc', 255)->nullable();
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
        Capsule::schema()->dropIfExists('facture_fourn');
    }
};
