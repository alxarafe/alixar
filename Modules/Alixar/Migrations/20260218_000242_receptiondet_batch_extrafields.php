<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('receptiondet_batch_extrafields', function (Blueprint $table) {
            $table->id("rowid");
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_object');
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('receptiondet_batch_extrafields');
    }
};
