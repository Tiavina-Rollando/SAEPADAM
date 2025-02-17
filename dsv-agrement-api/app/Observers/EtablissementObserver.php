<?php

namespace App\Observers;

use App\Models\Etablissement;
use App\Models\Agrement;
use BaconQrCode\Renderer\GDLibRenderer;
use BaconQrCode\Writer;

class EtablissementObserver
{
    /**
     * Handle the Etablissement "created" event.
     */
    public function created(Etablissement $etablissement): void
    {
        $link = route('etablissement.agrement.show', $etablissement->id);
        $renderer = new GDLibRenderer(400);
        $writer = new Writer($renderer);
        $writer->writeFile($link, "x-data/qrcode/qrcode-etablissement-{$etablissement->id}.png");
        
    }

    /**
     * Handle the Etablissement "updated" event.
     */
    public function updated(Etablissement $etablissement): void
    {
        //
    }

    /**
     * Handle the Etablissement "deleted" event.
     */
    public function deleted(Etablissement $etablissement): void
    {
        //
    }

    /**
     * Handle the Etablissement "restored" event.
     */
    public function restored(Etablissement $etablissement): void
    {
        //
    }

    /**
     * Handle the Etablissement "force deleted" event.
     */
    public function forceDeleted(Etablissement $etablissement): void
    {
        //
    }
}
