<?php

namespace App\Http\Controllers;

use App\Models\Agrement;
use App\Models\Remark;
use Illuminate\Http\Request;

class RemarkController extends Controller
{
    
    public function store(Request $request, $id)
    {
        try{
            $request->validate([
                "description"=>"required",
            ]);
            
            $remark = Remark::create([
                "description" => $request->input("description"),
                "agrement_id" => $id,
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

    public function update(Request $request,$id)
    {
        try{
            $request->validate([
                "description"=>"sometimes",
                "etat"=>"sometimes",
            ]);
            
            $remark = Remark::findOrFail($id);
            $remark->update([
                "description" => $request->input("description"),
                "etat" => $request->input("etat"),
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

    public function destroy($id)
    {

        $remark = Remark::findOrFail($id);
        $remark->delete();

        return response()->json(['message' => 'remark deleted successfully.']);

    }

    public function showByAgreement($id)
    {
        $remark = Remark::where("agrement_id",$id)->get();
        return response()->json($remark);
    }

}
