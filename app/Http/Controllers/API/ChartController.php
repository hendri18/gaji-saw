<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Kriteria;
use App\Models\Karyawan;
use App\Models\Histori;
use App\Traits\PengambilanKeputusan;
use Illuminate\Validation\ValidationException;

class ChartController extends Controller
{
    use PengambilanKeputusan;

    public function getAllData() 
    {
        try {
            $dates = Histori::select('tanggal')->pluck('tanggal');
            $histori = Histori::orderBy('tanggal', 'desc')->first();
            $employees = Karyawan::select('nama')->pluck('nama');
            return response()->json([
                "message" => "success",
                "history" => $histori,
                "dates" => $dates,
                "employees" => $employees
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }

    public function getDataByKaryawan(Request $request)
    {
        try {
            $histori = Histori::orderBy('tanggal', 'asc')->get();
            $karyawan = $request->karyawan;
            $data = [];
            $kenaikan_i = 0;
            foreach($histori as $h) {
                foreach($h->rankings_data as $rd) {
                    if ($rd->nama != $karyawan) continue;

                    $salary_increase = str_replace("Rp.", "", $rd->salary_increase);
                    $salary_increase = str_replace(",00", "", $salary_increase);
                    $salary_increase = str_replace(",00", "", $salary_increase);
                    $salary_increase = (int) preg_replace('/[^0-9]/', '', $salary_increase);
                    $kenaikan_i += $salary_increase;
                    $data[] = [
                        'tanggal' => $h->tanggal,
                        'kenaikan' => $salary_increase,
                        'current_total_kenaikan' => $kenaikan_i,
                    ];
                }
            }

            return response()->json([
                "message" => "success",
                "history_karyawan" => $data,
                
        
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }



}
