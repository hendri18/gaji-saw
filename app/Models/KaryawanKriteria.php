<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Crips;

class KaryawanKriteria extends Model
{
    use HasFactory;

    protected $table = 'karyawan_kriteria';
    public $timestamps = false;

    public function crip()
    {
        return $this->belongsTo(Crips::class);
    }
}
