<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('onlinesignature', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->string('object_type', 32);
            $table->integer('object_id');
            $table->dateTime('datec');
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('name', 255);
            $table->string('ip', 128)->nullable();
            $table->string('pathoffile', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('onlinesignature');
    }
};
