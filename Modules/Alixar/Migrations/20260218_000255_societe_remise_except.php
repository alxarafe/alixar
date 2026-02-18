<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('societe_remise_except', function (Blueprint $table) {
            $table->id();
            $table->integer('entity')->default(1);
            $table->integer('fk_soc');
            $table->integer('discount_type')->default(0);
            $table->dateTime('datec')->nullable();
            $table->decimal('amount_ht')->nullable();
            $table->decimal('amount_tva')->nullable();
            $table->decimal('amount_ttc')->nullable();
            $table->decimal('tva_tx')->nullable();
            $table->string('vat_src_code', 10)->nullable()->default('');
            $table->integer('fk_user');
            $table->integer('fk_facture_line')->nullable();
            $table->integer('fk_facture')->nullable();
            $table->integer('fk_facture_source')->nullable();
            $table->integer('fk_invoice_supplier_line')->nullable();
            $table->integer('fk_invoice_supplier')->nullable();
            $table->integer('fk_invoice_supplier_source')->nullable();
            $table->text('description');
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_tx')->nullable();
            $table->decimal('multicurrency_amount_ht')->nullable();
            $table->decimal('multicurrency_amount_tva')->nullable();
            $table->decimal('multicurrency_amount_ttc')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('societe_remise_except');
    }
};
