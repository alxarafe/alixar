<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('cronjob', function (Blueprint $table) {
            $table->id();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datec')->nullable();
            $table->string('jobtype', 10);
            $table->string('label', 255);
            $table->string('command', 255)->nullable();
            $table->string('classesname', 255)->nullable();
            $table->string('objectname', 255)->nullable();
            $table->string('methodename', 255)->nullable();
            $table->text('params')->nullable();
            $table->string('md5params', 32)->nullable();
            $table->string('module_name', 255)->nullable();
            $table->integer('priority')->nullable()->default(0);
            $table->dateTime('datelastrun')->nullable();
            $table->dateTime('datenextrun')->nullable();
            $table->dateTime('datestart')->nullable();
            $table->dateTime('dateend')->nullable();
            $table->dateTime('datelastresult')->nullable();
            $table->text('lastresult')->nullable();
            $table->text('lastoutput')->nullable();
            $table->string('unitfrequency', 255)->default('3600');
            $table->integer('frequency')->default(0);
            $table->integer('maxrun')->default(0);
            $table->integer('nbrun')->nullable();
            $table->integer('autodelete')->nullable()->default(0);
            $table->integer('status')->default(1);
            $table->integer('processing')->default(0);
            $table->integer('pid')->nullable();
            $table->string('test', 255)->nullable()->default('1');
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_mod')->nullable();
            $table->integer('fk_mailing')->nullable();
            $table->text('note')->nullable();
            $table->string('libname', 255)->nullable();
            $table->string('email_alert', 128)->nullable();
            $table->integer('entity')->nullable()->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('cronjob');
    }
};
