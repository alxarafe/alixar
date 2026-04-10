<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('propal_merge_pdf_product', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_product');
            $table->string('file_name', 200);
            $table->string('lang', 5)->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_mod');
            $table->dateTime('datec');
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('propal_merge_pdf_product');
    }
};
