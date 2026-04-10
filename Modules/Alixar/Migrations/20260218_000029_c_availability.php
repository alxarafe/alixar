<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_availability', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('code', 30);
            $table->string('label', 128);
            $table->string('type_duration', 1)->nullable();
            $table->decimal('qty')->nullable();
            $table->integer('active')->default(1);
            $table->integer('position')->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_availability');
    }
};
