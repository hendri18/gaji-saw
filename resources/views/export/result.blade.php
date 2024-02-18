<table>
    <thead>
        <tr>
            <th><b>Data Karyawan</b></th>
        </tr>
        <tr>
            @foreach($columns as $column)
            <th><b>{{ $column['title'] }}</b></th>
            @endforeach
        </tr>
    </thead>
    <tbody>
        @foreach($karyawan_kriteria as $kk_data)
        <tr>
            @foreach ($kk_data as $data)
            <td>{{ $data['key'] }}</td>
            @endforeach
        </tr>
        @endforeach
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th><b>Normalisasi</b></th>
        </tr>
        <tr>
            @foreach($columns as $column)
            <th><b>{{ $column['title'] }}</b></th>
            @endforeach
        </tr>
    </thead>
    <tbody>
        @foreach($normalization as $kk_data)
        <tr>
            @foreach ($kk_data as $kk)
            <td>{{ $data['value'] }}</td>
            @endforeach
        </tr>
        @endforeach
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th><b>Hasil</b></th>
        </tr>
        <tr>
            <th><b>Ranking</b></th>
            <th><b>Nama</b></th>
            <th><b>Nilai Akhir</b></th>
            <th><b>Persentase</b></th>
            <th><b>Kenaikan Gaji</b></th>
        </tr>
    </thead>
    <tbody>
        @foreach($rankings as $ranking)
        <tr>
            <td>{{ $ranking['rank'] }}</td>
            <td>{{ $ranking['nama'] }}</td>
            <td>{{ $ranking['total'] }}</td>
            <td>{{ $ranking['percentage'] }}</td>
            <td><b>{{ $ranking['salary_increase'] }}</b></td>
        </tr>
        @endforeach
    </tbody>
</table>