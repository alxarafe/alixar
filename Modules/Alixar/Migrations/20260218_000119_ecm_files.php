<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('ecm_files', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 128)->nullable();
            $table->string('label', 128);
            $table->string('share', 128)->nullable();
            $table->string('share_pass', 32)->nullable();
            $table->integer('entity')->default(1);
            $table->string('filepath', 255);
            $table->string('filename', 255);
            $table->string('src_object_type', 64)->nullable();
            $table->integer('src_object_id')->nullable();
            $table->integer('agenda_id')->nullable();
            $table->string('fullpath_orig', 750)->nullable();
            $table->string('description', 255)->nullable();
            $table->string('keywords', 750)->nullable();
            $table->text('content')->nullable();
            $table->string('cover', 32)->nullable();
            $table->integer('position')->nullable();
            $table->string('gen_or_uploaded', 12)->nullable();
            $table->string('extraparams', 255)->nullable();
            $table->dateTime('date_c')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_c')->nullable();
            $table->integer('fk_user_m')->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->text('acl')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('ecm_files');
    }
};
