<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('rights_def', function (Blueprint $table) {
            $table->integer('id');
            $table->integer('entity')->default(1);
            $table->string('libelle', 255)->nullable();
            $table->string('module', 64)->nullable();
            $table->string('module_origin', 64)->nullable();
            $table->integer('module_position')->default(0);
            $table->integer('family_position')->default(0);
            $table->string('perms', 50)->nullable();
            $table->string('subperms', 50)->nullable();
            $table->string('type', 1)->nullable();
            $table->integer('bydefault')->nullable()->default(0);
            $table->text('enabled')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('rights_def');
    }
};
