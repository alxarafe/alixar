<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_incoterms', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('code', 3);
            $table->string('label', 100)->nullable();
            $table->string('libelle', 255);
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_incoterms');
    }
};
