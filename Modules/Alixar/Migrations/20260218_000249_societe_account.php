<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('societe_account', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->nullable()->default(1);
            $table->string('login', 128);
            $table->string('pass_encoding', 24)->nullable();
            $table->string('pass_crypted', 128)->nullable();
            $table->string('pass_temp', 128)->nullable();
            $table->integer('fk_soc')->nullable();
            $table->integer('fk_website')->nullable();
            $table->string('site', 128);
            $table->string('site_account', 128)->nullable();
            $table->string('key_account', 128)->nullable();
            $table->text('note_private')->nullable();
            $table->dateTime('date_last_login')->nullable();
            $table->dateTime('date_previous_login')->nullable();
            $table->dateTime('date_last_reset_password')->nullable();
            $table->dateTime('date_creation');
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_creat');
            $table->integer('fk_user_modif')->nullable();
            $table->string('import_key', 14)->nullable();
            $table->integer('status')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('societe_account');
    }
};
