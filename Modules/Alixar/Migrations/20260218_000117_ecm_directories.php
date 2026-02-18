<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('ecm_directories', function (Blueprint $table) {
            $table->id();
            $table->string('label', 64);
            $table->integer('entity')->default(1);
            $table->integer('fk_parent')->nullable();
            $table->string('description', 255);
            $table->integer('cachenbofdoc')->default(0);
            $table->string('fullpath', 750)->nullable();
            $table->string('extraparams', 255)->nullable();
            $table->dateTime('date_c')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_c')->nullable();
            $table->integer('fk_user_m')->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->text('acl')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('ecm_directories');
    }
};
