<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_tva', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->integer('fk_pays');
            $table->integer('fk_department_buyer')->nullable();
            $table->string('code', 10)->nullable()->default('');
            $table->integer('type_vat')->default(0);
            $table->decimal('taux');
            $table->string('localtax1', 20)->default('0');
            $table->string('localtax1_type', 10)->default('0');
            $table->string('localtax2', 20)->default('0');
            $table->string('localtax2_type', 10)->default('0');
            $table->integer('use_default')->nullable()->default(0);
            $table->integer('recuperableonly')->default(0);
            $table->string('note', 128)->nullable();
            $table->integer('active')->default(1);
            $table->string('accountancy_code_sell', 32)->nullable();
            $table->string('accountancy_code_buy', 32)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_tva');
    }
};
