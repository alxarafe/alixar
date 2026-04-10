<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_product_thirdparty_relation_type', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('code', 24);
            $table->string('label', 128)->nullable();
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_product_thirdparty_relation_type');
    }
};
