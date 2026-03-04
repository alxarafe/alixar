<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('societe', function (Blueprint $table) {
            $table->bigIncrements('rowid');
            $table->string('nom', 128)->nullable();
            $table->string('name_alias', 128)->nullable();
            $table->integer('entity')->default(1);
            $table->string('ref_ext', 255)->nullable();
            $table->integer('statut')->nullable()->default(0);
            $table->integer('parent')->nullable();
            $table->integer('status')->nullable()->default(1);
            $table->string('code_client', 24)->nullable();
            $table->string('code_fournisseur', 24)->nullable();
            $table->string('tp_payment_reference', 25)->nullable();
            $table->string('accountancy_code_customer_general', 32)->nullable();
            $table->string('code_compta', 32)->nullable();
            $table->string('accountancy_code_supplier_general', 32)->nullable();
            $table->string('code_compta_fournisseur', 32)->nullable();
            $table->string('address', 255)->nullable();
            $table->string('zip', 25)->nullable();
            $table->string('town', 50)->nullable();
            $table->integer('fk_departement')->nullable()->default(0);
            $table->integer('fk_pays')->nullable()->default(0);
            $table->decimal('geolat')->nullable();
            $table->decimal('geolong')->nullable();
            $table->integer('geopoint')->nullable();
            $table->string('georesultcode', 16)->nullable();
            $table->string('phone', 20)->nullable();
            $table->string('phone_mobile', 20)->nullable();
            $table->string('fax', 20)->nullable();
            $table->string('url', 255)->nullable();
            $table->string('email', 128)->nullable();
            $table->integer('fk_account')->nullable()->default(0);
            $table->text('socialnetworks')->nullable();
            $table->integer('fk_effectif')->nullable()->default(0);
            $table->integer('fk_typent')->nullable();
            $table->integer('fk_forme_juridique')->nullable()->default(0);
            $table->string('fk_currency', 3)->nullable();
            $table->string('siren', 128)->nullable();
            $table->string('siret', 128)->nullable();
            $table->string('ape', 128)->nullable();
            $table->string('idprof1', 128)->nullable();
            $table->string('idprof2', 128)->nullable();
            $table->string('idprof3', 128)->nullable();
            $table->string('idprof4', 128)->nullable();
            $table->string('idprof5', 128)->nullable();
            $table->string('idprof6', 128)->nullable();
            $table->string('tva_intra', 20)->nullable();
            $table->decimal('capital')->nullable();
            $table->integer('fk_stcomm')->default(0);
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->string('model_pdf', 255)->nullable();
            $table->string('last_main_doc', 255)->nullable();
            $table->string('prefix_comm', 5)->nullable();
            $table->integer('client')->nullable()->default(0);
            $table->integer('fournisseur')->nullable()->default(0);
            $table->string('supplier_account', 32)->nullable();
            $table->string('fk_prospectlevel', 12)->nullable();
            $table->integer('fk_incoterms')->nullable();
            $table->string('location_incoterms', 255)->nullable();
            $table->integer('customer_bad')->nullable()->default(0);
            $table->decimal('customer_rate')->nullable()->default(0);
            $table->decimal('supplier_rate')->nullable()->default(0);
            $table->decimal('remise_client')->nullable()->default(0);
            $table->decimal('remise_supplier')->nullable()->default(0);
            $table->integer('mode_reglement')->nullable();
            $table->integer('cond_reglement')->nullable();
            $table->string('deposit_percent', 63)->nullable();
            $table->integer('transport_mode')->nullable();
            $table->integer('mode_reglement_supplier')->nullable();
            $table->integer('cond_reglement_supplier')->nullable();
            $table->integer('transport_mode_supplier')->nullable();
            $table->integer('fk_shipping_method')->nullable();
            $table->integer('tva_assuj')->nullable()->default(1);
            $table->integer('vat_reverse_charge')->nullable()->default(0);
            $table->integer('localtax1_assuj')->nullable()->default(0);
            $table->decimal('localtax1_value')->nullable();
            $table->integer('localtax2_assuj')->nullable()->default(0);
            $table->decimal('localtax2_value')->nullable();
            $table->string('barcode', 180)->nullable();
            $table->integer('fk_barcode_type')->nullable()->default(0);
            $table->integer('price_level')->nullable();
            $table->decimal('outstanding_limit')->nullable();
            $table->decimal('order_min_amount')->nullable();
            $table->decimal('supplier_order_min_amount')->nullable();
            $table->string('default_lang', 6)->nullable();
            $table->string('logo', 255)->nullable();
            $table->string('logo_squarred', 255)->nullable();
            $table->string('canvas', 32)->nullable();
            $table->integer('fk_warehouse')->nullable();
            $table->string('webservices_url', 255)->nullable();
            $table->string('webservices_key', 128)->nullable();
            $table->string('accountancy_code_sell', 32)->nullable();
            $table->string('accountancy_code_buy', 32)->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('datec')->nullable();
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_multicurrency')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->string('ip', 250)->nullable();
            $table->string('import_key', 14)->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('societe');
    }
};
