<template>
    <div class="card">
        <div class="card-header">Karyawan</div>
        <div class="card-body">
            <table class="display table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Karyawan</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>

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
    }
}
</script>