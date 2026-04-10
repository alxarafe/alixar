<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_holiday_types', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->string('code', 16);
            $table->string('label', 255);
            $table->integer('affect');
            $table->integer('delay');
            $table->decimal('newbymonth')->nullable();
            $table->integer('fk_country')->nullable();
            $table->integer('block_if_negative')->default(0);
            $table->integer('sortorder')->nullable();
            $table->integer('active')->nullable()->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_holiday_types');
    }
};
