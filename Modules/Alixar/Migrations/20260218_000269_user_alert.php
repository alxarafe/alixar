<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('user_alert', function (Blueprint $table) {
            $table->id();
            $table->integer('type')->nullable();
            $table->integer('fk_contact')->nullable();
            $table->integer('fk_user')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('user_alert');
    }
};
