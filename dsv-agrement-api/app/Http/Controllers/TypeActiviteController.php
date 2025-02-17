<?php

namespace App\Http\Controllers;

use App\Models\TypeActivite;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class TypeActiviteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return TypeActivite::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            "name" => "required|unique:type_activites"
        ]);

        try {
            TypeActivite::create([
                'name' => $request->name
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

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return TypeActivite::findOrfail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            "name" => [
                "required",
                Rule::unique('type_activites')->ignore($id)
            ]
        ]);

        try {
            TypeActivite::findOrfail($id)->update([
                "name" => $request->name
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

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            TypeActivite::findOrfail($id)->delete();
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
