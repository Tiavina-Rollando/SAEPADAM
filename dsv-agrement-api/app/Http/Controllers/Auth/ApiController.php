<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;

class ApiController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            "email" => "required|email",
            "password" => "required"
        ]);
        
        $credentials = $request->only('email', 'password');
        
        // _application_request_origine
        $attemps = Auth::attempt($credentials);

        if ($attemps) {
            $user = User::with(['roles','userinformation.filiere'])->where('email', $request->email)->first();
            
            $accessToken = $user->createToken($request->_application_request_origine,['*'],now()->addDay(1))->plainTextToken;
            return [
                "status" => $attemps,
                "user" => $user,
                "token" => $accessToken
            ];

        } else {
            return [
                "status" => $attemps,
                "message" => "Credential not match"
            ];
        }

    }

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
