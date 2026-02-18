<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('socpeople', function (Blueprint $table) {
            $table->id();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_soc')->nullable();
            $table->integer('entity')->default(1);
            $table->string('ref_ext', 255)->nullable();
            $table->string('name_alias', 255)->nullable();
            $table->integer('fk_parent')->nullable();
            $table->string('civility', 6)->nullable();
            $table->string('lastname', 50)->nullable();
            $table->string('firstname', 50)->nullable();
            $table->string('address', 255)->nullable();
            $table->string('zip', 25)->nullable();
            $table->string('town', 255)->nullable();
            $table->integer('fk_departement')->nullable();
            $table->integer('fk_pays')->nullable()->default(0);
            $table->decimal('geolat')->nullable();
            $table->decimal('geolong')->nullable();
            $table->integer('geopoint')->nullable();
            $table->string('georesultcode', 16)->nullable();
            $table->date('birthday')->nullable();
            $table->string('poste', 255)->nullable();
            $table->string('phone', 30)->nullable();
            $table->string('phone_perso', 30)->nullable();
            $table->string('phone_mobile', 30)->nullable();
            $table->string('fax', 30)->nullable();
            $table->string('url', 255)->nullable();
            $table->string('email', 255)->nullable();
            $table->text('socialnetworks')->nullable();
            $table->string('photo', 255)->nullable();
            $table->integer('no_email')->default(0);
            $table->integer('priv')->default(0);
            $table->string('fk_prospectlevel', 12)->nullable();
            $table->integer('fk_stcommcontact')->default(0);
            $table->integer('fk_user_creat')->nullable()->default(0);
            $table->integer('fk_user_modif')->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->string('default_lang', 6)->nullable();
            $table->string('canvas', 32)->nullable();
            $table->string('import_key', 14)->nullable();
            $table->integer('statut')->default(1);
            $table->string('ip', 250)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('socpeople');
    }
};
