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
                        <td>{{ ranking.salary_increase }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
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
                popupError(error)
                console.error(error)
            }
        })

        return {
            columns, crips, karyawan_kriteria, normalization, rankings
        }
    },
    mounted() {
        window.__vueApp = this;
    }
}
</script>