<?php

namespace App\Console\Commands;

use App\Enums\EFiliere;
use App\Enums\ERoles;
use App\Enums\EStatusDemandeAgrement;
use App\Enums\ETypeActivite;
use App\Enums\ETypeAgrement;
use App\Models\Etablissement;
use App\Models\Filiere;
use App\Models\StatusDemandeAgrement;
use App\Models\TypeActivite;
use App\Models\TypeAgrement;
use BaconQrCode\Renderer\GDLibRenderer;
use BaconQrCode\Writer;
use Illuminate\Console\Command;
use Spatie\Permission\Models\Role;

class app_init extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:init';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Init data app';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        if (Role::count() == 0) {
            foreach (ERoles::cases() as $role) {
                Role::create([
                    'name' => $role->value
                ]);
            }
        }

        if (Filiere::count() == 0) {
            foreach (EFiliere::cases() as $filiere) {
                Filiere::create([
                    'name' => $filiere->value
                ]);
            }
        }

        if (TypeActivite::count() == 0) {
            foreach (ETypeActivite::cases() as $type_activite) {
                TypeActivite::create([
                    'name' => $type_activite->value
                ]);
            }
        }

        if (TypeAgrement::count() == 0) {
            foreach (ETypeAgrement::cases() as $type_agrement) {
                TypeAgrement::create([
                    'name' => $type_agrement->value
                ]);
            }
        }

        if (StatusDemandeAgrement::count() == 0) {
            foreach (EStatusDemandeAgrement::cases() as $status_demande_agrement) {
                StatusDemandeAgrement::create([
                    'name' => $status_demande_agrement->value
                ]);
            }
        }

        foreach (Etablissement::all() as $etablissement) {
            $link = route('etablissement.agrement.show', $etablissement->id);
            $renderer = new GDLibRenderer(400);
            $writer = new Writer($renderer);
            $writer->writeFile($link, "public/x-data/qrcode/qrcode-etablissement-{$etablissement->id}.png");
        }
        echo "Finished!\n";
    }
}
