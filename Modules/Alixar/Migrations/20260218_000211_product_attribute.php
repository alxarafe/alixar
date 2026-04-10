<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product_attribute', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 255);
            $table->string('ref_ext', 255)->nullable();
            $table->string('label', 255);
            $table->integer('position')->default(0);
            $table->integer('entity')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product_attribute');
    }
};
