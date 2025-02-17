<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class PurgeTrashedRecords extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:purge-trashed-records';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Purge soft-deleted records from all relevant tables after a certain delay';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // List of models that support soft deletes and delayed purging
        $models = [
            \App\Models\Agrement::class,
            \App\Models\DemandeAgrement::class,
            \App\Models\Notification::class,
            // Add more models as needed
        ];

        foreach ($models as $modelClass) {
            $this->purgeSoftDeletedRecords($modelClass);
        }

        $this->info('Soft-deleted records purged successfully.');
    }

    /**
     * Purge soft-deleted records for a given model after a delay.
     *
     * @param string $modelClass
     * @return void
     */
    protected function purgeSoftDeletedRecords($modelClass)
    {
        // Check if the model uses SoftDeletes trait
        if (!in_array(SoftDeletes::class, class_uses($modelClass))) {
            return;
        }

        // Define the delay period in days (e.g., 30 days)
        $delayDays = 30;

        // Calculate the date threshold for purging
        $thresholdDate = Carbon::now()->subDays($delayDays);

        // Perform the purge operation
        $modelInstance = new $modelClass;
        $softDeletedRecords = $modelInstance->onlyTrashed()
                                           ->where('deleted_at', '<=', $thresholdDate)
                                           ->get();

        foreach ($softDeletedRecords as $record) {
            $record->forceDelete();
        }

        $this->info("Purged soft-deleted records for {$modelClass} after {$delayDays} days.");
    }
}
