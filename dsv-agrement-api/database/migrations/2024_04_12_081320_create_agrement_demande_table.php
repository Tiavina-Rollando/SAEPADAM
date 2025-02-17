<?php

use App\Models\Agrement;
use App\Models\DemandeAgrement;
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
        Schema::create('agrement_demande', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(DemandeAgrement::class)->constrained()->cascadeOnDelete();
            $table->foreignIdFor(Agrement::class)->constrained()->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('agrement_demande');
    }
};
