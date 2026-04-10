<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('notify_def_object', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->string('objet_type', 16)->nullable();
            $table->integer('objet_id');
            $table->string('type_notif', 16)->nullable()->default('browser');
            $table->dateTime('date_notif')->nullable();
            $table->integer('user_id')->nullable();
            $table->string('moreparam', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('notify_def_object');
    }
};
