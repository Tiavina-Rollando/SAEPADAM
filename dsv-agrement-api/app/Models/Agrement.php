<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class Agrement extends Model
{
    use HasFactory, SoftDeletes;


    protected $fillable = [
        'date_debut', 
        'type_agrement_id', 
        'numero',
        'etat'
    ];

    protected $dates = ['deleted_at'];

    public function Etablissement()
    {
        return $this->belongsToMany(Etablissement::class, 'etablissement_agrement'); 
    }

    public function Remark()
    {
        return $this->hasMany(Remark::class);    
    }

    public function TypeAgrement()
    {
        return $this->belongsTo(TypeAgrement::class);    
    }

    public function DemandeAgrement()
    {
        return $this->belongsToMany(DemandeAgrement::class, 'agrement_demande');    
    }
    
    public function setDateFin()
    {
        if ($this->type_agrement_id === 1) {
            $this->date_fin = Carbon::parse($this->date_debut)->addMonths(3);
        } elseif ($this->type_agrement_id === 2) {
            $this->date_fin = null;
        }
    }

    public function setStatus()
    {
        if ($this->date_fin) {
            $this->status = Carbon::now()->lte(Carbon::parse($this->date_fin));
        } else {
            $this->status = true;
        }
    }
    public function sendNotif()
    {
        $etablissement = $this->Etablissement()->first();
        $user = $etablissement->User()->first();
    
    
        if($user&&$etablissement){
            if ($agrement->status) {
                $etat = 'valide';
            } else {
                $etat = 'expiré';
            }
        
            Notification::create([
                'user_id' => $user_id,
                'message' => "Votre établissement dénommé {$etablissement->name} a réçu un agrément {$etat}.",
            ]);
        }
    }
}
