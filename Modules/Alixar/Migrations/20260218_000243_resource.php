<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('resource', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->string('ref', 255)->nullable();
            $table->string('asset_number', 255)->nullable();
            $table->text('description')->nullable();
            $table->string('fk_code_type_resource', 32)->nullable();
            $table->string('address', 255)->nullable();
            $table->string('zip', 25)->nullable();
            $table->string('town', 50)->nullable();
            $table->string('photo_filename', 255)->nullable();
            $table->integer('max_users')->nullable();
            $table->string('phone', 20)->nullable();
            $table->string('email', 255)->nullable();
            $table->string('url', 255)->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('date_valid')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->integer('fk_statut')->default(0);
            $table->text('note_public')->nullable();
            $table->text('note_private')->nullable();
            $table->string('import_key', 14)->nullable();
            $table->string('extraparams', 255)->nullable();
            $table->integer('fk_country')->nullable();
            $table->integer('fk_state')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('resource');
    }
};
