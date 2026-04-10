<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('contrat', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 255)->nullable();
            $table->string('ref_customer', 255)->nullable();
            $table->string('ref_supplier', 255)->nullable();
            $table->string('ref_ext', 255)->nullable();
            $table->integer('entity')->default(1);
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datec')->nullable();
            $table->dateTime('date_contrat')->nullable();
            $table->integer('statut')->nullable()->default(0);
            $table->dateTime('fin_validite')->nullable();
            $table->dateTime('date_cloture')->nullable();
            $table->integer('fk_soc');
            $table->integer('fk_projet')->nullable();
            $table->integer('fk_commercial_signature')->nullable();
            $table->integer('fk_commercial_suivi')->nullable();
            $table->integer('fk_user_author')->default(0);
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_user_cloture')->nullable();
            $table->decimal('total_tva')->nullable();
            $table->decimal('localtax1')->nullable();
            $table->decimal('localtax2')->nullable();
            $table->decimal('revenuestamp')->nullable();
            $table->decimal('total_ht')->nullable();
            $table->decimal('total_ttc')->nullable();
            $table->dateTime('denormalized_lower_planned_end_date')->nullable();
            $table->integer('signed_status')->nullable();
            $table->string('online_sign_ip', 48)->nullable();
            $table->string('online_sign_name', 64)->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('last_main_doc', 255)->nullable();
            $table->string('import_key', 14)->nullable();
            $table->string('extraparams', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('contrat');
    }
};
