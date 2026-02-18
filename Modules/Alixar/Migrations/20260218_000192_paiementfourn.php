<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('paiementfourn', function (Blueprint $table) {
            $table->id();
            $table->string('ref', 30)->nullable();
            $table->integer('entity')->nullable()->default(1);
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datec')->nullable();
            $table->dateTime('datep')->nullable();
            $table->decimal('amount')->nullable();
            $table->decimal('multicurrency_amount')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_paiement');
            $table->string('num_paiement', 50)->nullable();
            $table->text('note')->nullable();
            $table->integer('fk_bank');
            $table->integer('statut')->default(0);
            $table->string('model_pdf', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('paiementfourn');
    }
};
