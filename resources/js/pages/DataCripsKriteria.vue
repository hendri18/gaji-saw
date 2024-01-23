<template>
    <router-link to="/data-crips" class="btn btn-warning mb-3 mr-2"><i class="fas fa-fw fa-arrow-left"></i> <span>Kembali</span></router-link>
    <button @click="addForm" class="btn btn-success mb-3">Tambah</button>
    <div class="card">
        <div class="card-header">Data Sub Kriteria (crips) | Kriteria: <b>{{kriteria.nama}}</b></div>
        <div class="card-body">
            <table class="display table table-bordered" id="dataTable" v-once>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nama</th>
                        <th>Nilai</th>
                        <th></th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <div class="modal fade" id="modalFormCrips" tabindex="-1" aria-labelledby="modalFormCripsLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="modalFormCripsLabel" v-if="!crips.id">Tambah Data Crips | Kriteria: <b>{{kriteria.nama}}</b></h1>
                    <h1 class="modal-title fs-5" id="modalFormCripsLabel" v-else>Edit Data Crips | Kriteria: <b>{{kriteria.nama}}</b> </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="api/crips" method="post" v-on:submit="saveForm">
                        
                        <input type="hidden" name="id" v-model="crips.id">
                        <input type="hidden" name="kriteria_id" v-model="kriteria.id">
                        <div class="form-group row">
                            <label for="nama" class="col-sm-4 col-form-label">Nama</label>
                            <div class="col-sm-8">
                                <input type="text" id="nama" name="nama" class="form-control" v-model="crips.nama" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="alamat" class="col-sm-4 col-form-label">Nilai</label>
                            <div class="col-sm-4">
                                <input type="number" min="1" v-model="crips.nilai" class="form-control" required>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">Tutup</button>
                            <button type="submit" class="btn btn-success">Simpan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
const TABLE = {
    initData: function(id_kriteria){
        const table = $('#dataTable').DataTable({
            processing: true,
            serverSide: true,
            destroy: true,
            ajax: `/api/crips/kriteria/${id_kriteria}`,
            columnDefs: [
                {targets: 0, defaultContent:"", data: 'id', },
                {targets: 1, defaultContent:"", data: 'nama', },
                {targets: 2, defaultContent:"", data: 'nilai', },
                {targets: 3, defaultContent:"", data: 'id', render: function ( data, type, full, meta ) {
                        const btnUpdate = `<button class="btn btn-warning btn-sm" onclick="window.__vueApp.editForm(${data})">Edit</button>`;
                        const btnDelete = `<button class="btn btn-danger btn-sm" onclick="window.__vueApp.deleteData(${data}, '${full.nama}')">Delete</button>`;
                        return btnUpdate +'&nbsp;'+ btnDelete;
                    },
                },
               
            ] 
        });
        this.data = table;
    }
}

import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios'
export default {
    setup() {
        const crips = ref({})
        const kriteria = ref({})
        const $route = useRoute();
        const $router = useRouter();

        const addForm = async () => {
            const kriteria_id = $route.params.kriteria_id;
            $('#modalFormCrips').modal('show')
        }

        const editForm = async (id) => {
            try {
                const kriteria_id = $route.params.kriteria_id;
                axios.get(`/api/crips/${id}`).then((response) => {
                    crips.value = response.data.data;
                    $('#modalFormCrips').modal('show');
                }).catch((error) => {
                    popupError(error.response.data.message ?? error.message);
                    console.error(error)
                });
            } catch (error) {
                popupError(error)
                console.log(error)
            }
            
        }

        const saveForm = (e) => {
            e.preventDefault();
            const data = crips.value;
            data.kriteria_id = $route.params.kriteria_id;
            const url = data.id ? `/api/crips/${data.id}` : '/api/crips';
            const method = data.id ? 'put' : `post`;
            axios({
                method: method,
                url: url,
                data: data
            }).then((response) => {
                popupSuccess(response.data.message ?? '')
                $('#modalFormCrips').modal('hide')
                setTimeout(() => TABLE.data.ajax.reload(), 500);
            })
            .catch((error) => {
                popupError(error.response.data.message ?? error.message)
                console.error(error)
            });
        }

        const deleteData = async (id, name) => {
            const confirmation = await popupConfirm(`Hapus Data ${name}?`);
            if (!confirmation.isConfirmed) return;

            axios.delete(`/api/crips/${id}`).then((response) => {
                popupSuccess(response.data.message);
                setTimeout(() => TABLE.data.ajax.reload(), 500);
            }).catch((error) => {
                popupError(error.response.data.message ?? error.message);
                console.error(error)
            });

        }

        onMounted (async () => {
            await $router.isReady();
            const kriteria_id = $route.params.kriteria_id;
            try {
                const data_kriteria = await axios.get(`/api/kriteria/${kriteria_id}`);
                kriteria.value = data_kriteria.data.data;
            } catch (error) {
                popupError(error)
                console.error(error)
                $route.push('/data-crips')
            }
            
        })

        return {
            crips, kriteria, addForm, editForm, saveForm, deleteData
        }
    },
    async mounted() {
        const $route = useRoute();
        const $router = useRouter();
        await $router.isReady();
        const kriteria_id = $route.params.kriteria_id;
        window.__vueApp = this;
        TABLE.initData(kriteria_id);
    }
}
</script>