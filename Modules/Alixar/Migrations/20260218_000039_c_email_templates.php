<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_email_templates', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->string('module', 32)->nullable();
            $table->string('type_template', 32)->nullable();
            $table->string('lang', 6)->nullable()->default('');
            $table->integer('private')->default(0);
            $table->integer('fk_user')->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('label', 180)->nullable();
            $table->integer('position')->nullable();
            $table->integer('defaultfortype')->nullable()->default(0);
            $table->string('enabled', 255)->nullable()->default('1');
            $table->integer('active')->default(1);
            $table->string('email_from', 255)->nullable();
            $table->string('email_to', 255)->nullable();
            $table->string('email_tocc', 255)->nullable();
            $table->string('email_tobcc', 255)->nullable();
            $table->text('topic')->nullable();
            $table->text('joinfiles')->nullable();
            $table->text('content')->nullable();
            $table->text('content_lines')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_email_templates');
    }
};
