<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('chargesociales', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 16)->nullable();
            $table->dateTime('date_ech');
            $table->string('libelle', 80);
            $table->integer('entity')->default(1);
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('date_creation')->nullable();
            $table->dateTime('date_valid')->nullable();
            $table->integer('fk_user')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->integer('fk_type');
            $table->integer('fk_account')->nullable();
            $table->integer('fk_mode_reglement')->nullable();
            $table->decimal('amount')->nullable();
            $table->integer('paye')->default(0);
            $table->date('periode')->nullable();
            $table->integer('fk_projet')->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('chargesociales');
    }
};
