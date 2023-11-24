<template>
    <button @click="addForm">Tambah Karyawan</button>
    <div class="card">
        <div class="card-header">Data Karyawan</div>
        <div class="card-body">
            <table class="display table table-bordered" id="dataTable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>asd</th>
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
                    <h1 class="modal-title fs-5" id="modalFormKaryawanLabel">{{count}}</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
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
                        <label for="tgl_masuk_kerja" class="col-sm-3 col-form-label">Pendidikan Terakhir</label>
                        <div class="col-sm-9">
                            <input type="date" id="tgl_masuk_kerja" name="tgl_masuk_kerja" class="form-control" v-model="karyawan.tgl_masuk_kerja" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="" class="col-sm-3 col-form-label">Status Pernikahan</label>
                        <div class="col-sm-9">
                            <input type="radio" name="status_pernikahan" value="single" id="single" v-model="karyawan.status_pernikahan"> <label for="single">Single</label>
                            &nbsp;
                            <input type="radio" name="status_pernikahan" value="nikah" id="nikah" v-model="karyawan.status_pernikahan"> <label for="nikah">Sudah Menikah</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
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
                {targets: 0, defaultContent:"", data: 'nama', },
                {targets: 1, defaultContent:"", data: 'alamat', },
                {targets: 2, defaultContent:"", data: 'id', render: function ( data, type, full, meta ) {
                        const btnUpdate = '<button class="btn btn-warning btn-sm" onclick="window.__vueApp.hehe('+data+')">Edit</button>';
                        const btnDelete = '<button class="btn btn-danger btn-sm" onclick="window.__vueApp.hehe('+data+')">Delete</button>';
                        return btnUpdate +'&nbsp;'+ btnDelete;
                    },
                },
               
            ] 
        });
        this.data = table;
    }
}

$(document).ready(function() {
    TABLE.initData();
});
import { ref, onMounted } from 'vue'
export default {
    setup() {
        const count = ref(0);
        const karyawan = ref({})
        function hehe() {
            $('#modalFormKaryawan').modal('show')
            // TABLE.data.ajax.reload();
        }

        const addForm = () => {
            karyawan.value = {};
            $('#modalFormKaryawan').modal('show')
        }
        return {
            count, hehe, karyawan, addForm
        }
    },
    mounted() {
        window.__vueApp = this;
    }
}
</script>