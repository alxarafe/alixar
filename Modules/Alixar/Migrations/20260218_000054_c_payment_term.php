<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_payment_term', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->string('code', 16)->nullable();
            $table->integer('sortorder')->nullable();
            $table->integer('active')->nullable()->default(1);
            $table->string('libelle', 255)->nullable();
            $table->text('libelle_facture')->nullable();
            $table->integer('type_cdr')->nullable();
            $table->integer('nbjour')->nullable();
            $table->integer('decalage')->nullable();
            $table->string('deposit_percent', 63)->nullable();
            $table->string('module', 32)->nullable();
            $table->integer('position')->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_payment_term');
    }
};
