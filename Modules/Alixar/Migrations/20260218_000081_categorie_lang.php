<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('categorie_lang', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_category')->default(0);
            $table->string('lang', 5)->default('0');
            $table->string('label', 255);
            $table->text('description')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('categorie_lang');
    }
};
