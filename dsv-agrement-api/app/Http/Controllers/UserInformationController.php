<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserInformation;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class UserInformationController extends Controller
{
    public function show($id)
    {
        return UserInformation::with(['user'])->where('user_id', $id)->first();
    }

    public function update(Request $request, $id)
    {
        // Trouver l'user à mettre à jour
        $user = User::findOrFail($id);

        $request->validate([
            "name" =>[
                'required',
                'string',
                'unique:users,name,' . $user->id, // Vérifie l'unicité sauf pour l'user actuel
                'max:255',
            ],
            "email" => [
                'required',
                'email',
                'unique:users,email,' . $user->id, // Vérifie l'unicité sauf pour l'user actuel
                'max:255',
            ],
            "tel" => [
                "required",
                Rule::unique('user_information','user_id')->ignore($id)
            ],
            "address" => "required"
        ]);

        try {

            User::where('id', $id)->first()->update([
                'name' => $request->input('name'),
                'email' => $request->input('email')
            ]);
            UserInformation::with(['user'])->where('user_id', $id)->first()->update([
                'tel' => $request->input('tel'),
                'address' => $request->input('address')
            ]);
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
