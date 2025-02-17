<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mail\SendConfirmationCode;
use Illuminate\Support\Facades\Mail;

class EmailController extends Controller
{
    public function sendCodeEmail(Request $request)
    {
        $request->validate([
            'email' => 'required'
        ]);

        $email = $request->input('email');
        $code = rand(100000, 999999); // Générer un code de validation aléatoire

        // Envoyer l'e-mail
        Mail::to($email)->send(new SendConfirmationCode($code,"code"));

        return response()->json([
            'message' => 'E-mail envoyé avec succès.',
            'code' => $code
        ]);
    }
    public function sendPassEmail(Request $request)
    {
        $request->validate([
            'email' => 'required'
        ]);

        $email = $request->input('email');
        $pass = rand(10000000, 99999999); // Générer un code de validation aléatoire

        // Envoyer l'e-mail
        Mail::to($email)->send(new SendConfirmationCode($pass,"password"));

        return response()->json([
            'message' => 'E-mail envoyé avec succès.',
            'pass' => $pass
        ]);
    }
}
