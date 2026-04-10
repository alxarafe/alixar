<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('holiday_config', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('name', 128);
            $table->text('value')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('holiday_config');
    }
};
