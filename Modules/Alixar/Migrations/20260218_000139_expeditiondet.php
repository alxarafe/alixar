<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('expeditiondet', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_expedition');
            $table->integer('fk_element')->nullable();
            $table->integer('fk_elementdet')->nullable();
            $table->string('element_type', 50)->default('commande');
            $table->integer('fk_product')->nullable();
            $table->decimal('qty')->nullable();
            $table->integer('fk_unit')->nullable();
            $table->integer('fk_entrepot')->nullable();
            $table->integer('rang')->nullable()->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('expeditiondet');
    }
};
