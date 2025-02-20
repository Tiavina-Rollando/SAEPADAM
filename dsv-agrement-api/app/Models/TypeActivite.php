<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypeActivite extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function Etablissement()
    {
        return $this->hasMany(Etablissement::class);    
    }
}
