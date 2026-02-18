<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('holiday_logs', function (Blueprint $table) {
            $table->id();
            $table->dateTime('date_action');
            $table->integer('fk_user_action');
            $table->integer('fk_user_update');
            $table->integer('fk_type');
            $table->string('type_action', 255);
            $table->string('prev_solde', 255);
            $table->string('new_solde', 255);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('holiday_logs');
    }
};
