<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('mailing_unsubscribe', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->string('email', 255)->nullable();
            $table->string('unsubscribegroup', 128)->nullable()->default('');
            $table->string('ip', 128)->nullable();
            $table->dateTime('date_creat')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('mailing_unsubscribe');
    }
};
