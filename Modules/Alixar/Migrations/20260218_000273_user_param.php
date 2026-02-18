<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('user_param', function (Blueprint $table) {
            $table->integer('fk_user');
            $table->integer('entity')->default(1);
            $table->string('param', 180);
            $table->text('value');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('user_param');
    }
};
