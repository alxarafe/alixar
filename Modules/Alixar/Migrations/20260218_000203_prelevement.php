<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('prelevement', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_facture')->nullable();
            $table->integer('fk_facture_fourn')->nullable();
            $table->integer('fk_salary')->nullable();
            $table->integer('fk_prelevement_lignes');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('prelevement');
    }
};
