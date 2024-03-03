<template>
    <template v-if="type === 'result'">
        <div class="d-flex align-items-center mb-3">
            <button type="button" class="btn btn-secondary me-3" @click="resetHistory" v-if="hasRoles('staff')">Kembali</button>
            <h5 v-if="show_history">Histori Pengambilan Keputusan Tanggal: {{ tgl_histori }}</h5>
        </div>
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
        <div class="mb-3 d-flex justify-content-between" v-if="hasRoles('atasan')">
            <div>
                <div class="d-flex align-items-center">
                    Histori: <div class="ml-2 d-flex"><select name="tgl_histori" v-model="tgl_histori" id=""><option :value="date" v-for="date in dates">{{ date }}</option></select><button class="btn btn-primary" :class="tgl_histori === '' ? 'disabled' : ''" @click="getHistory">Tampilkan</button><button class="btn btn-danger ms-2" v-if="show_history" @click="resetHistory">Reset</button></div>
                </div>
                
            </div>
            <div>
                <a href="/export" class="btn btn-success mr-2">Export Excel</a>
                <a href="/export?type=pdf" class="btn btn-secondary mr-2">Export PDF</a>
                <button type="button" class="btn btn-primary" @click="save" v-if="hasRoles('atasan')">Simpan</button>
            </div>
            
        </div>
    </template>
    <template v-if="type === 'table'">
        <div class="card">
            <div class="card-header">Laporan Kenaikan Gaji</div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Tanggal</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="date in dates">
                            <td>{{ date }}</td>
                            <td><button type="button" class="btn btn-primary" @click="getHistoryByDate(date)">Lihat</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </template>
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
        const tgl_histori = ref('');
        const show_history = ref(false);
        const dates = ref([]);
        const type = ref('result')

        onMounted (async () => {
            try {
                type.value = hasRoles('atasan') ? 'result' : 'table';
                const resp = await axios.get(`api/all-data`);
                columns.value = resp.data.data.columns;
                karyawan_kriteria.value = resp.data.data.karyawan_kriteria;
                normalization.value = resp.data.data.normalization;
                rankings.value = resp.data.data.rankings;
                dates.value = resp.data.data.dates;
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

        const getHistory = async () => {
            try {
                const resp = await axios.get(`api/histori`, {params: {tanggal: tgl_histori.value}});
                if (resp.data.data) {
                    columns.value = JSON.parse(resp.data.data.columns);
                    karyawan_kriteria.value = JSON.parse(resp.data.data.karyawan_kriteria);
                    normalization.value = JSON.parse(resp.data.data.normalization);
                    rankings.value = JSON.parse(resp.data.data.rankings);
                    show_history.value = true;
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                } else {
                    popupError('Data tidak ditemukan');
                }

            } catch (error) {
                const error_message = error.response.data.message ?? error.message;
                popupError(error_message)
                console.error(error)
            }
        }

        const getHistoryByDate = async (date) => {
            tgl_histori.value = date;
            type.value = 'result';
            getHistory();
        }

        const resetHistory = async () => {
            try {
                const resp = await axios.get(`api/all-data`);
                columns.value = resp.data.data.columns;
                karyawan_kriteria.value = resp.data.data.karyawan_kriteria;
                normalization.value = resp.data.data.normalization;
                rankings.value = resp.data.data.rankings;
                show_history.value = false;
                tgl_histori.value = '';
                type.value = hasRoles('atasan') ? 'result' : 'table';
                window.scrollTo({ top: 0, behavior: 'smooth' });

            } catch (error) {
                const error_message = error.response.data.message ?? error.message;
                popupError(error_message)
                console.error(error)
            }
        }

        const hasRoles = (roles) => {
            return window.hasRoles(roles)
        }
        
        return {
            columns, crips, karyawan_kriteria, normalization, rankings, save, tgl_histori, show_history, getHistory, getHistoryByDate, resetHistory, dates, hasRoles, type
        }
    },
    mounted() {
        window.__vueApp = this;
    }
}
</script>