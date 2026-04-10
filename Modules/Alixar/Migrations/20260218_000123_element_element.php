<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('element_element', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_source');
            $table->string('sourcetype', 64);
            $table->integer('fk_target');
            $table->string('targettype', 64);
            $table->string('relationtype', 64)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('element_element');
    }
};
