<template>
    <div class="card">
        <div class="card-header">Data Sub Kriteria (crips)</div>
        <div class="card-body">
            <table class="display table table-bordered" id="dataTable" v-once>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Kriteria</th>
                        <th></th>
                    </tr>
                </thead>
            </table>
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
            ajax: "api/crips/all-kriteria",
            columnDefs: [
                {targets: 0, defaultContent:"", data: 'id', },
                {targets: 1, defaultContent:"", data: 'nama', },
                {targets: 2, defaultContent:"", data: 'id', render: function ( data, type, full, meta ) {
                        const btnUpdate = `<button class="btn btn-success btn-sm" onclick="window.__vueApp.linkCripCriteria(${data})">Tambah Nilai</button>`;
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
        const linkCripCriteria = (id) => {
            window.__vueApp.$router.push(`/data-crips/${id}`);
        };

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
            crips, editForm, linkCripCriteria
        }
    },
    mounted() {
        window.__vueApp = this;
        TABLE.initData();
    }
}
</script>