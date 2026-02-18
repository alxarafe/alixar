<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

return new class extends Migration {
    public function up(): void
    {
        Capsule::schema()->create('c_format_cards', function (Blueprint $table) {
            $table->id();
            $table->string('code', 50);
            $table->string('name', 50);
            $table->string('paper_size', 20);
            $table->string('orientation', 1);
            $table->string('metric', 5);
            $table->decimal('leftmargin')->nullable();
            $table->decimal('topmargin')->nullable();
            $table->integer('nx');
            $table->integer('ny');
            $table->decimal('spacex')->nullable();
            $table->decimal('spacey')->nullable();
            $table->decimal('width')->nullable();
            $table->decimal('height')->nullable();
            $table->integer('font_size');
            $table->decimal('custom_x')->nullable();
            $table->decimal('custom_y')->nullable();
            $table->integer('active');
        });
    }

    public function down(): void
    {
        Capsule::schema()->dropIfExists('c_format_cards');
    }
};
