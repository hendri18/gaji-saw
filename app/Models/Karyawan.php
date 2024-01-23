<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\KaryawanKriteria;

class Karyawan extends Model
{
    use HasFactory;

    protected $table = 'karyawan';
    public $timestamps = false;

    public function karyawanKriteria()
    {
        return $this->hasMany(KaryawanKriteria::class);
    }
}
