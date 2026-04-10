<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('tva', function (Blueprint $table) {
            $table->id("rowid");
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datec')->nullable();
            $table->date('datep')->nullable();
            $table->date('datev')->nullable();
            $table->decimal('amount')->nullable();
            $table->integer('fk_typepayment')->nullable();
            $table->string('num_payment', 50)->nullable();
            $table->string('label', 255)->nullable();
            $table->integer('entity')->default(1);
            $table->text('note')->nullable();
            $table->integer('paye')->default(0);
            $table->integer('fk_account')->nullable();
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('tva');
    }
};
