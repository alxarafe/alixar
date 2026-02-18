<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('accounting_journal', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->string('code', 32);
            $table->string('label', 128);
            $table->integer('nature')->default(1);
            $table->integer('active')->nullable()->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('accounting_journal');
    }
};
