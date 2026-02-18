<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_lead_status', function (Blueprint $table) {
            $table->id();
            $table->string('code', 10)->nullable();
            $table->string('label', 128)->nullable();
            $table->integer('position')->nullable();
            $table->decimal('percent')->nullable();
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_lead_status');
    }
};
