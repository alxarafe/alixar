<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('multicurrency', function (Blueprint $table) {
            $table->id();
            $table->dateTime('date_create')->nullable();
            $table->string('code', 255)->nullable();
            $table->string('name', 255)->nullable();
            $table->integer('entity')->nullable()->default(1);
            $table->integer('fk_user')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('multicurrency');
    }
};
