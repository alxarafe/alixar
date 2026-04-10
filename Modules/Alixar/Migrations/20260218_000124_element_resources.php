<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('element_resources', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('element_id')->nullable();
            $table->string('element_type', 64)->nullable();
            $table->integer('resource_id')->nullable();
            $table->string('resource_type', 64)->nullable();
            $table->integer('busy')->nullable();
            $table->integer('mandatory')->nullable();
            $table->decimal('duree')->nullable();
            $table->integer('fk_user_create')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('element_resources');
    }
};
