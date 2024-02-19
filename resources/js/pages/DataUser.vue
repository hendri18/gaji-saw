<template>
    <button @click="addForm" class="btn btn-success mb-3">Tambah User</button>
    <div class="card">
        <div class="card-header">Data User</div>
        <div class="card-body">
            <table class="display table table-bordered" id="dataTable" v-once>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nama</th>
                        <th>Email</th>
                        <th>Hak Akses</th>
                        <th></th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="modalFormUser" tabindex="-1" aria-labelledby="modalFormUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="modalFormUserLabel" v-if="!user.id">Tambah User</h1>
                    <h1 class="modal-title fs-5" id="modalFormUserLabel" v-else>Edit User </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="api/user" method="post" v-on:submit="saveForm" id="form_user" ref="form_user">
                        
                        <input type="hidden" name="id" v-model="user.id">
                        <div class="form-group row">
                            <label for="name" class="col-sm-4 col-form-label">Nama</label>
                            <div class="col-sm-8">
                                <input type="text" id="name" name="name" class="form-control" v-model="user.name" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="email" class="col-sm-4 col-form-label">Email</label>
                            <div class="col-sm-8">
                                <input type="email" id="email" name="email" class="form-control" v-model="user.email" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="role_id" class="col-sm-4 col-form-label">Hak Akses</label>
                            <div class="col-sm-8">
                                <select name="role_id" id="role_id" class="form-select" v-model="user.role_id">
                                    <option :value="option.id" v-for="option in roles">{{ option.name }}</option>
                                </select>
                            </div>
                        </div>
                        <div v-if="user.id"><small><i>Kosongkan password jika tidak ingin mengubah password</i></small></div>
                        <div class="form-group row">
                            <label for="password" class="col-sm-4 col-form-label">Password</label>
                            <div class="col-sm-8">
                                <input type="password" id="password" name="password" class="form-control" :required="user.id ? false : true">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="password_confirmation" class="col-sm-4 col-form-label">Konfirmasi Password</label>
                            <div class="col-sm-8">
                                <input type="password" id="password_confirmation" name="password_confirmation" class="form-control" :required="user.id ? false : true">
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
            ajax: "api/user",
            layout: {
                topStart: {
                    buttons: ['pageLength', 'excelHtml5', 'pdfHtml5']
                }
            },
            columnDefs: [
                {targets: 0, defaultContent:"", data: 'id', },
                {targets: 1, defaultContent:"", data: 'name', },
                {targets: 2, defaultContent:"", data: 'email', },
                {targets: 3, defaultContent:"", data: 'roles', },
                {targets: 4, defaultContent:"", data: 'id', render: function ( data, type, full, meta ) {
                        const btnUpdate = `<button class="btn btn-warning btn-sm" onclick="window.__vueApp.editForm(${data})">Edit</button>`;
                        const btnDelete = `<button class="btn btn-danger btn-sm" onclick="window.__vueApp.deleteData(${data}, '${full.name}')">Delete</button>`;
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
        const user = ref({})
        const roles = ref({})

        onMounted (async () => {
            try {
                const resp = await axios.get(`api/all-roles`);
                roles.value = resp.data.data;
            } catch (error) {
                popupError(error)
                console.error(error)
            }
        })

        const addForm = async () => {
            user.value = {};
            document.getElementById("form_user").reset();
            $('#modalFormUser').modal('show')
        }

        const editForm = async (id) => {
            try {
                const resp = await axios.get(`api/all-roles`);
                axios.get(`api/user/${id}`).then((response) => {
                    user.value = response.data.data;
                    roles.value = resp.data.data;
                    $('#modalFormUser').modal('show');
                }).catch((error) => {
                    popupError(error.response.data.message ?? error.message);
                    console.error(error)
                });
            } catch (error) {
                popupError(error)
                console.log(error)
            }
            
        }

        const router = useRouter()
        const saveForm = (e) => {
            e.preventDefault();
            const data = user.value;
            const form = new FormData(document.getElementById('form_user'));
            const url = data.id ? `api/user/${data.id}` : 'api/user';
            const method = data.id ? 'put' : `post`;
            axios({
                method: method,
                url: url,
                data: Object.fromEntries(form)
            }).then((response) => {
                popupSuccess(response.data.message ?? '')
                $('#modalFormUser').modal('hide')
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

            axios.delete(`api/user/${id}`).then((response) => {
                popupSuccess(response.data.message);
                setTimeout(() => TABLE.data.ajax.reload(), 500);
            }).catch((error) => {
                popupError(error.response.data.message ?? error.message);
                console.error(error)
            });

        }
        return {
            user, roles, saveForm, addForm, editForm, deleteData
        }
    },
    mounted() {
        window.__vueApp = this;
        TABLE.initData();
    }
}
</script>