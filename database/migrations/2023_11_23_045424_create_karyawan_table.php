<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('karyawan', function (Blueprint $table) {
            $table->id();
            $table->string('nama');
            $table->date('tgl_masuk_kerja');
            $table->text('alamat')->nullable();
            $table->enum('pendidikan', ['sd', 'smp', 'sma', 'd3', 's1', 's2', 's3'])->nullable();
            $table->enum('status_pernikahan', ['single', 'nikah'])->default('single');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('karyawan');
    }
};
