<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('extrafields', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('name', 64);
            $table->integer('entity')->default(1);
            $table->string('elementtype', 64)->default('member');
            $table->string('label', 255);
            $table->string('type', 8)->nullable();
            $table->string('size', 8)->nullable();
            $table->text('fieldcomputed')->nullable();
            $table->text('fielddefault')->nullable();
            $table->integer('fieldunique')->nullable()->default(0);
            $table->integer('fieldrequired')->nullable()->default(0);
            $table->string('perms', 255)->nullable();
            $table->string('enabled', 255)->nullable();
            $table->string('module', 64)->nullable();
            $table->integer('pos')->nullable()->default(0);
            $table->integer('alwayseditable')->nullable()->default(0);
            $table->text('param')->nullable();
            $table->string('list', 255)->nullable()->default('1');
            $table->integer('printable')->nullable()->default(0);
            $table->integer('totalizable')->nullable()->default(0);
            $table->string('langs', 64)->nullable();
            $table->text('help')->nullable();
            $table->string('css', 128)->nullable();
            $table->string('cssview', 128)->nullable();
            $table->string('csslist', 128)->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('extrafields');
    }
};
