<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('menu', function (Blueprint $table) {
            $table->id();
            $table->string('menu_handler', 16);
            $table->integer('entity')->default(1);
            $table->string('module', 255)->nullable();
            $table->string('type', 4);
            $table->string('mainmenu', 100);
            $table->string('leftmenu', 100)->nullable();
            $table->integer('fk_menu');
            $table->string('fk_mainmenu', 100)->nullable();
            $table->string('fk_leftmenu', 100)->nullable();
            $table->integer('position');
            $table->text('url');
            $table->string('target', 100)->nullable();
            $table->string('titre', 255);
            $table->string('prefix', 255)->nullable();
            $table->string('langs', 100)->nullable();
            $table->integer('level')->nullable();
            $table->text('perms')->nullable();
            $table->text('enabled')->nullable();
            $table->integer('usertype')->default(0);
            $table->dateTime('tms')->nullable()->useCurrent();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('menu');
    }
};
