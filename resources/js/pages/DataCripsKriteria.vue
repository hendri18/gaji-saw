<template>
    <router-link to="/data-crips" class="btn btn-warning mb-3 mr-2"><i class="fas fa-fw fa-arrow-left"></i> <span>Kembali</span></router-link>
    <button @click="addForm" class="btn btn-success mb-3">Tambah</button>
    <div class="card">
        <div class="card-header">Data Crips | Kriteria: {{kriteria.nama}}</div>
        <div class="card-body">
            <table class="display table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nama</th>
                        <th>Nilai</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td></td>
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
        const kriteria = ref({});

        const editForm = async (id) => {
            axios.get(`api/crips/${id}`).then((response) => {
                crips.value = {...response.data.data, ...{max_bobot: resp.data.data.max_bobot}};
                $('#modalFormCrips').modal('show');
            }).catch((error) => {
                alert(error.response.data.message ?? error.message);
                console.error(error)
            });
        }
        return {
            kriteria, crips, editForm
        }
    },
    mounted() {
        window.__vueApp = this;
    }
}
</script>