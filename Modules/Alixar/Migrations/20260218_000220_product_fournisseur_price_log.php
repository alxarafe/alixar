<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product_fournisseur_price_log', function (Blueprint $table) {
            $table->id();
            $table->dateTime('datec')->nullable();
            $table->integer('fk_product_fournisseur');
            $table->decimal('price')->nullable();
            $table->decimal('quantity')->nullable();
            $table->integer('fk_user')->nullable();
            $table->integer('fk_multicurrency')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_tx')->nullable();
            $table->decimal('multicurrency_unitprice')->nullable();
            $table->decimal('multicurrency_price')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product_fournisseur_price_log');
    }
};
