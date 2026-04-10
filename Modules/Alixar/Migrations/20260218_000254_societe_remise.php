<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('societe_remise', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->integer('fk_soc');
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datec')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->decimal('remise_client')->nullable();
            $table->text('note')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('societe_remise');
    }
};
