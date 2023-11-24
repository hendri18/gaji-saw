<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use App\Http\Resources\KaryawanResource;
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
        $search = empty($search) ? "" : "AND (name LIKE '%".$search."%' OR address LIKE '%".$search."%' OR phone_number LIKE '%".$search."%' OR place_of_birth LIKE '%".$search."%' OR date_of_birth LIKE '%".$search."%')";
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
