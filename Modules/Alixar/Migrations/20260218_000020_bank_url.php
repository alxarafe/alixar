<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('bank_url', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_bank')->nullable();
            $table->integer('url_id')->nullable();
            $table->string('url', 255)->nullable();
            $table->string('label', 255)->nullable();
            $table->string('type', 24);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('bank_url');
    }
};
