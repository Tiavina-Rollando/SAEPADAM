<?php

namespace App\Http\Controllers;

use App\Models\Etablissement;
use Illuminate\Http\Request;

class EtablissementAgrementController extends Controller
{
    public function show($id)
    {
        return Etablissement::with([
            'agrement' => function($queryAgrement) {
                $queryAgrement->where('status',1)->orderBy('id','DESC');
            },
            'agrement.typeagrement',
            'user',
            'user.roles',
            'typeactivite',
            'filiere'
        ])->findOrfail($id);
    }
}
