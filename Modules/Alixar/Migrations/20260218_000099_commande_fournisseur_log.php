<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('commande_fournisseur_log', function (Blueprint $table) {
            $table->id();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datelog');
            $table->integer('fk_commande');
            $table->integer('fk_statut');
            $table->integer('fk_user');
            $table->string('comment', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('commande_fournisseur_log');
    }
};
