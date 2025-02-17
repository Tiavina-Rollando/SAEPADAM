<?php

namespace App\Http\Controllers\Auth\Mine;

use App\Http\Controllers\Controller;
use App\Models\Agrement;
use App\Models\Etablissement;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Validation\Rule;

class EtablissementController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $request->user()->etablissement()->with(['typeactivite','user','user.roles','filiere'])->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            "name" =>[
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
            "type_produit" => "required",
            "type_activite_id" => "required|int"
        ]);

        try {
            $etablissement = Etablissement::create($request->all());
             // Attacher l'utilisateur connecté à cet établissement
             $request->user()->etablissement()->attach($etablissement->id);

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
     * Display the specified resource.
     */
    public function show(Request $request, string $id)
    {
        return $request->user()->etablissement()->with([
            'typeactivite',
            'demandeagrement',
            'user',
            'user.roles',
            'agrement.remark',
            'user.userinformation',
            'filiere',
            'demandeagrement.statusdemandeagrement',
            'demandeagrement.typeagrement',
            'agrement.typeagrement'
        ])->findOrfail($id);
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
                "message" => null
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
