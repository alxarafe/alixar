<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_actioncomm', function (Blueprint $table) {
            $table->integer('id');
            $table->string('code', 50);
            $table->string('type', 50)->default('system');
            $table->string('libelle', 128);
            $table->string('module', 50)->nullable();
            $table->integer('active')->default(1);
            $table->integer('todo')->nullable();
            $table->string('color', 9)->nullable();
            $table->string('picto', 48)->nullable();
            $table->integer('position')->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_actioncomm');
    }
};
