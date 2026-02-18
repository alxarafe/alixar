<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('object_lang', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_object')->default(0);
            $table->string('type_object', 32);
            $table->string('property', 32);
            $table->string('lang', 5)->default('');
            $table->text('value')->nullable();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('object_lang');
    }
};
