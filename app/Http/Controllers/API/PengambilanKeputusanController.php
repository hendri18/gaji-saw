<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Kriteria;
use App\Models\Karyawan;
use App\Traits\PengambilanKeputusan;
use Illuminate\Validation\ValidationException;

class PengambilanKeputusanController extends Controller
{
    use PengambilanKeputusan;

    public function getAllData() 
    {
        try {
            $data = $this->calculation();

            return response()->json([
                "message" => "success",
                "data" => [
                    'columns' => $data['columns'],
                    'karyawan_kriteria' => $data['karyawan_kriteria'],
                    'normalization' => $data['normalization'],
                    'rankings' => $data['rankings']
                ]
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }

}
