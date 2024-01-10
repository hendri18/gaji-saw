<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\KaryawanController;
use App\Http\Controllers\API\KriteriaController;
use App\Http\Controllers\API\CripsController;
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
Route::get('kriteria/max-bobot', [KriteriaController::class, 'getMaxBobot']);
Route::get('kriteria/crips', [KriteriaController::class, 'getKriteriaCrips']);
Route::apiResource('kriteria', KriteriaController::class);
Route::get('crips/all-kriteria', [CripsController::class, 'getKriteriaByCrips']);
Route::get('crips/kriteria/{kriteria_id}', [CripsController::class, 'getCripsByKriteria']);
Route::get('crips/max-nilai/{kriteria_id}/', [CripsController::class, 'getMaxNilai']);
Route::apiResource('crips', CripsController::class);
