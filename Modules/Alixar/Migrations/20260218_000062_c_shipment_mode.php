<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_shipment_mode', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('code', 30);
            $table->string('libelle', 128);
            $table->text('description')->nullable();
            $table->string('tracking', 255)->nullable();
            $table->integer('active')->nullable()->default(0);
            $table->string('module', 32)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_shipment_mode');
    }
};
