<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('expeditiondet_batch', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_expeditiondet');
            $table->date('eatby')->nullable();
            $table->date('sellby')->nullable();
            $table->string('batch', 128)->nullable();
            $table->decimal('qty')->default(0);
            $table->integer('fk_origin_stock');
            $table->integer('fk_warehouse')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('expeditiondet_batch');
    }
};
