<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use App\Models\Kriteria;


class KriteriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $search = $request->input('search.value');
        $search = empty($search) ? "" : "AND (nama LIKE '%".$search."%')";
        $kriteria = \DB::select("
            SELECT * FROM 
            kriteria
            WHERE id IS NOT NULL $search 
            ");
        $kriteria = collect($kriteria);
        return DataTables::of($kriteria)
        ->filter(function ($query) {})
        ->make(true);
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
            $kriteria = new Kriteria();
        
            $kriteria->nama = $request->nama;
            $kriteria->bobot = $request->bobot;
            $kriteria->type = $request->type;
            $kriteria->use_crips = (bool) $request->use_crips;
        
            $kriteria->save();

            return response()->json([
                "message" => "Kriteria Berhasil ditambahkan"
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $kriteria = Kriteria::findOrFail($id);
            return response()->json([
                "message" => "success",
                "data" => $kriteria,
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Get max bobot
     *
     * @return \Illuminate\Http\Response
     */
    public function getMaxBobot(Request $request) 
    {
        try {
            $kriteria_id = $request->kriteria_id;
            if (!empty($kriteria_id)) {
                $total_bobot = Kriteria::select('bobot')->where('id', '!=', $kriteria_id)->sum('bobot') ?? 0;
            } else {
                $total_bobot = Kriteria::select('bobot')->sum('bobot') ?? 0;
            }
            return response()->json([
                "message" => "success",
                "data" => [
                    'max_bobot' => Kriteria::MAX_BOBOT - $total_bobot,
                ],
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            $kriteria = Kriteria::findOrFail($id);
        
            $kriteria->nama = $request->nama;
            $kriteria->bobot = $request->bobot;
            $kriteria->type = $request->type;
            $kriteria->use_crips = (bool) $request->use_crips;
        
            $kriteria->save();

            return response()->json([
                "message" => "Kriteria Berhasil diupdate"
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $kriteria = Kriteria::findOrFail($id);
            $kriteria->delete();

            return response()->json([
                "message" => "Kriteria Berhasil dihapus"
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }
}
