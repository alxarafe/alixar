<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('accounting_fiscalyear', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('label', 128);
            $table->date('date_start')->nullable();
            $table->date('date_end')->nullable();
            $table->integer('statut')->default(0);
            $table->integer('entity')->default(1);
            $table->dateTime('datec');
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('accounting_fiscalyear');
    }
};
