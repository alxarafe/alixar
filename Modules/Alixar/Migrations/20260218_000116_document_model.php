<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('document_model', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('nom', 50)->nullable();
            $table->integer('entity')->default(1);
            $table->string('type', 64);
            $table->string('libelle', 255)->nullable();
            $table->text('description')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('document_model');
    }
};
