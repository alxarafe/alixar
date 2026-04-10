<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('paymentexpensereport_expensereport', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_payment')->nullable();
            $table->integer('fk_expensereport')->nullable();
            $table->decimal('amount')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_tx')->nullable();
            $table->decimal('multicurrency_amount')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('paymentexpensereport_expensereport');
    }
};
