<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('comment', function (Blueprint $table) {
            $table->id("rowid");
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->text('description');
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_element')->nullable();
            $table->string('element_type', 50)->nullable();
            $table->integer('entity')->nullable()->default(1);
            $table->string('import_key', 125)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('comment');
    }
};
