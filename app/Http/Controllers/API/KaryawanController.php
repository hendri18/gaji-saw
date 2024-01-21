<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use App\Models\Karyawan;
use App\Models\Kriteria;
use App\Models\KaryawanKriteria;


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
        $search = empty($search) ? "" : "AND (nama LIKE '%".$search."%')";
        $all_data = \DB::select("SELECT id, nama, kk.crip_id, c_nama, c_nilai, kk.karyawan_id, kk.kriteria_id  FROM karyawan 
            LEFT JOIN 
                (SELECT crips.nama c_nama, crips.nilai c_nilai, karyawan_kriteria.crip_id, karyawan_kriteria.karyawan_id, crips.kriteria_id FROM karyawan_kriteria 
                 INNER JOIN crips ON crips.id = karyawan_kriteria.crip_id) kk
            ON kk.karyawan_id = karyawan.id
        WHERE id IS NOT NULL $search 
            ");

        $karyawan = [];
        $columns = Kriteria::getColumns();

        foreach ($all_data as $data) {

            if (empty($karyawan[$data->id]))
                $karyawan[$data->id] = [];
            
            foreach ($columns as $i => $column) {
                if (empty($karyawan[$data->id][$i]))
                    $karyawan[$data->id][$i] = '';

                if ($column['title'] == 'ID')
                    $karyawan[$data->id][$i] = $data->id;
                
                if ($column['title'] == 'Nama')
                    $karyawan[$data->id][$i] = $data->nama;

                if (!empty($column['kriteria_id']) && $column['kriteria_id'] == $data->kriteria_id)
                    $karyawan[$data->id][$i] = $data->c_nama;                
            }
        }
    
        return DataTables::of($karyawan)
        ->filter(function ($query) {})
        ->make(true);
    }

    public function columns(Request $request)
    {
        return response()->json([
            "data" => [
                'columns' => Kriteria::getColumns(),
            ],
            "message" => "success"
        ]);
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
            \DB::beginTransaction();

            $karyawan = new Karyawan();
            $karyawan->nama = $request->nama;
            $karyawan->save();

            foreach (($request->crips_id ?? []) as $crip_id) {
                $kk = new KaryawanKriteria();
                $kk->karyawan_id = $karyawan->id;
                $kk->crip_id = $crip_id;
                $kk->save();
            }

            \DB::commit();
            return response()->json([
                "message" => "Karyawan Berhasil ditambahkan"
            ]);
        } catch(Exception $e) {
            \DB::rollback();
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
            $karyawan = Karyawan::with('karyawanKriteria', 'karyawanKriteria.crip')->findOrFail($id);
            return response()->json([
                "message" => "success",
                "data" => $karyawan,
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
            \DB::beginTransaction();

            $karyawan = Karyawan::findOrFail($id);
            $karyawan->nama = $request->nama;
            $karyawan->save();

            foreach (($request->crips_id ?? []) as $kk_id => $crip_id) {

                $kk = KaryawanKriteria::where('id', $kk_id)->first();
                if (!empty($crip_id)) {
                    $kk->crip_id = $crip_id;
                    $kk->save();
                }
            }

            \DB::commit();
            return response()->json([
                "message" => "Karyawan Berhasil diupdate"
            ]);
        } catch(Exception $e) {
            \DB::rollback();
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
            \DB::beginTransaction();

            $karyawan = Karyawan::findOrFail($id);
            $karyawan->delete();

            \DB::commit();

            return response()->json([
                "message" => "Karyawan Berhasil dihapus"
            ]);
        } catch(Exception $e) {
            \DB::rollback();
            return response()->json([
                "message" => $e->getMessage(),
            ], 500);
        }
    }

    private function getColumn()
    {
        $columns = [['title' => 'ID'], ['title' => 'Nama']];

        $kriteria = Kriteria::orderBy('id')->get();      
        foreach ($kriteria as $i => $data) {
            $columns[] = [
                'title' => $data->nama,
                'kriteria_id' => $data->id
            ];
        }

        $columns[]['title'] = 'Action'; //action
        return $columns;
    }
}
