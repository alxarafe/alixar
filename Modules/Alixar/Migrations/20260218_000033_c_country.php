<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_country', function (Blueprint $table) {
            $table->id();
            $table->string('code', 2);
            $table->string('code_iso', 3)->nullable();
            $table->string('numeric_code', 3)->nullable();
            $table->string('label', 128);
            $table->integer('eec')->default(0);
            $table->integer('active')->default(1);
            $table->integer('favorite')->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_country');
    }
};
