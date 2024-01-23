<template>
    <button @click="addForm" class="btn btn-success mb-3">Tambah Kriteria</button>
    <div class="card">
        <div class="card-header">Data Kriteria</div>
        <div class="card-body">
            <table class="display table table-bordered" id="dataTable" v-once>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nama</th>
                        <th>Bobot</th>
                        <th>Tipe</th>
                        <th></th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="modalFormKriteria" tabindex="-1" aria-labelledby="modalFormKriteriaLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="modalFormKriteriaLabel" v-if="!kriteria.id">Tambah Kriteria</h1>
                    <h1 class="modal-title fs-5" id="modalFormKriteriaLabel" v-else>Edit Kriteria </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="api/kriteria" method="post" v-on:submit="saveForm">
                        
                        <input type="hidden" name="id" v-model="kriteria.id">
                        <div class="form-group row">
                            <label for="nama" class="col-sm-4 col-form-label">Nama</label>
                            <div class="col-sm-8">
                                <input type="text" id="nama" name="nama" class="form-control" v-model="kriteria.nama" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="alamat" class="col-sm-4 col-form-label">Bobot <br><small>bobot tersedia: {{ kriteria.max_bobot }}</small></label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input type="number" min="1" :max="kriteria.max_bobot" v-model="kriteria.bobot" class="form-control" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="type" class="col-sm-4 col-form-label">Type</label>
                            <div class="col-sm-8">
                                <select name="type" id="type" v-model="kriteria.type" class="form-select" required>
                                    <option value="benefit">Benefit</option>
                                    <option value="cost">Cost</option>
                                </select>
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
    initData: function(){
        const table = $('#dataTable').DataTable({
            processing: true,
            serverSide: true,
            destroy: true,
            ajax: "api/kriteria",
            columnDefs: [
                {targets: 0, defaultContent:"", data: 'id', },
                {targets: 1, defaultContent:"", data: 'nama', },
                {targets: 2, defaultContent:"", data: 'bobot', },
                {targets: 3, defaultContent:"", data: 'type', },
                {targets: 4, defaultContent:"", data: 'id', render: function ( data, type, full, meta ) {
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
import { useRouter } from "vue-router";
import axios from 'axios'
export default {
    setup() {
        const kriteria = ref({})

        const addForm = async () => {
            axios.get(`api/kriteria/max-bobot`).then((response) => {
                const max_bobot = response.data.data.max_bobot;
                kriteria.value = {max_bobot: max_bobot}
                if(max_bobot === 0) {
                    alert('Bobot sudah maksimal');
                } else {
                    $('#modalFormKriteria').modal('show')
                }
            }).catch((error) => {
                alert(error.response.data.message ?? error.message);
                console.error(error)
            });
            
        }

        const editForm = async (id) => {
            try {
                const resp = await axios.get(`api/kriteria/max-bobot?kriteria_id=${id}`);
                axios.get(`api/kriteria/${id}`).then((response) => {
                    kriteria.value = {...response.data.data, ...{max_bobot: resp.data.data.max_bobot}};
                    $('#modalFormKriteria').modal('show');
                }).catch((error) => {
                    alert(error.response.data.message ?? error.message);
                    console.error(error)
                });
            } catch (error) {
                alert(error)
                console.log(error)
            }
            
        }

        const router = useRouter()
        const saveForm = (e) => {
            e.preventDefault();
            const data = kriteria.value;
            const url = data.id ? `api/kriteria/${data.id}` : 'api/kriteria';
            const method = data.id ? 'put' : `post`;
            axios({
                method: method,
                url: url,
                data: data
            }).then((response) => {
                alert(response.data.message ?? '')
                $('#modalFormKriteria').modal('hide')
                // if (!data.id && response.data.id) {
                //     router.push(`/data-crips/${response.data.id}`);
                //     return;
                // }
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

            axios.delete(`api/kriteria/${id}`).then((response) => {
                alert(response.data.message);
                setTimeout(() => TABLE.data.ajax.reload(), 500);
            }).catch((error) => {
                alert(error.response.data.message ?? error.message);
                console.error(error)
            });

        }
        return {
            kriteria, saveForm, addForm, editForm, deleteData
        }
    },
    mounted() {
        window.__vueApp = this;
        TABLE.initData();
    }
}
</script>