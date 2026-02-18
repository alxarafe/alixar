<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_type_fees', function (Blueprint $table) {
            $table->id();
            $table->string('code', 12);
            $table->string('label', 128)->nullable();
            $table->integer('type')->nullable()->default(0);
            $table->string('accountancy_code', 32)->nullable();
            $table->integer('active')->default(1);
            $table->string('module', 32)->nullable();
            $table->integer('position')->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_type_fees');
    }
};
