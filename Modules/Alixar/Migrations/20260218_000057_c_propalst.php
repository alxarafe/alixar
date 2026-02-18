<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_propalst', function (Blueprint $table) {
            $table->integer('id');
            $table->string('code', 12);
            $table->string('label', 128)->nullable();
            $table->integer('sortorder')->nullable()->default(0);
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_propalst');
    }
};
