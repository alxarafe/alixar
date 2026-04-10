<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('printing', function (Blueprint $table) {
            $table->id("rowid");
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datec')->nullable();
            $table->text('printer_name');
            $table->text('printer_location');
            $table->string('printer_id', 255);
            $table->integer('copy')->default(1);
            $table->string('module', 16);
            $table->string('driver', 16);
            $table->integer('userid')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('printing');
    }
};
