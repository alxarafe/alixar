<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('holiday_users', function (Blueprint $table) {
            $table->integer('fk_user');
            $table->integer('fk_type');
            $table->decimal('nb_holiday')->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('holiday_users');
    }
};
