<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('oauth_token', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('service', 36)->nullable();
            $table->text('token')->nullable();
            $table->text('tokenstring')->nullable();
            $table->text('state')->nullable();
            $table->integer('fk_soc')->nullable();
            $table->integer('fk_user')->nullable();
            $table->integer('fk_adherent')->nullable();
            $table->string('restricted_ips', 200)->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('entity')->nullable()->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('oauth_token');
    }
};
