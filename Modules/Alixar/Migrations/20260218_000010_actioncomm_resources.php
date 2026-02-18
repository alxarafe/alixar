<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('actioncomm_resources', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_actioncomm');
            $table->string('element_type', 50);
            $table->integer('fk_element');
            $table->string('answer_status', 50)->nullable();
            $table->integer('mandatory')->nullable();
            $table->integer('transparency')->nullable()->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('actioncomm_resources');
    }
};
