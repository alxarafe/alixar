<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('receptiondet_batch', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_reception')->nullable();
            $table->integer('fk_element')->nullable();
            $table->integer('fk_elementdet')->nullable();
            $table->string('element_type', 50)->default('supplier_order');
            $table->integer('fk_product')->nullable();
            $table->decimal('qty')->nullable();
            $table->integer('fk_entrepot')->nullable();
            $table->integer('fk_projet')->nullable();
            $table->string('comment', 255)->nullable();
            $table->string('batch', 128)->nullable();
            $table->date('eatby')->nullable();
            $table->date('sellby')->nullable();
            $table->integer('status')->nullable();
            $table->integer('fk_user')->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->decimal('cost_price')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('receptiondet_batch');
    }
};
