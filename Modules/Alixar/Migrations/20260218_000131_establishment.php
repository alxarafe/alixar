<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('establishment', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->string('ref', 30)->nullable();
            $table->string('label', 255);
            $table->string('name', 128)->nullable();
            $table->string('address', 255)->nullable();
            $table->string('zip', 25)->nullable();
            $table->string('town', 50)->nullable();
            $table->integer('fk_state')->nullable()->default(0);
            $table->integer('fk_country')->nullable()->default(0);
            $table->string('profid1', 20)->nullable();
            $table->string('profid2', 20)->nullable();
            $table->string('profid3', 20)->nullable();
            $table->string('phone', 20)->nullable();
            $table->integer('fk_user_author');
            $table->integer('fk_user_mod')->nullable();
            $table->dateTime('datec');
            $table->dateTime('tms')->useCurrent();
            $table->integer('status')->nullable()->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('establishment');
    }
};
