<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('adherent', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 30);
            $table->integer('entity')->default(1);
            $table->string('ref_ext', 128)->nullable();
            $table->string('gender', 10)->nullable();
            $table->string('civility', 6)->nullable();
            $table->string('lastname', 50)->nullable();
            $table->string('firstname', 50)->nullable();
            $table->string('login', 50)->nullable();
            $table->string('pass', 50)->nullable();
            $table->string('pass_crypted', 128)->nullable();
            $table->integer('fk_adherent_type');
            $table->string('morphy', 3);
            $table->string('societe', 128)->nullable();
            $table->integer('fk_soc')->nullable();
            $table->text('address')->nullable();
            $table->string('zip', 30)->nullable();
            $table->string('town', 50)->nullable();
            $table->integer('state_id')->nullable();
            $table->integer('country')->nullable();
            $table->string('email', 255)->nullable();
            $table->string('url', 255)->nullable();
            $table->text('socialnetworks')->nullable();
            $table->string('phone', 30)->nullable();
            $table->string('phone_perso', 30)->nullable();
            $table->string('phone_mobile', 30)->nullable();
            $table->date('birth')->nullable();
            $table->string('photo', 255)->nullable();
            $table->integer('statut')->default(0);
            $table->integer('public')->default(0);
            $table->dateTime('datefin')->nullable();
            $table->string('default_lang', 6)->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->dateTime('datevalid')->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_mod')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->string('canvas', 32)->nullable();
            $table->string('ip', 250)->nullable();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('adherent');
    }
};
