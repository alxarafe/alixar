<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('fichinter', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_soc');
            $table->integer('fk_projet')->nullable()->default(0);
            $table->integer('fk_contrat')->nullable()->default(0);
            $table->string('ref', 30);
            $table->string('ref_ext', 255)->nullable();
            $table->string('ref_client', 255)->nullable();
            $table->integer('entity')->default(1);
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datec')->nullable();
            $table->dateTime('date_valid')->nullable();
            $table->date('datei')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->integer('fk_statut')->nullable()->default(0);
            $table->date('dateo')->nullable();
            $table->date('datee')->nullable();
            $table->date('datet')->nullable();
            $table->decimal('duree')->nullable();
            $table->text('description')->nullable();
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
        Capsule::schema()->dropIfExists('fichinter');
    }
};
