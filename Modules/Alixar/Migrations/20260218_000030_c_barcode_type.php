<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_barcode_type', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('code', 16);
            $table->integer('entity')->default(1);
            $table->string('libelle', 128);
            $table->string('coder', 16);
            $table->string('example', 16);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_barcode_type');
    }
};
