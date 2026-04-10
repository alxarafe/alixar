<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_socialnetworks', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->string('code', 100)->nullable();
            $table->string('label', 150)->nullable();
            $table->text('url')->nullable();
            $table->string('icon', 20)->nullable();
            $table->integer('active')->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_socialnetworks');
    }
};
