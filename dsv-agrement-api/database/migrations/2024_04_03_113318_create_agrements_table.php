<?php

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
        Schema::create('agrements', function (Blueprint $table) {
            $table->id();
            $table->string('numero')->nullable();
            $table->boolean('status');
            $table->foreignIdFor(TypeAgrement::class)->constrained()->cascadeOnDelete();
            $table->date('date_debut')->nullable();
            $table->date('date_fin')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('agrements');
    }
};
