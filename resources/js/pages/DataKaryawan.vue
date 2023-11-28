<template>
    <button @click="addForm" class="btn btn-warning mb-3">Tambah Karyawan</button>
    <div class="card">
        <div class="card-header">Data Karyawan</div>
        <div class="card-body">
            <table class="display table table-bordered" id="dataTable" v-once>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Alamat</th>
                        <th>Tgl Masuk Kerja</th>
                        <th>Status Pernikahan</th>
                        <th>Pendidikan Terakhir</th>
                        <th></th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="modalFormKaryawan" tabindex="-1" aria-labelledby="modalFormKaryawanLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="modalFormKaryawanLabel" v-if="!karyawan.id">Tambah Karyawan</h1>
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
                        <div class="form-group row">
                            <label for="alamat" class="col-sm-3 col-form-label">Alamat</label>
                            <div class="col-sm-9">
                                <textarea name="alamat" id="alamat" cols="38" rows="3" v-model="karyawan.alamat" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="tgl_masuk_kerja" class="col-sm-3 col-form-label">Tanggal Masuk Kerja</label>
                            <div class="col-sm-9">
                                <input type="date" id="tgl_masuk_kerja" name="tgl_masuk_kerja" class="form-control" v-model="karyawan.tgl_masuk_kerja" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label">Status Pernikahan</label>
                            <div class="col-sm-9">
                                <input type="radio" name="status_pernikahan" value="single" id="single" v-model="karyawan.status_pernikahan" required> <label for="single">Single</label>
                                &nbsp;
                                <input type="radio" name="status_pernikahan" value="nikah" id="nikah" v-model="karyawan.status_pernikahan" required> <label for="nikah">Sudah Menikah</label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="pendidikan" class="col-sm-3 col-form-label">Pendidikan Terakhir</label>
                            <div class="col-sm-9">
                                <select name="pendidikan" id="pendidikan" class="form-control" v-model="karyawan.pendidikan">
                                    <option value="">Belum/Tidak Sekolah</option>
                                    <option value="sd">SD</option>
                                    <option value="smp">SMP</option>
                                    <option value="sma">SMA</option>
                                    <option value="d3">D3</option>
                                    <option value="s1">S1</option>
                                    <option value="s2">S2</option>
                                    <option value="s3">S3</option>
                                </select>
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
        // const table = $('#dataTable').DataTable();
        const table = $('#dataTable').DataTable({
            processing: true,
            serverSide: true,
            destroy: true,
            ajax: "api/karyawan",
            columnDefs: [
                {targets: 0, defaultContent:"", data: 'id', },
                {targets: 1, defaultContent:"", data: 'nama', },
                {targets: 2, defaultContent:"", data: 'alamat', },
                {targets: 3, defaultContent:"", data: 'tgl_masuk_kerja', },
                {targets: 4, defaultContent:"", data: 'status_pernikahan', },
                {targets: 5, defaultContent:"", data: 'pendidikan', },
                {targets: 6, defaultContent:"", data: 'id', render: function ( data, type, full, meta ) {
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
import axios from 'axios'
export default {
    setup() {
        const karyawan = ref({})

        const addForm = () => {
            karyawan.value = {}
            $('#modalFormKaryawan').modal('show')
        }

        const editForm = async (id) => {
            axios.get(`api/karyawan/${id}`).then((response) => {
                karyawan.value = response.data.data;
                $('#modalFormKaryawan').modal('show');
            }).catch((error) => {
                alert(error.response.data.message ?? error.message);
                console.error(error)
            });
        }

        const saveForm = (e) => {
            e.preventDefault();
            const data = karyawan.value;
            const url = data.id ? `api/karyawan/${data.id}` : 'api/karyawan';
            const method = data.id ? 'put' : `post`;
            axios({
                method: method,
                url: url,
                data: data
            }).then((response) => {
                alert(response.data.message ?? '')
                $('#modalFormKaryawan').modal('hide')
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

            axios.delete(`api/karyawan/${id}`).then((response) => {
                alert(response.data.message);
                setTimeout(() => TABLE.data.ajax.reload(), 500);
            }).catch((error) => {
                alert(error.response.data.message ?? error.message);
                console.error(error)
            });

        }
        return {
            karyawan, saveForm, addForm, editForm, deleteData
        }
    },
    mounted() {
        window.__vueApp = this;
        TABLE.initData();
    }
}
</script>