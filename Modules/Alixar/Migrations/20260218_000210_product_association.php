<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product_association', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_product_pere')->default(0);
            $table->integer('fk_product_fils')->default(0);
            $table->decimal('qty')->nullable();
            $table->integer('incdec')->nullable()->default(1);
            $table->integer('rang')->nullable()->default(0);
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product_association');
    }
};
