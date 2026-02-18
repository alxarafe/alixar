<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_prospectlevel', function (Blueprint $table) {
            $table->string('code', 12);
            $table->string('label', 128)->nullable();
            $table->integer('sortorder')->nullable();
            $table->integer('active')->default(1);
            $table->string('module', 32)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_prospectlevel');
    }
};
