<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('prelevement_bons', function (Blueprint $table) {
            $table->id();
            $table->string('type', 16)->nullable()->default('debit-order');
            $table->string('ref', 12)->nullable();
            $table->integer('entity')->default(1);
            $table->dateTime('datec')->nullable();
            $table->decimal('amount')->nullable();
            $table->integer('statut')->nullable()->default(0);
            $table->integer('credite')->nullable()->default(0);
            $table->text('note')->nullable();
            $table->dateTime('date_trans')->nullable();
            $table->integer('method_trans')->nullable();
            $table->integer('fk_user_trans')->nullable();
            $table->dateTime('date_credit')->nullable();
            $table->integer('fk_user_credit')->nullable();
            $table->integer('fk_bank_account')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('prelevement_bons');
    }
};
