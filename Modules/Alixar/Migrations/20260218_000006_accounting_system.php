<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('accounting_system', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_country')->nullable();
            $table->string('pcg_version', 32);
            $table->string('label', 128);
            $table->integer('active')->nullable()->default(0);
            $table->dateTime('date_creation')->nullable();
            $table->integer('fk_user_author')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('accounting_system');
    }
};
