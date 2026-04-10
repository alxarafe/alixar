<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('blockedlog_authority', function (Blueprint $table) {
            $table->id("rowid");
            $table->text('blockchain');
            $table->string('signature', 100);
            $table->dateTime('tms')->nullable()->useCurrent();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('blockedlog_authority');
    }
};
