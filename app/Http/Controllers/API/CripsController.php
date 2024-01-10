<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use App\Models\Kriteria;
use App\Models\Crips;

class CripsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        
    }

    /**
     * Get all kriteria by crips
     *
     * @return \Illuminate\Http\Response
     */
    public function getKriteriaByCrips(Request $request)
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
     * Get crips by kriteria
     *
     * @return \Illuminate\Http\Response
     */
    public function getCripsByKriteria(Request $request, $kriteria_id)
    {
        $search = $request->input('search.value');
        $search = empty($search) ? "" : "AND (nama LIKE '%".$search."%')";
        $kriteria = \DB::select("
            SELECT * FROM 
            crips
            WHERE id IS NOT NULL AND kriteria_id = $kriteria_id $search 
            ");
        $kriteria = collect($kriteria);
        return DataTables::of($kriteria)
        ->filter(function ($query) {})
        ->make(true);
    }

    /**
     * Get max nilai
     *
     * @return \Illuminate\Http\Response
     */
    public function getMaxNilai(Request $request, $kriteria_id) 
    {
        try {
            $kriteria_id = $request->kriteria_id;
            $id = $request->id ?? null;
            if (!empty($kriteria_id)) {
                $total_nilai = Crips::select('nilai')
                                ->where('kriteria_id', '=', $kriteria_id)
                                ->where('id', '!=', $id)
                                ->sum('nilai') ?? 0;
            } else {
                $total_nilai = Crips::select('nilai')->where('kriteria_id', '=', $kriteria_id)->sum('nilai') ?? 0;
            }
            
            return response()->json([
                "message" => "success",
                "data" => [
                    'max_nilai' => Crips::MAX_NILAI - $total_nilai,
                ],
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
            $crips = new Crips();
        
            $crips->nama = $request->nama;
            $crips->nilai = $request->nilai;
            $crips->kriteria_id = $request->kriteria_id;
        
            $crips->save();

            return response()->json([
                "message" => "Data Sub Kriteria Berhasil ditambahkan"
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
            $crips = Crips::findOrFail($id);
            return response()->json([
                "message" => "success",
                "data" => $crips
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

            $crips = Crips::findOrFail($id);
        
            $crips->nama = $request->nama;
            $crips->nilai = $request->nilai;
            $crips->kriteria_id = $request->kriteria_id;
        
            $crips->save();

            return response()->json([
                "message" => "Data Crips Berhasil diupdate"
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
            $crips = Crips::findOrFail($id);
            $crips->delete();

            return response()->json([
                "message" => "Data Crips Berhasil dihapus"
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }
}
