<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('user_clicktodial', function (Blueprint $table) {
            $table->integer('fk_user');
            $table->string('url', 255)->nullable();
            $table->string('login', 32)->nullable();
            $table->string('pass', 64)->nullable();
            $table->string('poste', 20)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('user_clicktodial');
    }
};
