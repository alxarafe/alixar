<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_transport_mode', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->string('code', 3);
            $table->string('label', 255);
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_transport_mode');
    }
};
