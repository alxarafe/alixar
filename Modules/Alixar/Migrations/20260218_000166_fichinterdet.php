<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('fichinterdet', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_fichinter')->nullable();
            $table->integer('fk_parent_line')->nullable();
            $table->dateTime('date')->nullable();
            $table->text('description')->nullable();
            $table->integer('duree')->nullable();
            $table->integer('rang')->nullable()->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('fichinterdet');
    }
};
