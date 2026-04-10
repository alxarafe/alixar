<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('pos_cash_fence', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->string('ref', 64)->nullable();
            $table->string('label', 255)->nullable();
            $table->decimal('opening')->nullable();
            $table->decimal('cash')->nullable();
            $table->decimal('card')->nullable();
            $table->decimal('cheque')->nullable();
            $table->integer('status')->nullable();
            $table->dateTime('date_creation');
            $table->dateTime('date_valid')->nullable();
            $table->integer('day_close')->nullable();
            $table->integer('month_close')->nullable();
            $table->integer('year_close')->nullable();
            $table->string('posmodule', 30)->nullable();
            $table->string('posnumber', 30)->nullable();
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->dateTime('tms')->nullable();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('pos_cash_fence');
    }
};
