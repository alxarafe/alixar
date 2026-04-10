<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('boxes_def', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('file', 200);
            $table->integer('entity')->default(1);
            $table->integer('fk_user')->default(0);
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('note', 130)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('boxes_def');
    }
};
