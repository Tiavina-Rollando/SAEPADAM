<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EtablissementAgrement extends Model
{
    use HasFactory;

    protected $table = 'etablissement_agrement';

    protected $fillable = ['etablissement_id', 'agrement_id'];

    public $timestamps = false;
}
