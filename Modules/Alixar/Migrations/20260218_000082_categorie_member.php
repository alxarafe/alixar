<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('categorie_member', function (Blueprint $table) {
            $table->integer('fk_categorie');
            $table->integer('fk_member');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('categorie_member');
    }
};
