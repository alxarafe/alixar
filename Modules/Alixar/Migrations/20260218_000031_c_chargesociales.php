<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_chargesociales', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('libelle', 128)->nullable();
            $table->integer('deductible')->default(0);
            $table->integer('active')->default(1);
            $table->string('code', 24);
            $table->string('accountancy_code', 32)->nullable();
            $table->integer('fk_pays')->default(1);
            $table->string('module', 32)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_chargesociales');
    }
};
