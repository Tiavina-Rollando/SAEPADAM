<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DemandeAgrement extends Model
{
    use HasFactory;

    protected $guarded = [];
    
    use SoftDeletes;
    
    protected $dates = ['deleted_at'];
    
    public function Etablissement()
    {
        return $this->belongsTo(Etablissement::class);    
    }
    
    public function TypeAgrement()
    {
        return $this->belongsTo(TypeAgrement::class);    
    }

    public function Agrement()
    {
        return $this->belongsTo(Agrement::class, 'agrement_demande');
    }

    public function StatusDemandeAgrement()
    {
        return $this->belongsTo(StatusDemandeAgrement::class, 'status');    
    }
}
