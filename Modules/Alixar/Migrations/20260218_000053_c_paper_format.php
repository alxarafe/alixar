<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_paper_format', function (Blueprint $table) {
            $table->id();
            $table->string('code', 16);
            $table->string('label', 128);
            $table->decimal('width')->nullable();
            $table->decimal('height')->nullable();
            $table->string('unit', 5);
            $table->integer('active')->default(1);
            $table->string('module', 32)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_paper_format');
    }
};
