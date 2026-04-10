<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('delivery', function (Blueprint $table) {
            $table->id("rowid");
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('ref', 30);
            $table->integer('entity')->default(1);
            $table->integer('fk_soc');
            $table->string('ref_ext', 255)->nullable();
            $table->string('ref_customer', 255)->nullable();
            $table->dateTime('date_creation')->nullable();
            $table->integer('fk_user_author')->nullable();
            $table->dateTime('date_valid')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->dateTime('date_delivery')->nullable();
            $table->integer('fk_address')->nullable();
            $table->integer('fk_statut')->nullable()->default(0);
            $table->decimal('total_ht')->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('last_main_doc', 255)->nullable();
            $table->integer('fk_incoterms')->nullable();
            $table->string('location_incoterms', 255)->nullable();
            $table->string('import_key', 14)->nullable();
            $table->string('extraparams', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('delivery');
    }
};
