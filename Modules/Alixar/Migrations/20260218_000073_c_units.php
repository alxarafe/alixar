<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_units', function (Blueprint $table) {
            $table->id();
            $table->string('code', 3)->nullable();
            $table->integer('sortorder')->nullable();
            $table->integer('scale')->nullable();
            $table->string('label', 128)->nullable();
            $table->string('short_label', 5)->nullable();
            $table->string('unit_type', 10)->nullable();
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_units');
    }
};
