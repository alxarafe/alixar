<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('holiday', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 30);
            $table->string('ref_ext', 255)->nullable();
            $table->integer('entity')->default(1);
            $table->integer('fk_user');
            $table->integer('fk_user_create')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_type');
            $table->dateTime('date_create');
            $table->string('description', 255);
            $table->date('date_debut');
            $table->date('date_fin');
            $table->integer('halfday')->nullable()->default(0);
            $table->decimal('nb_open_day')->nullable();
            $table->integer('statut')->default(1);
            $table->integer('fk_validator');
            $table->dateTime('date_valid')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->dateTime('date_approval')->nullable();
            $table->integer('fk_user_approve')->nullable();
            $table->dateTime('date_refuse')->nullable();
            $table->integer('fk_user_refuse')->nullable();
            $table->dateTime('date_cancel')->nullable();
            $table->integer('fk_user_cancel')->nullable();
            $table->string('detail_refuse', 250)->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('import_key', 14)->nullable();
            $table->string('extraparams', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('holiday');
    }
};
