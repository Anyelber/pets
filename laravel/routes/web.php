<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PetsController;

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
    return view('welcome');
});

//Rutas principales
Route::post('/pet', [PetsController::class, 'addPet']);
Route::put('/pet', [PetsController::class, 'editPet']);
Route::get('/pet/findByStatus', [PetsController::class, 'getPetByStatus']);
Route::get('/pet/{id}', [PetsController::class, 'getPetById']);
Route::post('/pet/{id}', [PetsController::class, 'editPetInStore']);
Route::delete('/pet/{id}', [PetsController::class, 'deletePet']);

//rutas helpers
Route::get('/getPets', [PetsController::class, 'getPets']);
Route::get('/borrarImagen/{id}', [PetsController::class, 'borrarImagen']);
Route::get('/categories', [PetsController::class, 'listaCategorias']);
Route::get('/tags', [PetsController::class, 'listaTags']);