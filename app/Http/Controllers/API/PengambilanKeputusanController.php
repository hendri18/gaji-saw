<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Kriteria;
use App\Models\Karyawan;
use App\Models\Histori;
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

    public function save(Request $request)
    {
        try {
            $histori = new Histori();
            $histori->tanggal = date('Y-m-d');
            $histori->columns = json_encode($request->columns);
            $histori->karyawan_kriteria = json_encode($request->karyawan_kriteria);
            $histori->normalization = json_encode($request->normalization);
            $histori->rankings = json_encode($request->rankings);
            $histori->save();

            return response()->json([
                "message" => "Histori berhasil disimpan",
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }

    public function getHistori(Request $request)
    {
        try {
            $histori = Histori::whereDate('tanggal', '=', $request->tanggal)->first();
            return response()->json([
                "message" => "success",
                "data" => $histori,
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }

}
