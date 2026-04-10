<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('const', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('name', 180);
            $table->integer('entity')->default(1);
            $table->text('value');
            $table->string('type', 64)->nullable()->default('string');
            $table->integer('visible')->default(1);
            $table->text('note')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('const');
    }
};
