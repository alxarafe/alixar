<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('accounting_bookkeeping', function (Blueprint $table) {
            $table->id("rowid");
            $table->integer('entity')->default(1);
            $table->integer('piece_num');
            $table->date('doc_date');
            $table->string('doc_type', 30);
            $table->string('doc_ref', 300);
            $table->integer('fk_doc');
            $table->integer('fk_docdet');
            $table->string('thirdparty_code', 32)->nullable();
            $table->string('subledger_account', 32)->nullable();
            $table->string('subledger_label', 255)->nullable();
            $table->string('numero_compte', 32);
            $table->string('label_compte', 255);
            $table->string('label_operation', 255)->nullable();
            $table->decimal('debit')->nullable();
            $table->decimal('credit')->nullable();
            $table->decimal('montant')->nullable();
            $table->string('sens', 1)->nullable();
            $table->decimal('multicurrency_amount')->nullable();
            $table->string('multicurrency_code', 255)->nullable();
            $table->string('lettering_code', 255)->nullable();
            $table->dateTime('date_lettering')->nullable();
            $table->dateTime('date_lim_reglement')->nullable();
            $table->integer('fk_user_author');
            $table->integer('fk_user_modif')->nullable();
            $table->dateTime('date_creation')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_user')->nullable();
            $table->string('code_journal', 32);
            $table->string('journal_label', 255)->nullable();
            $table->dateTime('date_validated')->nullable();
            $table->dateTime('date_export')->nullable();
            $table->string('import_key', 14)->nullable();
            $table->string('extraparams', 255)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('accounting_bookkeeping');
    }
};
