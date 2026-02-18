<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_forme_juridique', function (Blueprint $table) {
            $table->id();
            $table->integer('code');
            $table->integer('fk_pays');
            $table->string('libelle', 255)->nullable();
            $table->integer('isvatexempted')->default(0);
            $table->integer('active')->default(1);
            $table->string('module', 32)->nullable();
            $table->integer('position')->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_forme_juridique');
    }
};
