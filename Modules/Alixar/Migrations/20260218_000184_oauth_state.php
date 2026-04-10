<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('oauth_state', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('service', 36)->nullable();
            $table->string('state', 128)->nullable();
            $table->integer('fk_user')->nullable();
            $table->integer('fk_adherent')->nullable();
            $table->integer('entity')->nullable()->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('oauth_state');
    }
};
