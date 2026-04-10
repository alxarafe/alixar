<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('reception', function (Blueprint $table) {
            $table->id("rowid");
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('ref', 30);
            $table->integer('entity')->default(1);
            $table->integer('fk_soc');
            $table->integer('fk_projet')->nullable();
            $table->string('ref_ext', 30)->nullable();
            $table->string('ref_supplier', 255)->nullable();
            $table->dateTime('date_creation')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->dateTime('date_valid')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->dateTime('date_delivery')->nullable();
            $table->dateTime('date_reception')->nullable();
            $table->integer('fk_shipping_method')->nullable();
            $table->string('tracking_number', 50)->nullable();
            $table->integer('fk_statut')->nullable()->default(0);
            $table->integer('billed')->nullable()->default(0);
            $table->decimal('height')->nullable();
            $table->decimal('width')->nullable();
            $table->integer('size_units')->nullable();
            $table->decimal('size')->nullable();
            $table->integer('weight_units')->nullable();
            $table->decimal('weight')->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->integer('fk_incoterms')->nullable();
            $table->string('location_incoterms', 255)->nullable();
            $table->string('import_key', 14)->nullable();
            $table->string('extraparams', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('reception');
    }
};
