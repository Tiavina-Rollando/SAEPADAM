<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Agrement;
use Carbon\Carbon;

class CheckAgrementStatus extends Command
{
    protected $signature = 'agrements:check-status';
    protected $description = 'Check and update the status of agreements';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        $agrements = Agrement::where('type_agrement_id', 1)
                             ->where('date_fin', '<', Carbon::now())
                             ->get();

        foreach ($agrements as $agrement) {
            $agrement->update(['type_agrement_id' => 3]);
        }

        $this->info('Agrement status checked and updated successfully.');
    }
}
