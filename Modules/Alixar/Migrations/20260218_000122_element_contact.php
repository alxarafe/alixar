<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('element_contact', function (Blueprint $table) {
            $table->id();
            $table->dateTime('datecreate')->nullable();
            $table->integer('statut')->nullable()->default(5);
            $table->integer('element_id');
            $table->integer('fk_c_type_contact');
            $table->integer('fk_socpeople');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('element_contact');
    }
};
