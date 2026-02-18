<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('default_values', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->string('type', 10)->nullable();
            $table->integer('user_id')->default(0);
            $table->string('page', 255)->nullable();
            $table->string('param', 255)->nullable();
            $table->string('value', 128)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('default_values');
    }
};
