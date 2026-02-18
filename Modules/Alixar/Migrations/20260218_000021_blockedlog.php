<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('blockedlog', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->dateTime('date_creation')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('action', 50)->nullable();
            $table->decimal('amounts')->nullable();
            $table->string('element', 50)->nullable();
            $table->integer('fk_user')->nullable();
            $table->string('user_fullname', 255)->nullable();
            $table->integer('fk_object')->nullable();
            $table->string('ref_object', 255)->nullable();
            $table->dateTime('date_object')->nullable();
            $table->string('signature', 100);
            $table->string('signature_line', 100);
            $table->text('object_data')->nullable();
            $table->string('object_version', 32)->nullable()->default('');
            $table->integer('certified')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('blockedlog');
    }
};
