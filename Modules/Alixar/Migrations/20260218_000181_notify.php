<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('notify', function (Blueprint $table) {
            $table->id("rowid");
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('daten')->nullable();
            $table->integer('fk_action');
            $table->integer('fk_soc')->nullable();
            $table->integer('fk_contact')->nullable();
            $table->integer('fk_user')->nullable();
            $table->string('type', 16)->nullable()->default('email');
            $table->string('type_target', 16)->nullable();
            $table->string('objet_type', 24);
            $table->integer('objet_id');
            $table->string('email', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('notify');
    }
};
