<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('payment_vat', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_tva')->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datep')->nullable();
            $table->decimal('amount')->nullable();
            $table->integer('fk_typepaiement');
            $table->string('num_paiement', 50)->nullable();
            $table->text('note')->nullable();
            $table->integer('fk_bank');
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('payment_vat');
    }
};
