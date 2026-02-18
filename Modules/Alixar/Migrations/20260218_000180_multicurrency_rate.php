<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('multicurrency_rate', function (Blueprint $table) {
            $table->id();
            $table->dateTime('date_sync')->nullable();
            $table->decimal('rate')->default(0);
            $table->decimal('rate_indirect')->nullable()->default(0);
            $table->integer('fk_multicurrency');
            $table->integer('entity')->nullable()->default(1);
            $table->dateTime('tms')->nullable()->useCurrent();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('multicurrency_rate');
    }
};
