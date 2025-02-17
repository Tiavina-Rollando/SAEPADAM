<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DemandeExportation extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function Etablissement()
    {
        return $this->belongsTo(Etablissement::class);    
    }

}