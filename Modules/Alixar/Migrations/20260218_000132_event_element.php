<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('event_element', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_source');
            $table->integer('fk_target');
            $table->string('targettype', 32);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('event_element');
    }
};
