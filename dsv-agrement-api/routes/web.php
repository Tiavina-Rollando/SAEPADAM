<?php

use App\Http\Controllers\DocController;
use App\Http\Controllers\EtablissementAgrementController;
use Illuminate\Support\Facades\Route;
use BaconQrCode\Renderer\GDLibRenderer;
use BaconQrCode\Writer;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return ['Laravel' => app()->version()];
});

Route::get('login', function () {
    return "Unauthenticated";
});

Route::prefix('doc')->name('doc.')->controller(DocController::class)->group(function() {
    
    Route::get('','index')->name('index');
    Route::get('source-json','doc')->name('doc');

});

Route::prefix('etablissement')->name('etablissement.')->group(function() {

    Route::prefix('{id}')->group(function() {
        
        Route::get('agrement', [EtablissementAgrementController::class, 'show'])->name('agrement.show');

    });

});

require __DIR__.'/auth.php';
