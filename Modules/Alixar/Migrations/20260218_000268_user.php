<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('user', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->string('ref_employee', 50)->nullable();
            $table->string('ref_ext', 50)->nullable();
            $table->integer('admin')->nullable()->default(0);
            $table->integer('employee')->nullable()->default(1);
            $table->integer('fk_establishment')->nullable()->default(0);
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->string('login', 50);
            $table->string('pass_encoding', 24)->nullable();
            $table->string('pass', 128)->nullable();
            $table->string('pass_crypted', 128)->nullable();
            $table->string('pass_temp', 128)->nullable();
            $table->string('api_key', 128)->nullable();
            $table->string('gender', 10)->nullable();
            $table->string('civility', 6)->nullable();
            $table->string('lastname', 50)->nullable();
            $table->string('firstname', 50)->nullable();
            $table->string('address', 255)->nullable();
            $table->string('zip', 25)->nullable();
            $table->string('town', 50)->nullable();
            $table->integer('fk_state')->nullable()->default(0);
            $table->integer('fk_country')->nullable()->default(0);
            $table->date('birth')->nullable();
            $table->string('birth_place', 64)->nullable();
            $table->string('job', 128)->nullable();
            $table->string('office_phone', 20)->nullable();
            $table->string('office_fax', 20)->nullable();
            $table->string('user_mobile', 20)->nullable();
            $table->string('personal_mobile', 20)->nullable();
            $table->string('email', 255)->nullable();
            $table->string('personal_email', 255)->nullable();
            $table->string('email_oauth2', 255)->nullable();
            $table->text('signature')->nullable();
            $table->text('socialnetworks')->nullable();
            $table->integer('fk_soc')->nullable();
            $table->integer('fk_socpeople')->nullable();
            $table->integer('fk_member')->nullable();
            $table->integer('fk_user')->nullable();
            $table->integer('fk_user_expense_validator')->nullable();
            $table->integer('fk_user_holiday_validator')->nullable();
            $table->string('national_registration_number', 50)->nullable();
            $table->string('idpers1', 128)->nullable();
            $table->string('idpers2', 128)->nullable();
            $table->string('idpers3', 128)->nullable();
            $table->text('note_public')->nullable();
            $table->text('note_private')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('last_main_doc', 255)->nullable();
            $table->dateTime('datelastlogin')->nullable();
            $table->dateTime('datepreviouslogin')->nullable();
            $table->dateTime('datelastpassvalidation')->nullable();
            $table->dateTime('datestartvalidity')->nullable();
            $table->dateTime('dateendvalidity')->nullable();
            $table->dateTime('flagdelsessionsbefore')->nullable();
            $table->string('iplastlogin', 250)->nullable();
            $table->string('ippreviouslogin', 250)->nullable();
            $table->string('ldap_sid', 255)->nullable();
            $table->string('openid', 255)->nullable();
            $table->integer('statut')->nullable()->default(1);
            $table->string('photo', 255)->nullable();
            $table->string('lang', 6)->nullable();
            $table->string('color', 6)->nullable();
            $table->string('barcode', 255)->nullable();
            $table->integer('fk_barcode_type')->nullable()->default(0);
            $table->string('accountancy_code_user_general', 32)->nullable();
            $table->string('accountancy_code', 32)->nullable();
            $table->integer('nb_holiday')->nullable()->default(0);
            $table->decimal('thm')->nullable();
            $table->decimal('tjm')->nullable();
            $table->decimal('salary')->nullable();
            $table->decimal('salaryextra')->nullable();
            $table->date('dateemployment')->nullable();
            $table->date('dateemploymentend')->nullable();
            $table->decimal('weeklyhours')->nullable();
            $table->string('import_key', 14)->nullable();
            $table->integer('default_range')->nullable();
            $table->integer('default_c_exp_tax_cat')->nullable();
            $table->integer('fk_warehouse')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('user');
    }
};
