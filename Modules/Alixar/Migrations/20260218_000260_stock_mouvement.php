<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('stock_mouvement', function (Blueprint $table) {
            $table->id();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datem')->nullable();
            $table->integer('fk_product');
            $table->string('batch', 128)->nullable();
            $table->date('eatby')->nullable();
            $table->date('sellby')->nullable();
            $table->integer('fk_entrepot');
            $table->decimal('value')->nullable();
            $table->decimal('price')->nullable();
            $table->integer('type_mouvement')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->string('label', 255)->nullable();
            $table->string('inventorycode', 128)->nullable();
            $table->integer('fk_project')->nullable();
            $table->integer('fk_origin')->nullable();
            $table->string('origintype', 64)->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->integer('fk_projet')->default(0);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('stock_mouvement');
    }
};
