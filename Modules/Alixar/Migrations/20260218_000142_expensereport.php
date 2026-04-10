<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('expensereport', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 50);
            $table->integer('entity')->default(1);
            $table->integer('ref_number_int')->nullable();
            $table->integer('ref_ext')->nullable();
            $table->decimal('total_ht')->nullable();
            $table->decimal('total_tva')->nullable();
            $table->decimal('localtax1')->nullable();
            $table->decimal('localtax2')->nullable();
            $table->decimal('total_ttc')->nullable();
            $table->date('date_debut');
            $table->date('date_fin');
            $table->dateTime('date_create');
            $table->dateTime('date_valid')->nullable();
            $table->dateTime('date_approve')->nullable();
            $table->dateTime('date_refuse')->nullable();
            $table->dateTime('date_cancel')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_author');
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->integer('fk_user_validator')->nullable();
            $table->integer('fk_user_approve')->nullable();
            $table->integer('fk_user_refuse')->nullable();
            $table->integer('fk_user_cancel')->nullable();
            $table->integer('fk_statut');
            $table->integer('fk_c_paiement')->nullable();
            $table->integer('paid')->default(0);
            $table->text('note_public')->nullable();
            $table->text('note_private')->nullable();
            $table->string('detail_refuse', 255)->nullable();
            $table->string('detail_cancel', 255)->nullable();
            $table->integer('integration_compta')->nullable();
            $table->integer('fk_bank_account')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('last_main_doc', 255)->nullable();
            $table->integer('fk_multicurrency')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_tx')->nullable();
            $table->decimal('multicurrency_total_ht')->nullable();
            $table->decimal('multicurrency_total_tva')->nullable();
            $table->decimal('multicurrency_total_ttc')->nullable();
            $table->string('import_key', 14)->nullable();
            $table->string('extraparams', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('expensereport');
    }
};
