<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('entrepot', function (Blueprint $table) {
            $table->id();
            $table->string('ref', 255);
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('entity')->default(1);
            $table->integer('fk_project')->nullable();
            $table->text('description')->nullable();
            $table->string('lieu', 64)->nullable();
            $table->string('address', 255)->nullable();
            $table->string('zip', 10)->nullable();
            $table->string('town', 50)->nullable();
            $table->integer('fk_departement')->nullable();
            $table->integer('fk_pays')->nullable()->default(0);
            $table->string('phone', 20)->nullable();
            $table->string('fax', 20)->nullable();
            $table->string('barcode', 180)->nullable();
            $table->integer('fk_barcode_type')->nullable();
            $table->integer('warehouse_usage')->nullable()->default(1);
            $table->integer('statut')->nullable()->default(1);
            $table->integer('fk_user_author')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('import_key', 14)->nullable();
            $table->integer('fk_parent')->nullable()->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('entrepot');
    }
};
