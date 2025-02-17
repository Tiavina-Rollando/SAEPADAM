<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypeAgrement extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function Agrement()
    {
        return $this->hasMany(Agrement::class);    
    }
}
