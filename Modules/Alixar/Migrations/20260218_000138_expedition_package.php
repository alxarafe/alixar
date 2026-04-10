<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('expedition_package', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_expedition');
            $table->string('description', 255)->nullable();
            $table->decimal('value')->nullable();
            $table->integer('fk_package_type')->nullable();
            $table->decimal('height')->nullable();
            $table->decimal('width')->nullable();
            $table->decimal('size')->nullable();
            $table->integer('size_units')->nullable();
            $table->decimal('weight')->nullable();
            $table->integer('weight_units')->nullable();
            $table->string('dangerous_goods', 20)->nullable()->default('0');
            $table->integer('tail_lift')->nullable()->default(0);
            $table->integer('rang')->nullable()->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('expedition_package');
    }
};
