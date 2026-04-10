<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('societe_rib', function (Blueprint $table) {
            $table->id("rowid");
            $table->string('type', 32)->default('ban');
            $table->string('label', 200)->nullable();
            $table->integer('fk_soc');
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('bank', 255)->nullable();
            $table->string('code_banque', 128)->nullable();
            $table->string('code_guichet', 6)->nullable();
            $table->string('number', 255)->nullable();
            $table->string('cle_rib', 5)->nullable();
            $table->string('bic', 20)->nullable();
            $table->string('bic_intermediate', 11)->nullable();
            $table->string('iban_prefix', 80)->nullable();
            $table->string('domiciliation', 255)->nullable();
            $table->string('proprio', 60)->nullable();
            $table->string('owner_address', 255)->nullable();
            $table->integer('default_rib')->default(0);
            $table->integer('state_id')->nullable();
            $table->integer('fk_country')->nullable();
            $table->string('currency_code', 3)->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('last_main_doc', 255)->nullable();
            $table->string('rum', 32)->nullable();
            $table->date('date_rum')->nullable();
            $table->string('frstrecur', 16)->nullable()->default('FRST');
            $table->string('last_four', 4)->nullable();
            $table->string('card_type', 255)->nullable();
            $table->string('cvn', 255)->nullable();
            $table->integer('exp_date_month')->nullable();
            $table->integer('exp_date_year')->nullable();
            $table->string('country_code', 10)->nullable();
            $table->integer('approved')->nullable()->default(0);
            $table->string('email', 255)->nullable();
            $table->date('ending_date')->nullable();
            $table->decimal('max_total_amount_of_all_payments')->nullable();
            $table->string('preapproval_key', 255)->nullable();
            $table->date('starting_date')->nullable();
            $table->decimal('total_amount_of_all_payments')->nullable();
            $table->string('stripe_card_ref', 128)->nullable();
            $table->string('stripe_account', 128)->nullable();
            $table->string('ext_payment_site', 128)->nullable();
            $table->string('extraparams', 255)->nullable();
            $table->dateTime('date_signature')->nullable();
            $table->string('online_sign_ip', 48)->nullable();
            $table->string('online_sign_name', 64)->nullable();
            $table->string('comment', 255)->nullable();
            $table->string('ipaddress', 68)->nullable();
            $table->integer('status')->default(1);
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('societe_rib');
    }
};
