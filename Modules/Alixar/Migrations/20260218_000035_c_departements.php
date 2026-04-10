<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_departements', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('code_departement', 6);
            $table->integer('fk_region')->nullable();
            $table->string('cheflieu', 50)->nullable();
            $table->integer('tncc')->nullable();
            $table->string('ncc', 50)->nullable();
            $table->string('nom', 50)->nullable();
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_departements');
    }
};
