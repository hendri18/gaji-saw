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
use App\Models\PersentaseKenaikan;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role = Role::create(['name' => 'administrator']);
        $user = User::create([
            'name' => 'admin Hendri',
            'email' => 'admin@senja.com',
            'password' => Hash::make('admin123'),
        ]);
        $user->assignRole($role);
        
    }
}
