<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('projet_task', function (Blueprint $table) {
            $table->id();
            $table->string('ref', 50)->nullable();
            $table->integer('entity')->default(1);
            $table->integer('fk_projet');
            $table->integer('fk_task_parent')->default(0);
            $table->dateTime('datec')->nullable();
            $table->dateTime('tms')->nullable()->useCurrent();
            $table->dateTime('dateo')->nullable();
            $table->dateTime('datee')->nullable();
            $table->dateTime('datev')->nullable();
            $table->string('label', 255);
            $table->text('description')->nullable();
            $table->decimal('duration_effective')->nullable()->default(0);
            $table->decimal('planned_workload')->nullable()->default(0);
            $table->integer('progress')->nullable()->default(0);
            $table->integer('priority')->nullable()->default(0);
            $table->decimal('budget_amount')->nullable();
            $table->integer('fk_user_creat')->nullable();
            $table->integer('fk_user_modif')->nullable();
            $table->integer('fk_user_valid')->nullable();
            $table->integer('fk_statut')->default(0);
            $table->text('note_private')->nullable();
            $table->text('note_public')->nullable();
            $table->integer('rang')->nullable()->default(0);
            $table->string('model_pdf', 255)->nullable();
            $table->string('import_key', 14)->nullable();
            $table->integer('billable')->nullable()->default(1);
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('projet_task');
    }
};
