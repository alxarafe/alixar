<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('user_employment', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->string('ref', 50)->nullable();
            $table->string('ref_ext', 50)->nullable();
            $table->integer('fk_user')->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->string('job', 128)->nullable();
            $table->integer('status');
            $table->decimal('salary')->nullable();
            $table->decimal('salaryextra')->nullable();
            $table->decimal('weeklyhours')->nullable();
            $table->date('dateemployment')->nullable();
            $table->date('dateemploymentend')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('user_employment');
    }
};
