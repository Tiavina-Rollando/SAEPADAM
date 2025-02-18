<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;


class ApiController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            "email" => "required|email",
            "password" => "required"
        ]);

        $credentials = $request->only('email', 'password');
        $attemps = Auth::attempt($credentials);

        // Récupérer tous les comptes ayant cet email
        $users = User::where('email', $request->email)->get();

        if ($users->isEmpty()) {
            return response()->json(['message' => 'Email non trouvé'], 404);
        }

        // Trouver le bon compte en fonction du mot de passe
        $user = $users->first(function ($u) use ($request) {
            return Hash::check($request->password, $u->password);
        });

        if (!$user) {
            return response()->json(['message' => 'Mot de passe incorrect'], 401);
        }

        // Charger les relations (roles, userinformation.filiere)
        $user->load(['roles', 'userinformation.filiere']);

        // Générer le token
        $accessToken = $user->createToken($request->_application_request_origine, ['*'], now()->addDay(1))->plainTextToken;

        return response()->json([
            "status" => true,
            "user" => $user,
            "token" => $accessToken
        ]);
    }

    // public function login(Request $request)
    // {
    //     $request->validate([
    //         "email" => "required|email",
    //         "password" => "required"
    //     ]);
    
    //     $credentials = $request->only('email', 'password');
    //     $attemps = Auth::attempt($credentials);


    //     if ($attemps) {
    //         // Récupérer l'utilisateur authentifié
    //         $user = Auth::user();
    
    //         // Charger les relations
    //         $user->load(['roles', 'userinformation.filiere']);
    
    //         // Générer le token
    //         $accessToken = $user->createToken($request->_application_request_origine, ['*'], now()->addDay(1))->plainTextToken;
    
    //         return [
    //             "status" => true,
    //             "user" => $user,
    //             "attemps" => $attemps,
    //             "token" => $accessToken
    //         ];
    //     }
    
    //     return response()->json([
    //         "status" => false,
    //         "attemps" => $attemps,
    //         "message" => "Credential not match"
    //     ], 401);
    // }
    
    public function register(Request $request)
    {
        $request->validate([
            "name" => "required",
            "email" => "required|email|unique",
            "password" => "required|min:8",
            "role_id" => "required|int",
            "userinformation.filiere_id" => "required|int",
            "userinformation.tel" => "required|int",
            "userinformation.address" => "required|int"
        ]);

        try {
            $user = User::create(Arr::except($request->all(), ["role_id", "userinformation"]));
            $user->UserInformation()->create($request->userinformation);
            $user->assignRoles($request->role_id);

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
