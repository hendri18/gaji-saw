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
    public $timestamps = false;

    public function crips()
    {
        return $this->hasMany(Crips::class);
    }

    public static function getColumns($with_action = true)
    {
        if ($with_action) {
            $columns = [['title' => 'ID'], ['title' => 'Nama']];
        } else {
            $columns = [['title' => 'Nama']];
        }

        $kriteria = Kriteria::orderBy('id')->get();      
        foreach ($kriteria as $i => $data) {
            $columns[] = [
                'title' => $data->nama,
                'kriteria_id' => $data->id,
                'bobot' => $data->bobot,
                'type' => $data->type,
            ];
        }

        if ($with_action) 
            $columns[]['title'] = 'Action'; //action
        return $columns;
    }
}
