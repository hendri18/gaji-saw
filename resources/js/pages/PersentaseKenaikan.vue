<template>
    <div class="card">
        <div class="card-header">Persentase Kenaikan</div>
        <div class="card-body">
            <form action="api/persentase-kenaikan" method="post" v-on:submit="saveForm" id="form_pk" ref="form_pk">
                <ol>
                    <li v-for="(data, i) in pk">
                        <div class="col-md-8">
                            <div class="row mb-3">
                                <div class="col-3 d-flex align-items-center">
                                    <label for="" class="m-0 mr-2">Mulai: </label>
                                    <div class="input-group">
                                        <input type="number" class="form-control" v-model="pk[i]['dari']" :min="i == 0 ? 0 : pk[i - 1]['sampai']" :max="pk[i + 1] ? pk[i + 1]['dari'] : 100">
                                        <span class="input-group-text">%</span>
                                    </div>
                                </div>
                                <div class="col-3 d-flex align-items-center">
                                    <label for="" class="m-0 mr-2">Sampai: </label>
                                    <div class="input-group">
                                        <input type="number" class="form-control" v-model="pk[i]['sampai']" :min="pk[i]['dari']" :max="pk[i + 1] ? pk[i + 1]['dari'] : 100">
                                        <span class="input-group-text">%</span>
                                    </div>
                                </div>
                                <div class="col-4 d-flex align-items-center">
                                    <label for="" class="m-0 mr-2">Nilai: </label>
                                    <div class="input-group">
                                        <span class="input-group-text">Rp. </span>
                                        <input type="number" class="form-control"  v-model="pk[i]['nilai']">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ol>
                <button type="submit" class="btn btn-success">Simpan</button>
            </form>
        </div>
    </div>
</template>
<script>

import { ref, onMounted } from 'vue'
import axios, { AxiosHeaders } from 'axios'
export default {
    setup() {
        const pk = ref([]);

        onMounted (async () => {
            try {
                const resp = await axios.get(`api/persentase-kenaikan`);
                pk.value = resp.data.data;
            } catch (error) {
                const error_message = error.response.data.message ?? error.message;
                popupError(error_message)
                console.error(error)
            }
        })

        const saveForm = (e) => {
            e.preventDefault();
            const data = pk.value;
            const url = 'api/persentase-kenaikan';
            const method = `post`;
            axios({
                method: method,
                url: url,
                data: {
                    'pk': data
                },
            }).then((response) => {
                popupSuccess(response.data.message ?? '')
                setTimeout(() => TABLE.data.ajax.reload(), 500);
            })
            .catch((error) => {
                popupError(error.response.data.message ?? error.message)
                console.error(error)
            });
        }

        return {
            pk, saveForm
        }
    },
    mounted() {
        window.__vueApp = this;
    }
}
</script>