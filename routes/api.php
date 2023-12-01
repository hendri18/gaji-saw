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

Route::apiResource('karyawan', KaryawanController::class);
Route::get('kriteria/max-bobot', [KriteriaController::class, 'getMaxBobot']);
Route::apiResource('kriteria', KriteriaController::class);
Route::apiResource('crips', CripsController::class);
