<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use App\Models\Karyawan;


class KaryawanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $search = $request->input('search.value');
        $search = empty($search) ? "" : "AND (nama LIKE '%".$search."%' OR alamat LIKE '%".$search."%' OR tgl_masuk_kerja LIKE '%".$search."%' OR pendidikan LIKE '%".$search."%' OR status_pernikahan LIKE '%".$search."%')";
        $karyawan = \DB::select("
            SELECT * FROM 
            karyawan
            WHERE id IS NOT NULL $search 
            ");
        $karyawan = collect($karyawan);
        return DataTables::of($karyawan)
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
            $karyawan = new Karyawan();
        
            $karyawan->nama = $request->nama;
            $karyawan->tgl_masuk_kerja = $request->tgl_masuk_kerja;
            $karyawan->alamat = $request->alamat;
            $karyawan->pendidikan = $request->pendidikan;
            $karyawan->status_pernikahan = $request->status_pernikahan;
        
            $karyawan->save();

            return response()->json([
                "message" => "Karyawan Berhasil ditambahkan"
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
            $karyawan = Karyawan::findOrFail($id);
            return response()->json([
                "message" => "success",
                "data" => $karyawan
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
            $karyawan = Karyawan::findOrFail($id);
        
            $karyawan->nama = $request->nama;
            $karyawan->tgl_masuk_kerja = $request->tgl_masuk_kerja;
            $karyawan->alamat = $request->alamat;
            $karyawan->pendidikan = $request->pendidikan;
            $karyawan->status_pernikahan = $request->status_pernikahan;
        
            $karyawan->save();

            return response()->json([
                "message" => "Karyawan Berhasil diupdate"
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
            $karyawan = Karyawan::findOrFail($id);
            $karyawan->delete();

            return response()->json([
                "message" => "Karyawan Berhasil dihapus"
            ]);
        } catch(Exception $e) {
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }
}
