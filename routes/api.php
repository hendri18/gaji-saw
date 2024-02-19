<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\KaryawanController;
use App\Http\Controllers\API\KriteriaController;
use App\Http\Controllers\API\CripsController;
use App\Http\Controllers\API\PengambilanKeputusanController;
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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('karyawan/columns', [KaryawanController::class, 'columns']);
Route::apiResource('karyawan', KaryawanController::class);
// TODO: change to manual route using route group
Route::get('kriteria/max-bobot', [KriteriaController::class, 'getMaxBobot']);
Route::get('kriteria/crips', [KriteriaController::class, 'getKriteriaCrips']);
Route::apiResource('kriteria', KriteriaController::class);
Route::get('crips/all-kriteria', [CripsController::class, 'getKriteriaByCrips']);
Route::get('crips/kriteria/{kriteria_id}', [CripsController::class, 'getCripsByKriteria']);
Route::apiResource('crips', CripsController::class);
Route::get('all-data', [PengambilanKeputusanController::class, 'getAllData']);
Route::get('histori', [PengambilanKeputusanController::class, 'getHistori']);
Route::post('histori', [PengambilanKeputusanController::class, 'save']);

Route::get('all-roles', [App\Http\Controllers\API\UserController::class, 'getRoles']);
Route::apiResource('user', App\Http\Controllers\API\UserController::class);

Route::apiResource('persentase-kenaikan', App\Http\Controllers\API\PersentaseKenaikanController::class);