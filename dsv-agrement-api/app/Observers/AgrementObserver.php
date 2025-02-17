<?php

namespace App\Observers;

use App\Models\Agrement;
use App\Models\Notification;
use App\Models\EtablissementAgrement;

class AgrementObserver
{
    public function creating(Agrement $agrement)
    {
        $agrement->setDateFin();
        $agrement->setStatus();
    }

    public function updating(Agrement $agrement)
    {
        $agrement->setDateFin();
        $agrement->setStatus();

        if ($agrement) {
            $etablissement = $agrement->Etablissement()->first();
            $user = $etablissement->User()->first();
        
            if($user&&$etablissement){
                if ($agrement->status) {
                    $etat = 'valide';
                } else {
                    $etat = 'expiré';
                }
                $date_fin = $agrement->date_fin ? $agrement->date_fin->format('d/m/Y') : 'N/A';

                Notification::create([
                    'user_id' => $user->id,
                    'message' => "L'agrément pour votre établissement dénommé {$etablissement->name} a été mis à jour: {$etat}, date d'éxpiration : {$date_fin}.",
                ]);
            }
        }
    }
}
