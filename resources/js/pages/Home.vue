<template>
    <h5 class="font-dark">Selamat Datang di</h5>
    <h4 class="font-dark"><b>Sistem Pendukung Keputusan Kenaikan Gaji Karyawan PT. Senja Solusi</b></h4>
    <div class="card mb-3">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-auto">Tanggal: </div>
                <div class="col-md-4">
                    <select name="tgl_histori" v-model="tgl_histori" class="form-select" @change="getHistory"><option :value="date" v-for="date in dates">{{ date }}</option></select> 
                </div>
                <div class="col-md-3">
                    <select name="chart_type" v-model="chart_type" @change="changeChartType" class="form-select">
                        <option value="bar">Bar</option>
                        <option value="line">Garis</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="card-body">
            <canvas id="current-chart"></canvas>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-auto">Total Kenaikan Gaji - Karyawan: </div>
                <div class="col-md-4">
                    <select name="karyawan" v-model="karyawan" class="form-select" @change="getKaryawan"><option :value="employee" v-for="employee in employees">{{ employee }}</option></select> 
                </div>
            </div>
        </div>
        <div class="card-body">
            <canvas id="karyawan-chart" :class="karyawan.length < 1 ? 'd-none' : '' "></canvas>
        </div>
    </div>
</template>
<script>

import { onMounted, ref } from 'vue'
import Chart from 'chart.js/auto';
export default {
    setup() {
        const dates = ref([]);
        const tgl_histori = ref('');
        const karyawan = ref([]);
        const chart_type = ref('bar');
        const employees = ref([]);

        const getHistory = async () => {
            try {
                const resp = await axios.get(`api/histori`, {params: {tanggal: tgl_histori.value}});
                if (resp.data.data) {
                    const data = resp.data.data.rankings_data;
                    if (window.current_chart) {
                        window.current_chart.data.labels = data.map(row => row.nama);
                        window.current_chart.data.datasets[0].data = data.map(row => {
                            let salary = row.salary_increase.replace('Rp.', '').replace(',00').replace(/[^\d]/g, '');
                            return parseInt(salary);
                        })
                        window.current_chart.update();
                    }
                } else {
                    popupError('Data tidak ditemukan');
                }

            } catch (error) {
                const error_message = error.response.data.message ?? error.message;
                popupError(error_message)
                console.error(error)
            }
        }

        const changeChartType = async () => {
            if (window.current_chart) {
                window.current_chart.config.type = chart_type.value;
                window.current_chart.update();
            }

            if (window.karyawan_chart) {
                window.karyawan_chart.config.type = chart_type.value;
                window.karyawan_chart.update();
            }
        }

        const getKaryawan = async () => {
            try {
                const resp = await axios.get(`api/chart-karyawan`, {params: {karyawan: karyawan.value}});
                if (resp.data.history_karyawan) {
                    const data = resp.data.history_karyawan;
                    if (window.karyawan_chart) {
                        window.karyawan_chart.data.labels = data.map(row => row.tanggal);
                        window.karyawan_chart.data.datasets[0].data = data.map(row => {
                            return row.current_total_kenaikan;
                        })
                        window.karyawan_chart.update();
                    }
                } else {
                    popupError('Data tidak ditemukan');
                }

            } catch (error) {
                const error_message = error.response.data.message ?? error.message;
                popupError(error_message)
                console.error(error)
            }
        }
        

        onMounted(async () => {
            try {
                const resp = await axios.get(`api/chart`);
                if (resp.data.history) {
                    dates.value = resp.data.dates;
                    employees.value = resp.data.employees;
                    tgl_histori.value = resp.data.history.tanggal;

                    const data = resp.data.history.rankings_data;
                    window.current_chart = new Chart(document.getElementById('current-chart'),
                        {
                            type: 'bar',
                            data: {
                                labels: data.map(row => row.nama),
                                datasets: [
                                    {
                                        label: 'Total Besaran Kenaikan',
                                        data: data.map(row => {
                                            let salary = row.salary_increase.replace('Rp.', '').replace(',00').replace(/[^\d]/g, '');
                                            return parseInt(salary);
                                        })
                                    }
                                ]
                            },
                            options: {
                                scales: {
                                    y: {
                                        ticks: {
                                            // Include a dollar sign in the ticks
                                            callback: function(value, index, ticks) {
                                                return 'Rp. ' + value.toLocaleString('id-ID') + ',-';
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    );

                    window.karyawan_chart = new Chart(document.getElementById('karyawan-chart'),
                        {
                            type: 'bar',
                            data: {
                                labels: [],
                                datasets: [
                                    {
                                        label: 'Besaran Kenaikan',
                                        data: [],
                                        borderColor: '#ff9f40',
                                        backgroundColor: '#ff9f40'
                                    }
                                ]
                            },
                            options: {
                                scales: {
                                    y: {
                                        ticks: {
                                            // Include a dollar sign in the ticks
                                            callback: function(value, index, ticks) {
                                                return 'Rp. ' + value.toLocaleString('id-ID') + ',-';
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    );
                    
                }
            } catch (error) {
                const error_message = error.response.data.message ?? error.message;
                popupError(error_message)
                console.error(error)
            }
        });

        return { dates, tgl_histori, getHistory, changeChartType, chart_type, employees, getKaryawan, karyawan };
    }
}
</script>