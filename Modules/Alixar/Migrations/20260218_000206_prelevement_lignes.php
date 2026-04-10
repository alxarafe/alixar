<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('prelevement_lignes', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_prelevement_bons')->nullable();
            $table->integer('fk_soc');
            $table->integer('fk_user')->nullable();
            $table->integer('statut')->nullable()->default(0);
            $table->string('client_nom', 255)->nullable();
            $table->decimal('amount')->nullable();
            $table->string('code_banque', 128)->nullable();
            $table->string('code_guichet', 6)->nullable();
            $table->string('number', 255)->nullable();
            $table->string('cle_rib', 5)->nullable();
            $table->text('note')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('prelevement_lignes');
    }
};
