<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PersentaseKenaikan;

class PersentaseKenaikanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            $pk = PersentaseKenaikan::all();
            return response()->json([
                "message" => "success",
                "data" => $pk
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            
            PersentaseKenaikan::truncate();

            foreach ($request->pk as $pk) {
                $persenKeputusan = new PersentaseKenaikan();
                $persenKeputusan->dari = $pk['dari'];
                $persenKeputusan->sampai = $pk['sampai'];
                $persenKeputusan->nilai = $pk['nilai'];
                $persenKeputusan->save();
            }

            
            return response()->json([
                "message" => "Data berhasil disimpan.",
            ]);
        } catch(Exception $e) {
            
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }
}
