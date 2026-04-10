<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_invoice_subtype', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->integer('fk_country');
            $table->string('code', 5);
            $table->string('label', 200)->nullable();
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_invoice_subtype');
    }
};
