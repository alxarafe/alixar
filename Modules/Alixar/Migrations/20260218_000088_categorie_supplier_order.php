<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('categorie_supplier_order', function (Blueprint $table) {
            $table->integer('fk_categorie');
            $table->integer('fk_supplier_order');
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('categorie_supplier_order');
    }
};
