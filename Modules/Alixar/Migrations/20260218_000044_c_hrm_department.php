<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_hrm_department', function (Blueprint $table) {
            $table->id();
            $table->integer('pos')->default(0);
            $table->string('code', 16);
            $table->string('label', 128)->nullable();
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_hrm_department');
    }
};
