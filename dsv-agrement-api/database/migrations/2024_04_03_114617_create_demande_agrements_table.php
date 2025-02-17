<?php

use App\Models\Etablissement;
use App\Models\StatusDemandeAgrement;
use App\Models\TypeAgrement;
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
        Schema::create('demande_agrements', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(Etablissement::class)->constrained()->cascadeOnDelete();
            $table->foreignIdFor(TypeAgrement::class);
            $table->foreignIdFor(StatusDemandeAgrement::class, 'status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('demande_agrements');
    }
};
