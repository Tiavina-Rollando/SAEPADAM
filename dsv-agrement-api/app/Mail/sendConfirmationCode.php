<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendConfirmationCode extends Mailable
{
    use Queueable, SerializesModels;

    public $code;
    public $model;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($code,$model)
    {
        $this->code = $code;
        $this->model = $model;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        if($this->model=="password"){
            return $this->view('emails.email_validation')
                        ->subject('Mot de passe provisoire')
                        ->with(['code' => $this->code]);
        }
        if($this->model=="code"){
            return $this->view('emails.email_validation')
                        ->subject('Validation de l\'adresse e-mail')
                        ->with(['code' => $this->code]);
        }
    }
}
