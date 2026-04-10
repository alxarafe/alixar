<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('overwrite_trans', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->string('lang', 5)->nullable();
            $table->string('transkey', 128)->nullable();
            $table->text('transvalue')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('overwrite_trans');
    }
};
