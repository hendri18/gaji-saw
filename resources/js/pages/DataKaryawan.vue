<template>
    <button @click="addForm" class="btn btn-success mb-3">Tambah Data</button>
    <div class="card">
        <div class="card-header">Data Karyawan</div>
        <div class="card-body">
            <table class="display table table-bordered" id="dataTable" v-once></table>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="modalFormKaryawan" tabindex="-1" aria-labelledby="modalFormKaryawanLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="modalFormKaryawanLabel" v-if="!karyawan.id">Tambah Data</h1>
                    <h1 class="modal-title fs-5" id="modalFormKaryawanLabel" v-else>Edit Karyawan </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="api/karyawan" method="post" v-on:submit="saveForm">
                        
                        <input type="hidden" name="id" v-model="karyawan.id">
                        <div class="form-group row">
                            <label for="nama" class="col-sm-3 col-form-label">Nama</label>
                            <div class="col-sm-9">
                                <input type="text" id="nama" name="nama" class="form-control" v-model="karyawan.nama" required>
                            </div>
                        </div>

                        <div class="form-group row" v-for="(kr, i) in kriteria">
                            <label class="col-sm-3 col-form-label">{{ kr.nama }}</label>
                            <div class="col-sm-9">
                                <select name="crip_id[]" class="form-select" v-model="crips_id[getKaryawanKriteriaId(kr.id, i)]" required>
                                    <option v-for="crip in kr.crips" :value="crip.id">{{ crip.nama }}</option>
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
import { ref, onMounted } from 'vue'
import axios from 'axios'

const TABLE = {
    initData: async function(){
        let columns = [];
        try {
            const resp = await axios.get(`api/karyawan/columns`);
            const data = resp.data.data.columns;
            data.map(item => {
                columns.push({title: item.title })
                return item;
            })
            
        } catch (error) {
            popupError(error.response.data.message ?? error.message);
            console.error(error)
        }

        const table = $('#dataTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: "api/karyawan",
            layout: {
                topStart: {
                    buttons: ['pageLength', 'excelHtml5', 'pdfHtml5']
                }
            },
            columns: columns.length > 0 ? columns : [{title: '&nbsp;'}],
            columnDefs: [
                {targets: "_all", defaultContent: "", },
                {targets: -1, defaultContent:"", data: 'id', render: function ( data, type, full, meta ) {
                        const id = full[0] ?? 0;
                        const nama = full[1] ?? '';
                        const btnUpdate = `<button class="btn btn-warning btn-sm" onclick="window.__vueApp.editForm(${id})">Edit</button>`;
                        const btnDelete = `<button class="btn btn-danger btn-sm" onclick="window.__vueApp.deleteData(${id}, '${nama}')">Delete</button>`;
                        return btnUpdate +'&nbsp;'+ btnDelete;
                    },
                }
            ]
        });
        this.data = table;
    }
}

export default {
    setup() {
        const karyawan = ref({})
        const kriteria = ref({})
        const crips_id = ref([])
        const karyawan_kriteria = ref([])

        const addForm = () => {
            karyawan.value = {}
            crips_id.value = {}
            karyawan_kriteria.value = []
            $('#modalFormKaryawan').modal('show');
        }

        const editForm = async (id) => {
            axios.get(`api/karyawan/${id}`).then((response) => {
                const resp = response.data.data
                karyawan.value = resp
                karyawan_kriteria.value = resp.karyawan_kriteria
                const cs_id = [];
                (resp.karyawan_kriteria ?? []).map(item => {
                    cs_id[item.id] = item.crip.id;
                    return item;
                });

                crips_id.value = cs_id;

                $('#modalFormKaryawan').modal('show');
            }).catch((error) => {
                popupError(error.response.data.message ?? error.message);
                console.error(error)
            });
        }

        const getKaryawanKriteriaId = (kriteria_id, index) => {
            const findId = (karyawan_kriteria.value ?? []).find(kk => kk.crip.kriteria_id === kriteria_id);
            return findId ? findId.id : index;
        }

        const saveForm = (e) => {
            e.preventDefault();
            const data = {...karyawan.value, crips_id: crips_id.value};
            const url = data.id ? `api/karyawan/${data.id}` : 'api/karyawan';
            const method = data.id ? 'put' : `post`;
            axios({
                method: method,
                url: url,
                data: data
            }).then((response) => {
                popupSuccess(response.data.message ?? '')
                $('#modalFormKaryawan').modal('hide')
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

            axios.delete(`api/karyawan/${id}`).then((response) => {
                popupSuccess(response.data.message);
                setTimeout(() => TABLE.data.ajax.reload(), 500);
            }).catch((error) => {
                popupError(error.response.data.message ?? error.message);
                console.error(error)
            });
        }

        onMounted (async () => {
            try {
                const resp = await axios.get(`api/kriteria/crips`);
                kriteria.value = resp.data.data;
            } catch (error) {
                popupError(error)
                console.error(error)
            }
        })
        return {
            karyawan, kriteria, crips_id, karyawan_kriteria, saveForm, addForm, editForm, deleteData, getKaryawanKriteriaId 
        }
    },
    mounted() {
        window.__vueApp = this;
        TABLE.initData();
    }
}
</script>