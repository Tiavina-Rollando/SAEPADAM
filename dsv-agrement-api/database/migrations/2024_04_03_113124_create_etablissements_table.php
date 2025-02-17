<?php

use App\Models\Filiere;
use App\Models\TypeActivite;
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
        Schema::create('etablissements', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->foreignIdFor(Filiere::class);
            $table->foreignIdFor(TypeActivite::class)->constrained()->cascadeOnDelete();
            $table->string('type_etablissement');
            $table->string('adresse');
            $table->string('type_produit');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('etablissements');
    }
};
