<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_stcommcontact', function (Blueprint $table) {
            $table->integer('id');
            $table->string('code', 12);
            $table->string('libelle', 128)->nullable();
            $table->string('picto', 128)->nullable();
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_stcommcontact');
    }
};
