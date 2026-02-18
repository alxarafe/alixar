<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_ziptown', function (Blueprint $table) {
            $table->id();
            $table->string('code', 5)->nullable();
            $table->integer('fk_county')->nullable();
            $table->integer('fk_pays')->default(0);
            $table->string('zip', 10);
            $table->string('town', 180);
            $table->string('town_up', 180)->nullable();
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_ziptown');
    }
};
