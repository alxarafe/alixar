<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_field_list', function (Blueprint $table) {
            $table->id();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('element', 64);
            $table->integer('entity')->default(1);
            $table->string('name', 32);
            $table->string('alias', 32);
            $table->string('title', 32);
            $table->string('align', 6)->nullable()->default('left');
            $table->integer('sort')->default(1);
            $table->integer('search')->default(0);
            $table->integer('visible')->default(1);
            $table->string('enabled', 255)->nullable()->default('1');
            $table->integer('rang')->nullable()->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_field_list');
    }
};
