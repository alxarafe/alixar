<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('element_time', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref_ext', 32)->nullable();
            $table->integer('fk_element');
            $table->string('elementtype', 32);
            $table->date('element_date')->nullable();
            $table->dateTime('element_datehour')->nullable();
            $table->integer('element_date_withhour')->nullable();
            $table->decimal('element_duration')->nullable();
            $table->integer('fk_product')->nullable();
            $table->integer('fk_user')->nullable();
            $table->decimal('thm')->nullable();
            $table->integer('invoice_id')->nullable();
            $table->integer('invoice_line_id')->nullable();
            $table->integer('intervention_id')->nullable();
            $table->integer('intervention_line_id')->nullable();
            $table->string('import_key', 14)->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->text('note')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('element_time');
    }
};
