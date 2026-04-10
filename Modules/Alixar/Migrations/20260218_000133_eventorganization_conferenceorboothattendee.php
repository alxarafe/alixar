<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('eventorganization_conferenceorboothattendee', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('ref', 128);
            $table->integer('fk_soc')->nullable();
            $table->integer('fk_actioncomm')->nullable();
            $table->integer('fk_project');
            $table->integer('fk_invoice')->nullable();
            $table->string('email', 128)->nullable();
            $table->string('email_company', 128)->nullable();
            $table->string('firstname', 100)->nullable();
            $table->string('lastname', 100)->nullable();
            $table->dateTime('date_subscription')->nullable();
            $table->decimal('amount')->nullable();
            $table->text('note_public')->nullable();
            $table->text('note_private')->nullable();
            $table->dateTime('date_creation');
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->string('last_main_doc', 255)->nullable();
            $table->string('ip', 250)->nullable();
            $table->string('import_key', 14)->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->integer('status');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('eventorganization_conferenceorboothattendee');
    }
};
