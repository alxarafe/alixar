<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('categorie', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->integer('fk_parent')->default(0);
            $table->string('label', 180);
            $table->string('ref_ext', 255)->nullable();
            $table->integer('type')->default(1);
            $table->text('description')->nullable();
            $table->string('color', 8)->nullable();
            $table->integer('position')->nullable()->default(0);
            $table->integer('fk_soc')->nullable();
            $table->integer('visible')->default(1);
            $table->dateTime('date_creation')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('categorie');
    }
};
