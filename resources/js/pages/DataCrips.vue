<template>
    <button @click="addForm" class="btn btn-warning mb-3">Tambah Crips</button>
    <div class="card">
        <div class="card-header">Data Crips</div>
        <div class="card-body">
            <table class="display table table-bordered" id="dataTable" v-once>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Kategori</th>
                        <th></th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="modalFormCrips" tabindex="-1" aria-labelledby="modalFormCripsLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="modalFormCripsLabel" v-if="!crips.id">Tambah Crips</h1>
                    <h1 class="modal-title fs-5" id="modalFormCripsLabel" v-else>Edit Crips </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="api/crips" method="post" v-on:submit="saveForm">
                        
                        <input type="hidden" name="id" v-model="crips.id">
                        <div class="form-group row">
                            <label for="nama" class="col-sm-4 col-form-label">Nama</label>
                            <div class="col-sm-8">
                                <input type="text" id="nama" name="nama" class="form-control" v-model="crips.nama" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="alamat" class="col-sm-4 col-form-label">Bobot <br><small>bobot tersedia: {{ crips.max_bobot }}</small></label>
                            <div class="col-sm-8">
                                <input type="number" min="1" :max="crips.max_bobot" v-model="crips.bobot" class="form-control" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="type" class="col-sm-4 col-form-label">Type</label>
                            <div class="col-sm-8">
                                <select name="type" id="type" v-model="crips.type" class="form-control" required>
                                    <option value="benefit">Benefit</option>
                                    <option value="cost">Cost</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row align-items-center">
                            <label for="use_crips" class="col-sm-4 col-form-label">Menggunakan Data Crips</label>
                            <div class="col-sm-8">
                                <input type="checkbox" name="use_crips" id="use_crips" v-model="crips.use_crips">
                            </div>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>
<script>

const TABLE = {
    initData: function(){
        const table = $('#dataTable').DataTable({
            processing: true,
            serverSide: true,
            destroy: true,
            ajax: "api/crips",
            columnDefs: [
                {targets: 0, defaultContent:"", data: 'id', },
                {targets: 1, defaultContent:"", data: 'nama', },
                {targets: 2, defaultContent:"", data: 'id', render: function ( data, type, full, meta ) {
                        const btnUpdate = `<button class="btn btn-primary btn-sm" onclick="window.__vueApp.editForm(${data})">Tambah Nilai</button>`;
                        return btnUpdate;
                    },
                },
               
            ] 
        });
        this.data = table;
    }
}
import { ref, onMounted } from 'vue'
import axios from 'axios'
export default {
    setup() {
        const crips = ref({})

        const addForm = async () => {
            crips.value = {};
            $('#modalFormCrips').modal('show');
        }

        const editForm = async (id) => {
            axios.get(`api/crips/${id}`).then((response) => {
                crips.value = {...response.data.data, ...{max_bobot: resp.data.data.max_bobot}};
                $('#modalFormCrips').modal('show');
            }).catch((error) => {
                alert(error.response.data.message ?? error.message);
                console.error(error)
            });
        }

        const saveForm = (e) => {
            e.preventDefault();
            const data = crips.value;
            const url = data.id ? `api/crips/${data.id}` : 'api/crips';
            const method = data.id ? 'put' : `post`;
            axios({
                method: method,
                url: url,
                data: data
            }).then((response) => {
                alert(response.data.message ?? '')
                $('#modalFormCrips').modal('hide')
                setTimeout(() => TABLE.data.ajax.reload(), 500);
            })
            .catch((error) => {
                alert(error.response.data.message ?? error.message)
                console.error(error)
            });
        }

        const deleteData = async (id, name) => {
            const confirmation = confirm(`Hapus Data ${name}?`);
            if (!confirmation) return;

            axios.delete(`api/crips/${id}`).then((response) => {
                alert(response.data.message);
                setTimeout(() => TABLE.data.ajax.reload(), 500);
            }).catch((error) => {
                alert(error.response.data.message ?? error.message);
                console.error(error)
            });

        }
        return {
            crips, saveForm, addForm, editForm, deleteData
        }
    },
    mounted() {
        window.__vueApp = this;
        TABLE.initData();
    }
}
</script>