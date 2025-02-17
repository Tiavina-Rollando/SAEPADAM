<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Validation\Rule;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return User::with(['roles','userinformation'])->get();
    }
    
    
    
    public function showByEmail(Request $request)
    {
        $request->validate([
            "email" => "required|email"
        ]);
    
        // Utilisez la méthode where() pour rechercher l'utilisateur par adresse e-mail
        $user = User::with(['roles', 'etablissement', 'userinformation'])
                    ->where('email', $request->email)
                    ->firstOrFail();
    
        return response()->json($user);
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            "name" => "required",
            "email" => "required|email",
            "password" => "required|min:8",
            "role_id" => "required|int",
            // Ajoutez les validations supplémentaires pour les champs de userinformation si nécessaire
        ]);

        try {
            // Créez d'abord l'utilisateur
            $user = User::create(Arr::except($request->all(), "role_id"));

            // Ensuite, attribuez les rôles
            $user->assignRoles($request->role_id);

            // Créez une entrée dans la table userinformation associée à cet utilisateur
            $user->userInformation()->create([
                // Récupérez les données supplémentaires nécessaires à partir de la demande
                // Assurez-vous que les noms de champs correspondent à ceux de la table userinformation
                'tel' => $request->input('tel'),
                'address' => $request->input('address'),
                'matricule' => $request->input('matricule'),
            ]);

            return [
                "status" => true,
                "message" => "User created"
            ];
        } catch (\Throwable $th) {
            return [
                "status" => false,
                "message" => $th->getMessage()
            ];
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return User::with(['roles','etablissement','userinformation'])->findOrFail($id);
    }
    
    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            "email" => [
                Rule::unique('users')->ignore($id)
            ],
            "password" => "min:8"
        ]);

        try {
            User::findOrfail($id)->update($request->all());
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
            User::findOrfail($id)->delete();
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
