<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PersentaseKenaikan extends Model
{
    use HasFactory;

    protected $table = 'persentase_kenaikan';
    public $timestamps = false;
}
