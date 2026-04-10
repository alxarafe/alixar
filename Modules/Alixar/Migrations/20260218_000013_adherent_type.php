<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('adherent_type', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('statut')->default(0);
            $table->string('libelle', 50);
            $table->string('morphy', 3);
            $table->string('duration', 6)->nullable();
            $table->string('subscription', 3)->default('1');
            $table->decimal('amount')->nullable();
            $table->integer('caneditamount')->nullable()->default(0);
            $table->string('vote', 3)->default('1');
            $table->text('note')->nullable();
            $table->text('mail_valid')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('adherent_type');
    }
};
