<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('bank_account', function (Blueprint $table) {
            $table->id();
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->string('ref', 12);
            $table->string('label', 50);
            $table->integer('entity')->default(1);
            $table->integer('fk_user_author')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->string('bank', 60)->nullable();
            $table->string('code_banque', 128)->nullable();
            $table->string('code_guichet', 6)->nullable();
            $table->string('number', 255)->nullable();
            $table->string('cle_rib', 5)->nullable();
            $table->string('bic', 11)->nullable();
            $table->string('bic_intermediate', 11)->nullable();
            $table->string('iban_prefix', 80)->nullable();
            $table->string('country_iban', 2)->nullable();
            $table->string('cle_iban', 2)->nullable();
            $table->string('domiciliation', 255)->nullable();
            $table->integer('pti_in_ctti')->nullable()->default(0);
            $table->integer('state_id')->nullable();
            $table->integer('fk_pays');
            $table->string('proprio', 60)->nullable();
            $table->string('owner_address', 255)->nullable();
            $table->string('owner_zip', 25)->nullable();
            $table->string('owner_town', 50)->nullable();
            $table->integer('owner_country_id')->nullable();
            $table->integer('courant')->default(0);
            $table->integer('clos')->default(0);
            $table->integer('rappro')->nullable()->default(1);
            $table->string('url', 128)->nullable();
            $table->string('account_number', 32)->nullable();
            $table->integer('fk_accountancy_journal')->nullable();
            $table->string('currency_code', 3);
            $table->integer('min_allowed')->nullable()->default(0);
            $table->integer('min_desired')->nullable()->default(0);
            $table->text('comment')->nullable();
            $table->text('note_public')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('import_key', 14)->nullable();
            $table->string('extraparams', 255)->nullable();
            $table->string('ics', 32)->nullable();
            $table->string('ics_transfer', 32)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('bank_account');
    }
};
