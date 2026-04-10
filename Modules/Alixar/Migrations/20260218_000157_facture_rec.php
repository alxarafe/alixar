<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('facture_rec', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('titre', 200);
            $table->integer('entity')->default(1);
            $table->integer('subtype')->nullable();
            $table->integer('fk_soc');
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('suspended')->nullable()->default(0);
            $table->decimal('amount')->nullable();
            $table->decimal('remise')->nullable()->default(0);
            $table->decimal('remise_percent')->nullable()->default(0);
            $table->decimal('remise_absolue')->nullable()->default(0);
            $table->string('vat_src_code', 10)->nullable()->default('');
            $table->decimal('total_tva')->nullable();
            $table->decimal('localtax1')->nullable();
            $table->decimal('localtax2')->nullable();
            $table->decimal('revenuestamp')->nullable();
            $table->decimal('total_ht')->nullable();
            $table->decimal('total_ttc')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_projet')->nullable();
            $table->integer('fk_cond_reglement')->default(1);
            $table->integer('fk_mode_reglement')->nullable()->default(0);
            $table->date('date_lim_reglement')->nullable();
            $table->integer('fk_account')->nullable();
            $table->integer('fk_societe_rib')->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->string('modelpdf', 255)->nullable();
            $table->integer('fk_multicurrency')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_tx')->nullable();
            $table->decimal('multicurrency_total_ht')->nullable();
            $table->decimal('multicurrency_total_tva')->nullable();
            $table->decimal('multicurrency_total_ttc')->nullable();
            $table->integer('usenewprice')->nullable()->default(0);
            $table->integer('frequency')->nullable();
            $table->string('unit_frequency', 2)->nullable()->default('m');
            $table->dateTime('date_when')->nullable();
            $table->dateTime('date_last_gen')->nullable();
            $table->integer('nb_gen_done')->nullable();
            $table->integer('nb_gen_max')->nullable();
            $table->integer('auto_validate')->nullable()->default(0);
            $table->integer('generate_pdf')->nullable()->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('facture_rec');
    }
};
