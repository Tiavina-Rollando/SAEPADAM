<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Etablissement extends Model
{
    use HasFactory,SoftDeletes;

    protected $guarded = [];
    protected $appends = ['qrcode'];

    public function Qrcode()
    {
        return asset("x-data/qrcode/qrcode-etablissement-{$this->id}.png");
    }

    public function getQrcodeAttribute()
    {
        return $this->Qrcode();    
    }
    
    protected $fillable = [
        'name','filiere_id','type_etablissement','adresse','region','district','commune','veterinaire','type_produit','type_activite_id' 
    ];

    public function User()
    {
        return $this->belongsToMany(User::class, 'etablissement_user');    
    }

    public function Agrement()
    {
        return $this->belongsToMany(Agrement::class, 'etablissement_agrement');    
    }

    public function TypeActivite()
    {
        return $this->belongsTo(TypeActivite::class);    
    }

    public function DemandeAgrement()
    {
        return $this->hasMany(DemandeAgrement::class);    
    }

    public function Filiere()
    {
        return $this->belongsTo(Filiere::class);    
    }

    protected static function booted()
    {
        static::deleting(function ($etablissement) {
            if ($etablissement->isForceDeleting()) {
                $etablissement->agrement()->detach();
                $etablissement->agrement()->forceDelete();
            } else {
                foreach ($etablissement->agrement as $agrement) {
                    $agrement->delete();
                }
            }
        });

        static::restoring(function ($etablissement) {
            foreach ($etablissement->agrement as $agrement) {
                $agrement->restore();
            }
        });
    }

}
