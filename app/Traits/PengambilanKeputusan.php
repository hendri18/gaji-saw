<?php
namespace App\Traits;

use Illuminate\Http\Request;
use App\Models\Kriteria;
use App\Models\Karyawan;
use App\Models\PersentaseKenaikan;

trait PengambilanKeputusan {

    public function calculation() 
    {
        try {
            $all_data = \DB::select("SELECT id, nama, kk.crip_id, c_nama, c_nilai, kk.karyawan_id, kk.kriteria_id  FROM karyawan 
            LEFT JOIN 
                (SELECT crips.nama c_nama, crips.nilai c_nilai, karyawan_kriteria.crip_id, karyawan_kriteria.karyawan_id, crips.kriteria_id FROM karyawan_kriteria 
                 INNER JOIN crips ON crips.id = karyawan_kriteria.crip_id) kk
                ON kk.karyawan_id = karyawan.id
            WHERE id IS NOT NULL 
                ");

            $columns = Kriteria::getColumns(false);

            $karyawan_kriteria = [];
            $alternatifHasEmptyCriteria = false;
            foreach ($all_data as $data) {

                $item = [];
                $karyawan_id = $data->id;
                foreach ($columns as $i => $column) {
                    if (empty($karyawan_kriteria[$karyawan_id][$i]))
                        $karyawan_kriteria[$karyawan_id][$i] = [];
                    
                    if ($column['title'] == 'Nama') {
                        $karyawan_kriteria[$karyawan_id][$i]['key'] = $data->nama;
                        $karyawan_kriteria[$karyawan_id][$i]['value'] = $data->nama;
                    }

                    if (isset($column['kriteria_id'])) {
                        if ($column['kriteria_id'] == $data->kriteria_id) {
                            $karyawan_kriteria[$karyawan_id][$i]['key'] = $data->c_nama; 
                            $karyawan_kriteria[$karyawan_id][$i]['value'] = $data->c_nilai;
                            $karyawan_kriteria[$karyawan_id][$i]['kriteria_id'] = $data->kriteria_id;
                        }
                        
                    }
                }
            }
            
            $normalization = $this->normalization($columns, $karyawan_kriteria);
            $rankings = $this->rankings($columns, $normalization);

            return [
                'columns' => $columns,
                'karyawan_kriteria' => $karyawan_kriteria,
                'normalization' => $normalization,
                'rankings' => $rankings
            ];
        } catch(Exception $e) {
            abort($e->getMessage());
            return [
                "message" => $e->getMessage(),
            ];
        }
    }

    private function normalization($columns, $karyawan_kriteria) 
    {
        $normalization = $karyawan_kriteria;

        foreach ($karyawan_kriteria as $karyawan_id => $kk) {
            
            foreach ($columns as $i => $column) {
                if (isset($column['kriteria_id'])) {
                    $data = $kk[$i];
                    if (empty($data)) return abort( response()->json(['message' => 'Ada kriteria yang belum diisi, silahkan isi di menu karyawan'], 404));
                    $type = $column['type'];
                    $divideBy = $this->getMinMaxValueByKriteria($data['kriteria_id'], $karyawan_kriteria);

                    if (isset($data['kriteria_id']) && $data['kriteria_id'] == $column['kriteria_id']) {
                        if ($type == 'benefit') {
                            $rij = ($data['value'] / $divideBy[$type]);
                        } else {
                            $rij = ($divideBy[$type] / $data['value']);
                        }
                        $normalization[$karyawan_id][$i]['value'] = round($rij, 2);
                    }
                }
            }
            
        }
        return $normalization;
    }

    private function rankings($columns, $normalization)
    {
        $rankings = [];
        foreach ($normalization as $karyawan_id => $normal) {
            $rankings[$karyawan_id] = [];

            foreach ($columns as $i => $column) {
                $data = $normal[$i];
                if ($column['title'] == 'Nama') 
                    $rankings[$karyawan_id]['nama'] = $data['value'];

                if (empty($rankings[$karyawan_id]['total']))
                    $rankings[$karyawan_id]['total'] = 0;

                if (isset($column['kriteria_id']) && isset($data['kriteria_id']) && $column['kriteria_id'] == $data['kriteria_id']) {
                    $rankings[$karyawan_id]['total'] += $data['value'] * ($column['bobot'] / 100);
                }
            }
        }
        
        usort($rankings, function($a, $b) {
            if ($a['total'] > $b['total']) {
                return -1;
            } elseif ($a['total'] < $b['total']) {
                return 1;
            }
        });
        $no = 1;
        $pk = PersentaseKenaikan::all();
        $rankings = array_map(function($item) use (&$no, $pk) {
            $item['rank'] = $no;
            $item['total'] = round($item['total'], 2);
            $item['percentage'] = (int) round($item['total'] * 100, 0);
            $item['salary_increase'] = $this->getSalaryIncrease($item['percentage'], $pk);
            $no++;
            return $item;
        }, $rankings);

        return $rankings;
    }

    private function getMinMaxValueByKriteria($kriteria_id, $karyawan_kriteria)
    {
        $max = null;
        $min = null;

        foreach ($karyawan_kriteria as $kk) {
            foreach ($kk as $data) {
                if (isset($data['kriteria_id']) && $data['kriteria_id'] == $kriteria_id) {
                    if ($min == null && $max == null) {
                        $min = $data['value'];
                        $max = $data['value'];
                    }
                    if ($max <= $data['value']) {
                        $max = $data['value'];
                    }
                    if ($min >= $data['value']) {
                        $min = $data['value'];
                    }
                }
            }
        }

        return [
            'benefit' => $max,
            'cost' => $min
        ];

    }

    private function getSalaryIncrease($percent, $pk)
    {
        foreach ($pk as $data) {
            if ($percent > $data->dari && $percent <= $data->sampai) {
                $salary_up = $data->nilai;
                return $salary_up !== 0 ? 'Rp. '.number_format($salary_up, 2, ",", ".") : 'Tidak Memenuhi Kriteria';
            }
        }
        return 'Tidak Memenuhi Kriteria';        
    }
}