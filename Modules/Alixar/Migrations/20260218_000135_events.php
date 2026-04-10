<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('events', function (Blueprint $table) {
            $table->id("rowid");
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('type', 32);
            $table->integer('entity')->default(1);
            $table->string('prefix_session', 255)->nullable();
            $table->dateTime('dateevent')->nullable();
            $table->integer('fk_user')->nullable();
            $table->string('description', 250);
            $table->string('ip', 250);
            $table->string('user_agent', 255)->nullable();
            $table->integer('fk_object')->nullable();
            $table->string('authentication_method', 64)->nullable();
            $table->integer('fk_oauth_token')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('events');
    }
};
