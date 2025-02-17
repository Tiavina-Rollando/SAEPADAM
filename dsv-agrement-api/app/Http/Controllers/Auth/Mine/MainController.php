<?php

namespace App\Http\Controllers\Auth\Mine;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class MainController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $request->user()->userinformation()->with(['filiere'])->first();
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $request->validate([
            "tel" => [
                "required",
                Rule::unique('user_information')->ignore($request->user()->id)
            ],
            "filiere_id" => "required",
            "address" => "required"
        ]);

        try {
            $request->user()->userinformation()->update([
                "tel" => $request->tel,
                "filiere_id" => $request->filiere_id,
                "address" => $request->address
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
