<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('patients', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('client_id');
            $table->unsignedBigInteger('company_id');
            $table->unsignedBigInteger('clinic_id');
            $table->string('name');
            $table->string('animal_type');
            $table->string('breed_id');
            $table->string('gender');
            $table->date('birth_date')->nullable();
            $table->string('microchip_number')->nullable();
            $table->string('photo')->nullable();
            $table->text('notes')->nullable();
            $table->text('hash')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('patients');
    }
};
