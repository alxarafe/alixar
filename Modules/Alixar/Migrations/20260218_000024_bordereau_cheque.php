<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('bordereau_cheque', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 30);
            $table->string('label', 255)->nullable();
            $table->string('ref_ext', 255)->nullable();
            $table->string('type', 6)->nullable()->default('CHQ');
            $table->dateTime('datec');
            $table->date('date_bordereau')->nullable();
            $table->decimal('amount')->nullable();
            $table->integer('nbcheque');
            $table->integer('fk_bank_account')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('statut')->default(0);
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->text('note')->nullable();
            $table->integer('entity')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('bordereau_cheque');
    }
};
