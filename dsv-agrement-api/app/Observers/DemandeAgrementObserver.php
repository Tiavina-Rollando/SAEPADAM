<?php

namespace App\Observers;

use App\Models\DemandeAgrement;
use App\Models\Agrement;
use App\Models\AgrementDemandeAgrement;

class DemandeAgrementObserver
{
    /**
     * Handle the DemandeAgrement "created" event.
     */
    public function created(DemandeAgrement $demandeAgrement): void
    {
        //
    }

    /**
     * Handle the DemandeAgrement "updated" event.
     */
    public function updated(DemandeAgrement $demandeAgrement): void
    {
        if($demandeAgrement->status == 3)
        {
            $etablissement = $demandeAgrement->etablissement;
            $agrement = $demandeAgrement->agrement;
            $user = $etablissement->User()->first();
    
            if($user && $etablissement && $agrement){
                if ($agrement->status) {
                    $etat = 'valide';
                } else {
                    $etat = 'expiré';
                }
            
                Notification::create([
                    'user_id' => $user->id,
                    'message' => "Votre établissement dénommé {$etablissement->name} a réçu un agrément {$etat}.",
                ]);
            }
        }
    }

    /**
     * Handle the DemandeAgrement "deleted" event.
     */
    public function deleted(DemandeAgrement $demandeAgrement): void
    {
        //
    }

    /**
     * Handle the DemandeAgrement "restored" event.
     */
    public function restored(DemandeAgrement $demandeAgrement): void
    {
        //
    }

    /**
     * Handle the DemandeAgrement "force deleted" event.
     */
    public function forceDeleted(DemandeAgrement $demandeAgrement): void
    {
        //
    }
}
