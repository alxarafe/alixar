<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_ecotaxe', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('code', 64);
            $table->string('label', 255)->nullable();
            $table->decimal('price')->nullable();
            $table->string('organization', 255)->nullable();
            $table->integer('fk_pays');
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_ecotaxe');
    }
};
