<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('localtax', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->integer('localtaxtype')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->date('datep')->nullable();
            $table->date('datev')->nullable();
            $table->decimal('amount')->nullable();
            $table->string('label', 255)->nullable();
            $table->text('note')->nullable();
            $table->integer('fk_bank')->nullable();
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('localtax');
    }
};
