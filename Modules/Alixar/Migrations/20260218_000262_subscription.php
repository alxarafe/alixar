<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('subscription', function (Blueprint $table) {
            $table->id();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datec')->nullable();
            $table->integer('fk_adherent')->nullable();
            $table->integer('fk_type')->nullable();
            $table->dateTime('dateadh')->nullable();
            $table->dateTime('datef')->nullable();
            $table->decimal('subscription')->nullable();
            $table->integer('fk_bank')->nullable();
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->text('note')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('subscription');
    }
};
