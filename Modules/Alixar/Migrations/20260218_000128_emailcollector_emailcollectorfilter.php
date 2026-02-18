<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('emailcollector_emailcollectorfilter', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_emailcollector');
            $table->string('type', 128);
            $table->string('rulevalue', 128)->nullable();
            $table->dateTime('date_creation');
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_creat');
            $table->integer('fk_user_modif')->nullable();
            $table->string('import_key', 14)->nullable();
            $table->integer('status');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('emailcollector_emailcollectorfilter');
    }
};
