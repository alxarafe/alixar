<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('bookmark', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_user');
            $table->dateTime('dateb')->nullable();
            $table->text('url')->nullable();
            $table->string('target', 16)->nullable();
            $table->string('title', 64)->nullable();
            $table->string('favicon', 24)->nullable();
            $table->integer('position')->nullable()->default(0);
            $table->integer('entity')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('bookmark');
    }
};
