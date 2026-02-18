<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_action_trigger', function (Blueprint $table) {
            $table->id();
            $table->string('elementtype', 64);
            $table->string('code', 128);
            $table->string('contexts', 255)->nullable();
            $table->string('label', 128);
            $table->string('description', 255)->nullable();
            $table->integer('rang')->nullable()->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_action_trigger');
    }
};
