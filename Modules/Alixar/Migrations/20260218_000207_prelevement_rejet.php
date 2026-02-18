<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('prelevement_rejet', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_prelevement_lignes')->nullable();
            $table->dateTime('date_rejet')->nullable();
            $table->integer('motif')->nullable();
            $table->dateTime('date_creation')->nullable();
            $table->integer('fk_user_creation')->nullable();
            $table->text('note')->nullable();
            $table->integer('afacturer')->nullable()->default(0);
            $table->integer('fk_facture')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('prelevement_rejet');
    }
};
