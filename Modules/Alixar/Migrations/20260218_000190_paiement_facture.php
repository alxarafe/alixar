<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('paiement_facture', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_paiement')->nullable();
            $table->integer('fk_facture')->nullable();
            $table->decimal('amount')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_tx')->nullable();
            $table->decimal('multicurrency_amount')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('paiement_facture');
    }
};
