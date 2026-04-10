<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_revenuestamp', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('fk_pays');
            $table->decimal('taux');
            $table->string('revenuestamp_type', 16)->default('fixed');
            $table->string('note', 128)->nullable();
            $table->integer('active')->default(1);
            $table->string('accountancy_code_sell', 32)->nullable();
            $table->string('accountancy_code_buy', 32)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_revenuestamp');
    }
};
