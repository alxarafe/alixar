<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('boxes', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->integer('box_id');
            $table->integer('position');
            $table->string('box_order', 3);
            $table->integer('fk_user')->default(0);
            $table->integer('maxline')->nullable();
            $table->string('params', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('boxes');
    }
};
