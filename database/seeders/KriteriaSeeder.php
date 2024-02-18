<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use App\Models\User;
use App\Models\Kriteria;
use App\Models\Crips;
use App\Models\Karyawan;
use App\Models\KaryawanKriteria;

class KriteriaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role = Role::create(['name' => 'admin']);
        $user = User::create([
            'name' => 'Admin Hendri',
            'email' => 'admin@hendri.com',
            'password' => Hash::make('admin123'),
        ]);
        $user->assignRole($role);
        
        $role = Role::create(['name' => 'staff']);
        $user = User::create([
            'name' => 'Staff Hendri',
            'email' => 'staff@hendri.com',
            'password' => Hash::make('staff123')
        ]);
        $user->assignRole($role);

        $kriteria = new Kriteria();
        $kriteria->nama = 'Absensi';
        $kriteria->bobot = 10;
        $kriteria->type = 'cost';
        $kriteria->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = 'Kurang dari 10';
        $crip->nilai = 1;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = 'Lebih dari 10';
        $crip->nilai = 2;
        $crip->save();

        $kriteria = new Kriteria();
        $kriteria->nama = 'Kinerja';
        $kriteria->bobot = 30;
        $kriteria->type = 'benefit';
        $kriteria->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = '20%';
        $crip->nilai = 1;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = '40%';
        $crip->nilai = 2;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = '60%';
        $crip->nilai = 3;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = '80%';
        $crip->nilai = 4;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = '90% >';
        $crip->nilai = 5;
        $crip->save();

        $kriteria = new Kriteria();
        $kriteria->nama = 'Pendidikan';
        $kriteria->bobot = 10;
        $kriteria->type = 'benefit';
        $kriteria->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = 'SMA/SMK';
        $crip->nilai = 1;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = 'S1';
        $crip->nilai = 2;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = 'S2';
        $crip->nilai = 3;
        $crip->save();


        $kriteria = new Kriteria();
        $kriteria->nama = 'Masa Kerja';
        $kriteria->bobot = 30;
        $kriteria->type = 'benefit';
        $kriteria->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = '0 - 1 Tahun';
        $crip->nilai = 1;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = '1 - 2 Tahun';
        $crip->nilai = 2;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = '2 - 4 Tahun';
        $crip->nilai = 3;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = '4 Tahun lebih';
        $crip->nilai = 4;
        $crip->save();

        $kriteria = new Kriteria();
        $kriteria->nama = 'Jumlah Tanggungan';
        $kriteria->bobot = 20;
        $kriteria->type = 'benefit';
        $kriteria->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = 'Tidak Ada';
        $crip->nilai = 1;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = '1';
        $crip->nilai = 2;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = '2';
        $crip->nilai = 3;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = '3';
        $crip->nilai = 4;
        $crip->save();

        $crip = new Crips();
        $crip->kriteria_id = $kriteria->id;
        $crip->nama = 'lebih dari 3';
        $crip->nilai = 5;
        $crip->save();

        $alternatif = [
            ["Agus",1,7,9,14,17],
            ["Doni",1,7,8,14,17],
            ["Prama",1,6,9,13,16],
            ["Clifford",2,6,9,13,15],
            ["Ahlam",1,5,8,12,15],
        ];

        foreach ($alternatif as $index => $value) {

            $karyawan = new Karyawan();
            $karyawan->nama = $value[0];
            $karyawan->save();

            for ($i=1; $i <= 5; $i++) { 
                $kk = new KaryawanKriteria();
                $kk->karyawan_id = $karyawan->id;
                $kk->crip_id = $value[$i];
                $kk->save();
            }
            
        }
    }
}
