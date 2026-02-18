<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('accounting_account', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('fk_pcg_version', 32);
            $table->string('pcg_type', 60);
            $table->string('account_number', 32);
            $table->integer('account_parent')->nullable()->default(0);
            $table->string('label', 255);
            $table->string('labelshort', 255)->nullable();
            $table->integer('fk_accounting_category')->nullable()->default(0);
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('active')->default(1);
            $table->integer('reconcilable')->default(0);
            $table->string('import_key', 14)->nullable();
            $table->string('extraparams', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('accounting_account');
    }
};
