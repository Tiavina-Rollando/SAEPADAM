<?php

namespace App\Events;

use App\Models\Agrement;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class AgrementUpdated
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $agrement;

    public function __construct(Agrement $agrement)
    {
        $this->agrement = $agrement;
    }
}

