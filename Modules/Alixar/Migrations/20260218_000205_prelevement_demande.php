<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('prelevement_demande', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->integer('fk_facture')->nullable();
            $table->integer('fk_facture_fourn')->nullable();
            $table->integer('fk_salary')->nullable();
            $table->string('sourcetype', 32)->nullable();
            $table->decimal('amount')->nullable();
            $table->dateTime('date_demande');
            $table->integer('traite')->nullable()->default(0);
            $table->dateTime('date_traite')->nullable();
            $table->integer('fk_prelevement_bons')->nullable();
            $table->integer('fk_user_demande');
            $table->integer('fk_societe_rib')->nullable();
            $table->string('code_banque', 128)->nullable();
            $table->string('code_guichet', 6)->nullable();
            $table->string('number', 255)->nullable();
            $table->string('cle_rib', 5)->nullable();
            $table->string('type', 12)->nullable()->default('');
            $table->string('ext_payment_id', 255)->nullable();
            $table->string('ext_payment_site', 128)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('prelevement_demande');
    }
};
