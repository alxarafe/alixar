<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('paiement', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 30)->nullable();
            $table->string('ref_ext', 255)->nullable();
            $table->integer('entity')->default(1);
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datep')->nullable();
            $table->decimal('amount')->nullable();
            $table->decimal('multicurrency_amount')->nullable();
            $table->integer('fk_paiement');
            $table->string('num_paiement', 50)->nullable();
            $table->text('note')->nullable();
            $table->string('ext_payment_id', 255)->nullable();
            $table->string('ext_payment_site', 128)->nullable();
            $table->integer('fk_bank')->default(0);
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('statut')->default(0);
            $table->integer('fk_export_compta')->default(0);
            $table->decimal('pos_change')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('paiement');
    }
};
