<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('category_bank', function (Blueprint $table) {
            $table->id();
            $table->string('label', 255)->nullable();
            $table->integer('entity')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('category_bank');
    }
};
