<?php

use App\Models\Etablissement;
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
        Schema::create('demande_exportations', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(Etablissement::class)->constrained()->cascadeOnDelete();
            $table->date('date_depart');
            $table->string('lieu_destination');
            $table->bigInteger('quantite')->default(0);
            $table->string('unite')->default('kg');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('demande_exportations');
    }
};
