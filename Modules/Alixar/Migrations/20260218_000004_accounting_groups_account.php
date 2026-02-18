<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('accounting_groups_account', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_accounting_account');
            $table->integer('fk_c_accounting_category');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('accounting_groups_account');
    }
};
