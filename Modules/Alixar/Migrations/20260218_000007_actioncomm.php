<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('actioncomm', function (Blueprint $table) {
            $table->id();
            $table->string('ref', 30);
            $table->string('ref_ext', 255)->nullable();
            $table->integer('entity')->default(1);
            $table->dateTime('datep')->nullable();
            $table->dateTime('datep2')->nullable();
            $table->integer('fk_action')->nullable();
            $table->string('code', 50)->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_mod')->nullable();
            $table->integer('fk_project')->nullable();
            $table->integer('fk_task')->nullable();
            $table->integer('fk_soc')->nullable();
            $table->integer('fk_contact')->nullable();
            $table->integer('fk_parent')->default(0);
            $table->integer('fk_user_action')->nullable();
            $table->integer('transparency')->nullable();
            $table->integer('priority')->nullable();
            $table->string('visibility', 12)->nullable()->default('default');
            $table->integer('fulldayevent')->default(0);
            $table->integer('percent')->default(0);
            $table->string('location', 128)->nullable();
            $table->decimal('durationp')->nullable();
            $table->string('label', 255);
            $table->text('note')->nullable();
            $table->integer('calling_duration')->nullable();
            $table->string('email_subject', 255)->nullable();
            $table->string('email_msgid', 255)->nullable();
            $table->string('email_from', 255)->nullable();
            $table->string('email_sender', 255)->nullable();
            $table->string('email_to', 255)->nullable();
            $table->string('email_tocc', 255)->nullable();
            $table->string('email_tobcc', 255)->nullable();
            $table->string('errors_to', 255)->nullable();
            $table->string('reply_to', 255)->nullable();
            $table->string('recurid', 128)->nullable();
            $table->string('recurrule', 128)->nullable();
            $table->dateTime('recurdateend')->nullable();
            $table->integer('num_vote')->nullable();
            $table->integer('event_paid')->default(0);
            $table->integer('status')->default(0);
            $table->integer('fk_element')->nullable();
            $table->string('elementtype', 255)->nullable();
            $table->string('ip', 250)->nullable();
            $table->integer('fk_bookcal_calendar')->nullable();
            $table->string('import_key', 14)->nullable();
            $table->string('extraparams', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('actioncomm');
    }
};
