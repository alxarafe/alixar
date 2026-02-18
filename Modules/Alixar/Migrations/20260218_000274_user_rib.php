<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('user_rib', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_user');
            $table->integer('entity')->default(1);
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('label', 30)->nullable();
            $table->string('bank', 255)->nullable();
            $table->string('code_banque', 128)->nullable();
            $table->string('code_guichet', 6)->nullable();
            $table->string('number', 255)->nullable();
            $table->string('cle_rib', 5)->nullable();
            $table->string('bic', 11)->nullable();
            $table->string('bic_intermediate', 11)->nullable();
            $table->string('iban_prefix', 80)->nullable();
            $table->string('domiciliation', 255)->nullable();
            $table->string('proprio', 60)->nullable();
            $table->string('owner_address', 255)->nullable();
            $table->integer('state_id')->nullable();
            $table->integer('fk_country')->nullable();
            $table->string('currency_code', 3)->nullable();
            $table->integer('default_rib')->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('user_rib');
    }
};
