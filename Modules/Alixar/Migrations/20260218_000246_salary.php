<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('salary', function (Blueprint $table) {
            $table->id();
            $table->string('ref', 30)->nullable();
            $table->string('ref_ext', 255)->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datec')->nullable();
            $table->integer('fk_user');
            $table->date('datep')->nullable();
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
            $table->text('note_public')->nullable();
            $table->integer('fk_bank')->nullable();
            $table->integer('paye')->default(0);
            $table->integer('fk_account')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('salary');
    }
};
