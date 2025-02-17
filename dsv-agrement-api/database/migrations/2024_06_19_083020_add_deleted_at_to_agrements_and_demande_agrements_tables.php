<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDeletedAtToAgrementsAndDemandeAgrementsTables extends Migration
{
    public function up()
    {
        Schema::table('agrements', function (Blueprint $table) {
            $table->softDeletes();
        });

        Schema::table('demande_agrements', function (Blueprint $table) {
            $table->softDeletes();
        });
    }

    public function down()
    {
        Schema::table('agrements', function (Blueprint $table) {
            $table->dropSoftDeletes();
        });

        Schema::table('demande_agrements', function (Blueprint $table) {
            $table->dropSoftDeletes();
        });
    }
}
