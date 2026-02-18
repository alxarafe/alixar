<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('links', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->dateTime('datea');
            $table->string('url', 255);
            $table->string('label', 255);
            $table->string('objecttype', 255);
            $table->integer('objectid');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('links');
    }
};
