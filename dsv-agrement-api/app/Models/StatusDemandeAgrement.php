<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StatusDemandeAgrement extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function DemandeAgrement()
    {
        return $this->hasMany(DemandeAgrement::class, 'status');    
    }
}
