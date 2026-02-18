<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('user_rights', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->integer('fk_user');
            $table->integer('fk_id');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('user_rights');
    }
};
