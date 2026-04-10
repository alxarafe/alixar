<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('payment_salary', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 30)->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datec')->nullable();
            $table->integer('fk_user')->nullable();
            $table->dateTime('datep')->nullable();
            $table->date('datev')->nullable();
            $table->decimal('salary')->nullable();
            $table->decimal('amount')->nullable();
            $table->integer('fk_projet')->nullable();
            $table->integer('fk_typepayment');
            $table->string('num_payment', 50)->nullable();
            $table->string('label', 255)->nullable();
            $table->date('datesp')->nullable();
            $table->date('dateep')->nullable();
            $table->integer('entity')->default(1);
            $table->text('note')->nullable();
            $table->integer('fk_bank')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_salary')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('payment_salary');
    }
};
