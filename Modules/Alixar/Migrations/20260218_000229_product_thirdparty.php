<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('product_thirdparty', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_product');
            $table->integer('fk_soc');
            $table->integer('fk_product_thirdparty_relation_type');
            $table->dateTime('date_start')->nullable();
            $table->dateTime('date_end')->nullable();
            $table->integer('fk_project')->nullable();
            $table->text('description')->nullable();
            $table->text('note_public')->nullable();
            $table->text('note_private')->nullable();
            $table->dateTime('date_creation');
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_creat');
            $table->integer('fk_user_modif')->nullable();
            $table->string('last_main_doc', 255)->nullable();
            $table->string('import_key', 14)->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->integer('status')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('product_thirdparty');
    }
};
