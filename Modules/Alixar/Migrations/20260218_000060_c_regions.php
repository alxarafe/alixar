<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_regions', function (Blueprint $table) {
            $table->id();
            $table->integer('code_region');
            $table->integer('fk_pays');
            $table->string('cheflieu', 50)->nullable();
            $table->integer('tncc')->nullable();
            $table->string('nom', 100)->nullable();
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_regions');
    }
};
