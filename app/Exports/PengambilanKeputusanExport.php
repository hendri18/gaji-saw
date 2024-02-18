<?php

namespace App\Exports;

use Illuminate\Contracts\View\View; 
use Maatwebsite\Excel\Concerns\FromView;
use App\Traits\PengambilanKeputusan;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class PengambilanKeputusanExport implements FromView, ShouldAutoSize
{
    use PengambilanKeputusan;

    public function view(): View
    {
        $data = $this->calculation();
        return view('export.result', [
            'columns' => $data['columns'],
            'karyawan_kriteria' => $data['karyawan_kriteria'],
            'normalization' => $data['normalization'],
            'rankings' => $data['rankings']
        ]);
    }
}
