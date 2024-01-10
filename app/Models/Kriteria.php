<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Crips;

class Kriteria extends Model
{
    use HasFactory;

    const MAX_BOBOT = 100;
    protected $table = 'kriteria';

    public function crips()
    {
        return $this->hasMany(Crips::class);
    }
}
