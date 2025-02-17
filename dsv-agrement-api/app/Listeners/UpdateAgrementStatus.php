<?php

namespace App\Listeners;

use App\Events\AgrementUpdated;

class UpdateAgrementStatus
{
    public function __construct()
    {
        //
    }

    public function handle(AgrementUpdated $event)
    {
        $agrement = $event->agrement;
        $agrement->setDateFin();
        $agrement->setStatus();
        $agrement->save();
    }
}
