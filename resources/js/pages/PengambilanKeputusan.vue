<template>
    <div class="card">
        <div class="card-header">Data Karyawan</div>
        <div class="card-body">
            <table class="display table table-bordered">
                <thead>
                    <tr>
                        <th v-for="column in columns">{{ column.title }}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(kk, i) in karyawan_kriteria">
                        <td v-for="data in kk">{{ data.key }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="card mt-3">
        <div class="card-header">Normalisasi</div>
        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th v-for="column in columns">{{ column.title }}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(kk, i) in normalization">
                        <td v-for="data in kk">{{ data.value }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="card my-3">
        <div class="card-header">Hasil</div>
        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Ranking</th>
                        <th>Nama</th>
                        <th>Nilai Akhir</th>
                        <th>Persentase</th>
                        <th>Kenaikan Gaji</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(ranking, i) in rankings">
                        <td>{{ ranking.rank }}</td>
                        <td>{{ ranking.nama }}</td>
                        <td>{{ ranking.total }}</td>
                        <td>{{ ranking.percentage }}</td>
                        <td><b>{{ ranking.salary_increase }}</b></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="mb-3 d-flex justify-content-end">
        <a href="/export" class="btn btn-success mr-2">Export Excel</a>
        <a href="/export?type=pdf" class="btn btn-secondary">Export PDF</a>
        <button type="button" class="btn btn-primary" @click="save">Simpan</button>
    </div>
</template>
<script>

import { ref, onMounted } from 'vue'
import axios from 'axios'
export default {
    setup() {
        const crips = ref({})
        const karyawan_kriteria = ref([])
        const columns = ref([])
        const normalization = ref([])
        const rankings = ref([])

        onMounted (async () => {
            try {
                const resp = await axios.get(`api/all-data`);
                columns.value = resp.data.data.columns;
                karyawan_kriteria.value = resp.data.data.karyawan_kriteria;
                normalization.value = resp.data.data.normalization;
                rankings.value = resp.data.data.rankings;

            } catch (error) {
                const error_message = error.response.data.message ?? error.message;
                popupError(error_message)
                console.error(error)
            }
        })

        const save = () => {
            const url = 'api/histori';
            const method = `post`;
            axios({
                method: method,
                url: url,
                data: {
                    columns: columns.value,
                    karyawan_kriteria: karyawan_kriteria.value,
                    normalization: normalization.value,
                    rankings: rankings.value,
                }
            }).then((response) => {
                popupSuccess(response.data.message ?? '')
                $('#modalFormKriteria').modal('hide')
                setTimeout(() => TABLE.data.ajax.reload(), 500);
            })
            .catch((error) => {
                popupError(error.response.data.message ?? error.message)
                console.error(error)
            });
        }

        return {
            columns, crips, karyawan_kriteria, normalization, rankings, save
        }
    },
    mounted() {
        window.__vueApp = this;
    }
}
</script>