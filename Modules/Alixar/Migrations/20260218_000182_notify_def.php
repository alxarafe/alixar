<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('notify_def', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->nullable()->default(1);
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->date('datec')->nullable();
            $table->integer('fk_action');
            $table->integer('fk_soc')->nullable();
            $table->integer('fk_contact')->nullable();
            $table->integer('fk_user')->nullable();
            $table->string('email', 255)->nullable();
            $table->decimal('threshold')->nullable();
            $table->string('context', 128)->nullable();
            $table->string('type', 16)->nullable()->default('email');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('notify_def');
    }
};
