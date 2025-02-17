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
        Schema::table('agrements', function (Blueprint $table) {
            // Convertir la colonne 'status' en boolean
            $table->boolean('status')->default(true)->nullable()->change();
         });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
     //
    }
};
