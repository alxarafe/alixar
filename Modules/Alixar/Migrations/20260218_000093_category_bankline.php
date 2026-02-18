<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('category_bankline', function (Blueprint $table) {
            $table->integer('lineid');
            $table->integer('fk_categ');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('category_bankline');
    }
};
