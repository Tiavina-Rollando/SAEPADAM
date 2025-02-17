<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Filiere extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function UserInformation()
    {
        return $this->hasMany(UserInformation::class);    
    }

    public function Etablissement()
    {
        return $this->hasMany(Etablissement::class);    
    }
}
