<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Histori extends Model
{
    use HasFactory;

    protected $table = 'histori';
    public $timestamps = false;

    // protected $appends = ['columns_data', 'karyawan_kriteria_data', 'rankings_data'];
    protected $appends = ['rankings_data'];

    public function getColumnsDataAttribute()
    {
        return json_decode($this->columns);
    }

    public function getKaryawanKriteriaDataAttribute()
    {
        return json_decode($this->karyawan_kriteria);
    }

    public function getRankingsDataAttribute()
    {
        return json_decode($this->rankings);
    }
}
