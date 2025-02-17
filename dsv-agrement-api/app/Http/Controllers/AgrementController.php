<?php

namespace App\Http\Controllers;

use App\Models\Agrement;
use App\Models\Notification;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Events\AgrementUpdated;
use App\Events\NotificationPusher;
use Illuminate\Support\Facades\Log;

class AgrementController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Agrement::with(['etablissement', 'etablissement.filiere', 'etablissement.user', 'etablissement.user.roles', 'typeagrement'])->get();
    }

    public function indexTrashed()
    {
        $agrements = Agrement::with(['etablissement.filiere', 'etablissement.user', 'etablissement.user.roles', 'typeagrement','etablissement' => function ($query) {
            $query->withTrashed(); // Inclut les établissements soft deleted
        }])->onlyTrashed()->get();

        return response()->json($agrements);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Agrement::with(['etablissement', 'etablissement.filiere','demandeAgrement','demandeAgrement.typeAgrement','demandeAgrement.statusDemandeAgrement','etablissement.user','remark', 'etablissement.user.roles', 'etablissement.user.userinformation', 'typeagrement'])->findOrFail($id);
    }

    public function showTrashed(string $id)
    {
        return Agrement::withTrashed()
            ->with(['etablissement.filiere', 'etablissement.user', 'etablissement.user.userinformation','demandeAgrement','demandeAgrement.typeAgrement','demandeAgrement.statusDemandeAgrement', 'etablissement.user.roles', 'typeagrement','etablissement' => function ($query) {
                $query->withTrashed(); // Inclut les établissements soft deleted
            }])->findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        try{
            // Trouver l'agrément à mettre à jour
            $agrement = Agrement::findOrFail($id);

            // Validation des données du formulaire (exemple)
            $request->validate([
                "date_debut" => "required|date",
                "type_agrement_id" => "required|int",   
                'numero' => [
                    'required',
                    'string',
                    'unique:agrements,numero,' . $agrement->id, // Vérifie l'unicité sauf pour l'agrément actuel
                    'max:255',
                ],
            ]);

            // Mettre à jour les attributs de l'agrément
            $agrement->update([
                'date_debut' => $request->input('date_debut'),
                'type_agrement_id' => $request->input('type_agrement_id'),
                'numero' => $request->input('numero'),
            ]);

                    
            event(new AgrementUpdated($agrement));

            $roleId = 4;
            $etablissement = $agrement->etablissement()->first();
            $user = $etablissement->user()->whereHas('roles', function($query) use ($roleId){
                $query->where('roles.id',$roleId);
            })->first();
            
            Notification::create([
                'user_id' => $user->id,
                'message' => "Vos informations sur l'agrément pour l'établissement dénommé {$etablissement->name} a été mis à jour.",
            ]);
            
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

    public function suspendre($id)
    {
        try{
            // Trouver l'agrément à mettre à jour
            $agrement = Agrement::findOrFail($id);
            $agrement->update(
                ['etat'=>'Suspendu']
            );

            $roleId = 4;
            $etablissement = $agrement->etablissement()->first();
            $user = $etablissement->user()->whereHas('roles', function($query) use ($roleId){
                $query->where('roles.id',$roleId);
            })->first();
            
            Notification::create([
                'user_id' => $user->id,
                'message' => "Votre agrément pour l'établissement dénommé {$etablissement->name} a été suspendu.\nVeuillez contacter votre responsable au sein du service pour avoir plus d'informations.",
            ]);
            
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

    public function retirer($id)
    {
        try{
            // Trouver l'agrément à mettre à jour
            $agrement = Agrement::findOrFail($id);
            $agrement->update(
                ['etat'=>'Retiré']
            );
            
            $roleId = 4;
            $etablissement = $agrement->etablissement()->first();
            $user = $etablissement->user()->whereHas('roles', function($query) use ($roleId){
                $query->where('roles.id',$roleId);
            })->first();
            
            Notification::create([
                'user_id' => $user->id,
                'message' => "Votre agrément pour l'établissement dénommé {$etablissement->name} a été retiré.\nVeuillez contacter votre responsable au sein du service pour avoir plus d'informations.",
            ]);
            
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

    public function activer($id)
    {
        try{
            // Trouver l'agrément à mettre à jour
            $agrement = Agrement::findOrFail($id);
            $agrement->update(
                ['etat'=>'Actif']
            );

            $roleId = 4;
            $etablissement = $agrement->etablissement()->first();
            $user = $etablissement->user()->whereHas('roles', function($query) use ($roleId){
                $query->where('roles.id',$roleId);
            })->first();
            
            Notification::create([
                'user_id' => $user->id,
                'message' => "Votre agrément pour l'établissement dénommé {$etablissement->name} a été reactivé.\nVous pouvez à présent continuer vos activités.",
            ]);
            
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
        $agrement = Agrement::findOrFail($id);
        $agrement->delete();

        return response()->json(['message' => 'Agrement(s) supprimé(s) avec succès.']);
    }

    public function restore($id)
    {
        try {
            $agrement = Agrement::withTrashed()->findOrFail($id);
            $agrement->restore();

            return response()->json(['message' => 'Agrement restored successfully.']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to restore Agrement.'], 500);
        }
    }
}
