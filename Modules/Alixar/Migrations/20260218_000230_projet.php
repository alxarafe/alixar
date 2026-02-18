<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('projet', function (Blueprint $table) {
            $table->id();
            $table->integer('fk_project')->nullable();
            $table->integer('fk_soc')->nullable();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->date('dateo')->nullable();
            $table->date('datee')->nullable();
            $table->string('ref', 50)->nullable();
            $table->string('ref_ext', 50)->nullable();
            $table->integer('entity')->default(1);
            $table->string('title', 255);
            $table->text('description')->nullable();
            $table->integer('fk_user_creat');
            $table->integer('fk_user_modif')->nullable();
            $table->integer('public')->nullable();
            $table->integer('fk_statut')->default(0);
            $table->integer('fk_opp_status')->nullable();
            $table->decimal('opp_percent')->nullable();
            $table->integer('fk_opp_status_end')->nullable();
            $table->dateTime('date_close')->nullable();
            $table->integer('fk_user_close')->nullable();
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->string('email_msgid', 175)->nullable();
            $table->dateTime('email_date')->nullable();
            $table->decimal('opp_amount')->nullable();
            $table->decimal('budget_amount')->nullable();
            $table->integer('usage_opportunity')->nullable()->default(0);
            $table->integer('usage_task')->nullable()->default(1);
            $table->integer('usage_bill_time')->nullable()->default(0);
            $table->integer('usage_organize_event')->nullable()->default(0);
            $table->dateTime('date_start_event')->nullable();
            $table->dateTime('date_end_event')->nullable();
            $table->string('location', 255)->nullable();
            $table->integer('accept_conference_suggestions')->nullable()->default(0);
            $table->integer('accept_booth_suggestions')->nullable()->default(0);
            $table->integer('max_attendees')->nullable()->default(0);
            $table->decimal('price_registration')->nullable();
            $table->decimal('price_booth')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('ip', 250)->nullable();
            $table->string('last_main_doc', 255)->nullable();
            $table->string('import_key', 14)->nullable();
            $table->string('extraparams', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('projet');
    }
};
