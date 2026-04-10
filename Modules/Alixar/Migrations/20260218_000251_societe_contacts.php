<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('societe_contacts', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->dateTime('date_creation');
            $table->integer('fk_soc');
            $table->integer('fk_c_type_contact');
            $table->integer('fk_socpeople');
            $table->dateTime('tms')->nullable();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('societe_contacts');
    }
};
