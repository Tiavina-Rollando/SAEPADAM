<?php

namespace App\Http\Controllers;

use App\Models\Agrement;
use App\Models\Etablissement;
use App\Models\Notification;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Validation\Rule;
use App\Events\NotificationPusher;
use App\Mail\SendConfirmationCode;
use Illuminate\Support\Facades\Mail;

class EtablissementController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Etablissement::with(['typeactivite','user','user.roles','filiere','agrement'])->get();
    }

    public function indexTrashed()
    {
        $etablissement = Etablissement::with(['typeactivite','user','user.roles','filiere','agrement'])->onlyTrashed()->get();

        return response()->json($etablissement);
    }

    /**
     * Store a newly created resource in storage.
     */

     public function store(Request $request)
     {
        $request->validate([
            "name" => [
                'required',
                'string',
                'max:255',
            ],
            "filiere_id" => "required|int",
            "type_etablissement" => "sometimes",
            "adresse" => "required",
            "region" => "sometimes",
            "district" => "sometimes",
            "commune" => "sometimes",
            "veterinaire" => "sometimes",
            "type_produit" => "required",
            "type_activite_id" => "required|int",
        ]);
     
        try 
        {

            $etablissement = Etablissement::create($request->all());
            
            // Créer des agréments si présents
            if ($request->has('agrements')) {
                        
                $agrements = Agrement::create([
                    'date_debut' => $request->input('agrements.date_debut'),
                    'type_agrement_id' => $request->input('agrements.type_agrement_id'),
                    'numero' => $request->input('agrements.numero'),
                ]);

                $etablissement->Agrement()->attach($agrements);
            }

            if($request->has('veterinaires')){
                
                $veto = User::where('name', $request->input('veterinaires.name'))->first();
                
                if(!$veto){
                    $veto = User::create([
                        'name' => $request->input('veterinaires.name'),
                        'email' => $request->input('veterinaires.email'),
                        'password' => $request->input('veterinaires.password'),
                    ]);
                    
                    $veto->userInformation()->create([
                        'tel' => $request->input('veterinaires.tel'),
                        'address' => $request->input('veterinaires.address'),
                        'matricule' => $request->input('veterinaires.matricule'),
                    ]);
                }
                
                $veto->Etablissement()->attach($etablissement);
                $veto->assignRoles(3);   
            
            }

            if($request->has('users')){
                
                $user = User::where('email', $request->input('users.email'))->first();
                
                if(!$user){
                    $user = User::create([
                        'name' => $request->input('users.name'),
                        'email' => $request->input('users.email'),
                        'password' => $request->input('users.password'),
                    ]);
                    
                    $user->userInformation()->create([
                        'tel' => $request->input('users.tel'),
                        'address' => $request->input('users.address'),
                        'matricule' => $request->input('users.matricule'),
                    ]);
                }
                
                $user->Etablissement()->attach($etablissement);
                $user->assignRoles(4);   

                // Envoyer l'e-mail
                Mail::to($request->input('users.email'))->send(new SendConfirmationCode("password","password"));

            }
    
            return [
                "status" => true,
                "message" => "Établissement créé avec succès",
            ];
            
            } catch (\Throwable $th) {
                return [
                    "status" => false,
                    "message" => $th->getMessage(),
                ];
            }
    }
     
    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Etablissement::with(['typeactivite','user','user.roles','user.userinformation','filiere', 'agrement','agrement.remark','agrement.typeagrement','demandeagrement','demandeagrement.typeagrement','demandeagrement.statusDemandeAgrement'])->findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $etablissement = Etablissement::findOrfail($id);
            
        $request->validate([
            
            "name" => [
                'required',
                'string',
                'max:255',
            ],
            "filiere_id" => "required|int",
            "type_etablissement" => "sometimes",
            "adresse" => "required",
            "region" => "sometimes",
            "district" => "sometimes",
            "commune" => "sometimes",
            "veterinaire" => "sometimes",
            "type_produit" => "required",
            "type_activite_id" => "required|int",]);

        try {

            $etablissement->update($request->all());

            
            if($request->has('veterinaires')){
                
                $veto = User::where('name', $request[('veterinaire')])->first();
                
                if(!$veto){
                    $veto = User::create([
                        'name' => $request->input('veterinaires.name'),
                        'email' => $request->input('veterinaires.email'),
                        'password' => $request->input('veterinaires.password'),
                    ]);
                    
                    $veto->userInformation()->create([
                        'tel' => $request->input('veterinaires.tel'),
                        'address' => $request->input('veterinaires.address'),
                        'matricule' => $request->input('veterinaires.matricule'),
                    ]);
                }
                
                $veto->Etablissement()->attach($etablissement);
                $veto->assignRoles(3);   
                 //Pour l'enregistrement du vétérinaire officiel
            
                 Notification::create([
                    'user_id' => $user->id,
                    'message' => "Le vétérinaire responsable de votre établissement dénommé {$etablissement->name} est Dr. {$veto->name}.",
                ]);
                
            }
            
            $roleId = 4;
            $user = $etablissement->user()->whereHas('roles', function($query) use ($roleId){
                $query->where('roles.id',$roleId);
            })->first();
            
           
            //Pour la mise à jour des informations
            Notification::create([
                'user_id' => $user->id,
                'message' => "Les informations sur votre établissement dénommé {$etablissement->name} ont été modifié.\nOn vous prie de les vérifier et de nous contacter s'il y a des données incorrectes.",
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

    public function addProprio(Request $request, string $id){
        
        $request->validate([
            "users" => "required",
            "users.name" => "required",
            "users.email" => "required",
            "users.password" => "required",
            "users.tel" => "sometimes",
            "users.matricule" => "sometimes",
            "users.address" => "sometimes",
        ]);

        try {

            $etablissement = Etablissement::findOrfail($id);
            
            
            if($request->has('users')){
                
            $roleId = 4;
            $etablissement->user()->whereHas('roles', function($query) use ($roleId){
                $query->where('roles.id',$roleId);
            })->detach();
                
                $user = User::where('email', $request->input('users.email'))->first();
                
                if(!$user){
                    $user = User::create([
                        'name' => $request->input('users.name'),
                        'email' => $request->input('users.email'),
                        'password' => $request->input('users.password'),
                    ]);
                    
                    $user->userInformation()->create([
                        'tel' => $request->input('users.tel'),
                        'address' => $request->input('users.address'),
                        'matricule' => $request->input('users.matricule'),
                    ]);
                }
                
                $user->Etablissement()->attach($etablissement);
                $user->assignRoles(4);   
            
            }
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

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            Etablissement::findOrfail($id)->delete();
            return [
                "status" => true,
                "message" => "Etablissement(s) supprimé(s) avec succès"
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
            $etablissement = Etablissement::withTrashed()->findOrFail($id);
            $etablissement->restore();

            return response()->json(['message' => 'Etablissement restored successfully.']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to restore establishment.'], 500);
        }
    }
}
