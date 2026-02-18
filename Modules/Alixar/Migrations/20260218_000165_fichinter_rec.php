<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('fichinter_rec', function (Blueprint $table) {
            $table->id();
            $table->string('title', 50);
            $table->integer('entity')->default(1);
            $table->integer('fk_soc')->nullable();
            $table->dateTime('datec')->nullable();
            $table->integer('fk_contrat')->nullable()->default(0);
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_projet')->nullable();
            $table->decimal('duree')->nullable();
            $table->text('description')->nullable();
            $table->string('modelpdf', 255)->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->integer('frequency')->nullable();
            $table->string('unit_frequency', 2)->nullable()->default('m');
            $table->dateTime('date_when')->nullable();
            $table->dateTime('date_last_gen')->nullable();
            $table->integer('nb_gen_done')->nullable();
            $table->integer('nb_gen_max')->nullable();
            $table->integer('auto_validate')->nullable();
            $table->integer('status')->nullable()->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('fichinter_rec');
    }
};
