<?php

use App\Http\Controllers\AgrementController;
use App\Http\Controllers\Auth\ApiController;
use App\Http\Controllers\Auth\Mine\DemandeAgrementController;
use App\Http\Controllers\Auth\Mine\EtablissementController as MineEtablissementController;
use App\Http\Controllers\Auth\Mine\MainController;
use App\Http\Controllers\Auth\Mine\NotificationController;
use App\Http\Controllers\EtablissementController;
use App\Http\Controllers\RemarkController;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\FiliereController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\TypeActiviteController;
use App\Http\Controllers\TypeAgrementController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UserInformationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::middleware(['api.guest'])->controller(ApiController::class)->name('auth.')->group(function() {
    Route::post('login', 'login')->name('login');
    Route::post('register', 'register')->name('register');
});

Route::middleware(['auth:sanctum'])->group(function () {

    Route::prefix('/roles')->name('roles.')->controller(RoleController::class)->group(function() {
        
        Route::get('', 'index')->name('index');
        Route::get('{id}', 'show')->name('show');

    });
    
    Route::prefix('/mail')->name('mail.')->controller(EmailController::class)->group(function() {
        
        Route::post('code', 'sendCodeEmail')->withoutMiddleware('auth:sanctum')->name('sendCodeEmail');
        Route::post('pass', 'sendPassEmail')->name('sendPassEmail');

    });

    Route::prefix('/users')->name('users.')->group(function() {

        Route::controller(UserController::class)->group(function() {
            
            Route::get('', 'index')->name('index');
            Route::post('store','store')->withoutMiddleware('auth:sanctum')->name('store');
            Route::get('{id}', 'show')->name('show');
            Route::post('showByEmail', 'showByEmail')->withoutMiddleware('auth:sanctum')->name('showByEmail');
            Route::put('{id}/update', 'update')->withoutMiddleware('auth:sanctum')->name('update');
            Route::delete('{id}/destroy', 'destroy')->name('destroy');

        });

        Route::controller(UserInformationController::class)->prefix('{id}/information')->group(function () {
            
            Route::get('','show')->name('show');
            Route::put('update','update')->name('update');
           
        });

    });

    Route::prefix('/demande')->name('demande.')->controller(DemandeAgrementController::class)->group(function() {
        Route::get('/agrements', 'indexAgrement')->name('indexAgrement');
        Route::get('/agrements/trashed', 'indexTrashed')->name('indexTrashed');
        Route::post('/agrements/showByStatus','showByStatus')->name('showByStatus');
        Route::get('/agrements/{id}','show')->name('show');
        Route::get('/agrements/trashed/{id}','showTrashed')->name('showTrashed');
        Route::put('/agrements/{id}','update')->name('update');
        Route::put('/agrements/{id}/restore','restore')->name('restore');
        Route::delete('/agrements/{id}','destroy')->name('destroy');
    });
    

    Route::prefix('/etablissements')->name('etablissements.')->controller(EtablissementController::class)->group(function() {
        Route::get('', 'index')->name('index');
        Route::get('/trashed', 'indexTrashed')->name('indexTrashed');
        Route::post('/store','store')->name('store');
        Route::get('{id}', 'show')->name('show');
        Route::put('{id}/update', 'update')->name('update');
        Route::put('{id}/addProprio', 'addProprio')->name('addProprio');
        Route::delete('{id}/destroy', 'destroy')->name('destroy');
        Route::put('{id}/restore','restore')->name('restore');
    });

    Route::prefix('/agrements')->name('agrements.')->controller(AgrementController::class)->group(function() {
        
        Route::get('', 'index')->name('index');
        Route::get('/trashed', 'indexTrashed')->name('indexTrashed');
        Route::get('{id}', 'show')->name('show');
        Route::get('/trashed/{id}', 'showTrashed')->name('showTrashed');
        Route::put('{id}/update', 'update')->name('update');
        Route::put('{id}/restore','restore')->name('restore');
        Route::put('{id}/activer','activer')->name('activer');
        Route::put('{id}/retirer','retirer')->name('retirer');
        Route::put('{id}/suspendre','suspendre')->name('suspendre');
        Route::delete('{id}','destroy')->name('destroy');
    });

    Route::prefix('/remarques')->name('remarques.')->controller(RemarkController::class)->group(function() {
        Route::post('/store/{id}','store')->name('store');
        Route::get('{id}', 'showByAgreement')->name('showByAgreement');
        Route::put('{id}/update', 'update')->name('update');
        Route::delete('{id}/destroy', 'destroy')->name('destroy');
    });

    Route::prefix('filieres')->name('filieres.')->controller(FiliereController::class)->group(function() {
        
        Route::get('','index')->name('index');
        Route::post('store','store')->name('store');
        Route::get('{id}','show')->name('show');
        Route::put('{id}/update','update')->name('update');
        Route::delete('{id}/destroy','destroy')->name('destroy');

    });

    Route::prefix('typeactivites')->name('typeactivites.')->controller(TypeActiviteController::class)->group(function() {
        
        Route::get('','index')->name('index');
        Route::post('store','store')->name('store');
        Route::get('{id}','show')->name('show');
        Route::put('{id}/update','update')->name('update');
        Route::delete('{id}/destroy','destroy')->name('destroy');

    });

    Route::prefix('typeagrements')->name('typeagrements.')->controller(TypeAgrementController::class)->group(function() {
        
        Route::get('','index')->name('index');
        Route::post('store','store')->name('store');
        Route::get('{id}','show')->name('show');
        Route::put('{id}/update','update')->name('update');
        Route::delete('{id}/destroy','destroy')->name('destroy');

    });

    Route::prefix('mine')->name('mine.')->group(function() {
        
        Route::controller(MainController::class)->prefix('information')->group(function() {
            
            Route::get('', 'index')->name('index');
            Route::put('', 'update')->name('update');

        });

        Route::controller(NotificationController::class)->prefix('notifications')->group(function() {
            
            Route::get('', 'index')->name('index');
            Route::get('unseen', 'getUnseenNotifications')->name('getUnseenNotifications');
            Route::put('{id}/restore','restore')->name('restore');
            Route::put('{id}/markAsSeen','markAsSeen')->name('markAsSeen');
            Route::delete('{id}','destroy')->name('destroy');

        });

        Route::prefix('etablissements')->group(function() {

            Route::controller(MineEtablissementController::class)->group(function() {

                Route::get('', 'index')->name('index');
                Route::post('store', 'store')->name('store');
                Route::get('{id}', 'show')->name('show');
                
            });

            Route::controller(DemandeAgrementController::class)->prefix('{id}/demande-agrement')->name('demandeagrements.')->group(function() {
                
                Route::get('','index')->name('index');
                Route::post('','store')->name('store');

            });

        });

    });
   
});