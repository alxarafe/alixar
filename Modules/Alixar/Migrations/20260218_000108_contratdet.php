<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('contratdet', function (Blueprint $table) {
            $table->id("rowid");
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->integer('fk_contrat');
            $table->integer('fk_product')->nullable();
            $table->integer('statut')->nullable()->default(0);
            $table->text('label')->nullable();
            $table->text('description')->nullable();
            $table->integer('fk_remise_except')->nullable();
            $table->dateTime('date_commande')->nullable();
            $table->dateTime('date_ouverture_prevue')->nullable();
            $table->dateTime('date_ouverture')->nullable();
            $table->dateTime('date_fin_validite')->nullable();
            $table->dateTime('date_cloture')->nullable();
            $table->string('vat_src_code', 10)->nullable()->default('');
            $table->decimal('tva_tx')->nullable();
            $table->decimal('localtax1_tx')->nullable();
            $table->string('localtax1_type', 10)->nullable();
            $table->decimal('localtax2_tx')->nullable();
            $table->string('localtax2_type', 10)->nullable();
            $table->decimal('qty');
            $table->decimal('remise_percent')->nullable()->default(0);
            $table->decimal('subprice')->nullable();
            $table->decimal('subprice_ttc')->nullable();
            $table->decimal('price_ht')->nullable();
            $table->decimal('remise')->nullable()->default(0);
            $table->decimal('total_ht')->nullable();
            $table->decimal('total_tva')->nullable();
            $table->decimal('total_localtax1')->nullable();
            $table->decimal('total_localtax2')->nullable();
            $table->decimal('total_ttc')->nullable();
            $table->integer('product_type')->nullable()->default(1);
            $table->integer('info_bits')->nullable()->default(0);
            $table->integer('rang')->nullable()->default(0);
            $table->decimal('buy_price_ht')->nullable();
            $table->integer('fk_product_fournisseur_price')->nullable();
            $table->integer('fk_user_author')->default(0);
            $table->integer('fk_user_ouverture')->nullable();
            $table->integer('fk_user_cloture')->nullable();
            $table->text('commentaire')->nullable();
            $table->integer('fk_unit')->nullable();
            $table->integer('fk_multicurrency')->nullable();
            $table->string('multicurrency_code', 3)->nullable();
            $table->decimal('multicurrency_subprice')->nullable();
            $table->decimal('multicurrency_subprice_ttc')->nullable();
            $table->decimal('multicurrency_total_ht')->nullable();
            $table->decimal('multicurrency_total_tva')->nullable();
            $table->decimal('multicurrency_total_ttc')->nullable();
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('contratdet');
    }
};
