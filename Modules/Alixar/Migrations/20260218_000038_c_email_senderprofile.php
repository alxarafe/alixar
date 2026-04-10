<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_email_senderprofile', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->integer('private')->default(0);
            $table->dateTime('date_creation')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('label', 255)->nullable();
            $table->string('email', 255);
            $table->text('signature')->nullable();
            $table->integer('position')->nullable()->default(0);
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_email_senderprofile');
    }
};
