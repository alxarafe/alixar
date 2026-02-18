<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('usergroup', function (Blueprint $table) {
            $table->id();
            $table->string('nom', 180);
            $table->integer('entity')->default(1);
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->text('note')->nullable();
            $table->string('model_pdf', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('usergroup');
    }
};
