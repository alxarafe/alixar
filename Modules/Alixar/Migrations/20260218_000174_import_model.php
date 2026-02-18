<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('import_model', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(0);
            $table->integer('fk_user')->default(0);
            $table->string('label', 50);
            $table->string('type', 64);
            $table->text('field');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('import_model');
    }
};
