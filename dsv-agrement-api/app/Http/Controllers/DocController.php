<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DocController extends Controller
{

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('doc.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function doc()
    {
        $content = file_get_contents("dsv-agrement-api-doc.json");

        return json_decode($content);
    }
}
