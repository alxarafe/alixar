<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('actioncomm_reminder', function (Blueprint $table) {
            $table->id("rowid");
            $table->dateTime('dateremind');
            $table->string('typeremind', 32);
            $table->integer('fk_user');
            $table->integer('offsetvalue');
            $table->string('offsetunit', 1);
            $table->integer('status')->default(0);
            $table->dateTime('datedone')->nullable();
            $table->string('lasterror', 128)->nullable();
            $table->integer('entity')->default(1);
            $table->integer('fk_actioncomm');
            $table->integer('fk_email_template')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('actioncomm_reminder');
    }
};
