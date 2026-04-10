<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_type_contact', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('element', 64);
            $table->string('source', 8)->default('external');
            $table->string('code', 32);
            $table->string('libelle', 128);
            $table->integer('active')->default(1);
            $table->string('module', 32)->nullable();
            $table->integer('position')->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_type_contact');
    }
};
