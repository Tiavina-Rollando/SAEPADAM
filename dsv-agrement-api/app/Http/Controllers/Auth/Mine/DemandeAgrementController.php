<?php

namespace App\Http\Controllers\Auth\Mine;

use App\Http\Controllers\Controller;
use App\Models\Agrement;
use App\Models\Notification;
use App\Events\NotificationPusher;
use App\Models\Etablissement;
use App\Models\DemandeAgrement;
use App\Models\AgrementDemandeAgrement;
use App\Models\EtablissementAgrement;
use Illuminate\Http\Request;

class DemandeAgrementController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function indexAgrement()
    {
        $demandes = DemandeAgrement::with('typeAgrement', 'etablissement', 'statusDemandeAgrement', 'etablissement.user', 'etablissement.user.roles','etablissement.filiere')->get();

        return response()->json($demandes);
    }

    public function indexTrashed()
    {
        $demandes = DemandeAgrement::with(['typeAgrement', 'etablissement', 'statusDemandeAgrement', 'etablissement.user','etablissement.user.roles','etablissement.filiere'])->onlyTrashed()->get();

        return response()->json($demandes);
    }
    
    /**
     * Display the specified resource.
     */
    public function showByStatus(Request $request)
    {
        $request->validate([
            "status" => "required|int"
        ]);
        
        try {
            // Utilisez la méthode where() pour rechercher l'établissement par nom
            $demAgrement = DemandeAgrement::with('typeAgrement', 'etablissement', 'statusDemandeAgrement', 'etablissement.user','etablissement.user.roles','etablissement.filiere')
            ->where('status', $request->status)
            ->get();

            return response()->json($demAgrement);
        } catch (\Throwable $th) {
            return [
                "status" => false,
                "message" => $th->getMessage()
            ];
        }
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request, string $id)
    {
        return $request->user()->etablissement()->with([
            // 'demandeagrement.agrement',
            'demandeagrement.typeagrement',
            'demandeagrement.statusdemandeagrement'
        ])->findOrfail($id)->demandeagrement;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, string $id)
    {
        $request->validate([
            "type_agrement_id" => "required|int"
        ]);

        try {
            $etablissement = $request->user()->etablissement()->findOrfail($id);
    
            $demandeagrement = $etablissement->DemandeAgrement()->create([
                "type_agrement_id" => $request->type_agrement_id,
                "status" => 1
            ]);
            
            event(new NotificationPusher("Admin",$request->user()->name));

            return [
                "status" => true,
                "message" => null
            ];
        } catch (\Throwable $th) {
            return [
                "status" => false,
                "message" => $th->getMessage()
            ];
        }

    }

    public function show(string $id)
    {
        return DemandeAgrement::with('typeAgrement', 'etablissement', 'statusDemandeAgrement', 'etablissement.user','etablissement.user.roles','etablissement.filiere')->findOrFail($id);
    }

    public function showTrashed(string $id)
    {
        // Rechercher la demande d'agrément soft-deleted par son ID
        return DemandeAgrement::withTrashed()
            ->with('typeAgrement', 'etablissement', 'statusDemandeAgrement', 'etablissement.user','etablissement.user.roles', 'etablissement.filiere')
            ->findOrFail($id);
    }


    public function update(Request $request, string $id)
    {
            
        $request->validate([
            "status" => "required|int",
            'numero' => 'required_if:status,3|string|unique:agrements,numero', // Valider le numéro si le statut est 'acceptée'
        ]);

        try {
             // Récupérer la demande d'agrément par son ID
            $demande = DemandeAgrement::findOrFail($id);

            // Mettre à jour uniquement le champ 'status'
            $demande->status = $request->input('status');
            $demande->save();
                
            // Vérifiez si le statut est "acceptée" (vous devrez remplacer par la valeur appropriée)
            if ($request->input('status') == 3) {
                // Créer un nouvel agrément
                $agrement = Agrement::create([
                    'numero' => $request->input('numero'),
                    'type_agrement_id' => $demande->type_agrement_id, // Assurez-vous que cela est défini correctement
                    'date_debut' => now(),
                  ]);
                  
                // Créez l'entrée de liaison dans la table agrement_demande
                $liaison = AgrementDemandeAgrement::create([
                    "demande_agrement_id" => $demande->id,
                    "agrement_id" => $agrement->id
                ]);

                // Créez l'entrée de liaison dans la table etablissement_agrement
                EtablissementAgrement::create([
                    'etablissement_id' => $demande->etablissement_id,
                    'agrement_id' => $agrement->id
                ]);

                //Création de la notification vers le client
                $etablissement = Etablissement::findOrFail($demande->etablissement_id);
                $user = $etablissement->User()->first();

                if($user && $etablissement && $agrement){
                   
                    Notification::create([
                        'user_id' => $user->id,
                        'message' => "Votre établissement dénommé {$etablissement->name} a réçu un agrément: n° {$agrement->numero}",
                    ]);
                    
                    $agrement->update(['etat'=>'Actif']);
                    
                    // event(new NotificationPusher("Client",$user->name));
                }
                return response()->json($agrement);
    
            };

            //Création de la notification vers le client
            $etablissement = Etablissement::findOrFail($demande->etablissement_id);
            $user = $etablissement->User()->first();

            $etat=$demande->statusDemandeAgrement;
            
            if($etat=="Réfusé"){
                Notification::create([
                    'user_id' => $user->id,
                    'message' => "Votre demande d'agrément pour l'établissement dénommé {$etablissement->name} a été réfusée.\nVeuillez contacter votre responsable pour en savoir plus.",
                ]);
            };
            if($etat=="En cours de traitement"){
                Notification::create([
                    'user_id' => $user->id,
                    'message' => "Votre demande d'agrément pour l'établissement dénommé {$etablissement->name} a été bien réçue et est en cours d'étude.",
                ]);
            };

            
            event(new NotificationPusher("Client",$user->name));

            return [
                "status" => true,
                "message" => null
            ];
        } catch (\Throwable $th) {
            return [
                "status" => false,
                "message" => $th->getMessage()
            ];
        }
    }

    public function destroy($id)
    {
        try{
            // Recherche la demande d'agrément par son ID ; lance une exception si non trouvée
            $demandeAgrement = DemandeAgrement::findOrFail($id);
        
            // Supprime la demande d'agrément
            $demandeAgrement->delete();
        
            return [
                "status" => true,
                "message" => 'Demande(s) supprimée(s) avec succès'
            ];
        } catch (\Throwable $th) {
            return [
                "status" => false,
                "message" => $th->getMessage()
            ];
        }
    }

    public function restore($id)
    {
        try {
            // Trouver la demande d'agrément soft-deleted par son ID
            $demandeAgrement = DemandeAgrement::withTrashed()->findOrFail($id);

            // Restaurer la demande d'agrément
            $demandeAgrement->restore();

            // Retourner une réponse JSON avec un message de succès
            return [
                "status" => true,
                "message" => null
            ];
        } catch (\Throwable $th) {
            return [
                "status" => false,
                "message" => $th->getMessage()
            ];
        }
    }

}
