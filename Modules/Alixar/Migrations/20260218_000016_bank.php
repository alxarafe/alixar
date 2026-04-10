<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('bank', function (Blueprint $table) {
            $table->id("rowid");
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->date('datev')->nullable();
            $table->date('dateo')->nullable();
            $table->decimal('amount')->nullable();
            $table->decimal('amount_main_currency')->nullable();
            $table->string('label', 255)->nullable();
            $table->integer('fk_account')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_rappro')->nullable();
            $table->string('fk_type', 6)->nullable();
            $table->string('num_releve', 50)->nullable();
            $table->string('num_chq', 50)->nullable();
            $table->string('numero_compte', 32)->nullable();
            $table->integer('rappro')->nullable()->default(0);
            $table->text('note')->nullable();
            $table->integer('fk_bordereau')->nullable()->default(0);
            $table->integer('position')->nullable()->default(0);
            $table->string('banque', 255)->nullable();
            $table->string('emetteur', 255)->nullable();
            $table->string('author', 40)->nullable();
            $table->integer('origin_id')->nullable();
            $table->string('origin_type', 64)->nullable();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('bank');
    }
};
