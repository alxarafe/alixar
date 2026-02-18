<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('societe_commerciaux', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_soc')->nullable();
            $table->integer('fk_user')->nullable();
            $table->string('fk_c_type_contact_code', 32)->default('SALESREPTHIRD');
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('societe_commerciaux');
    }
};
