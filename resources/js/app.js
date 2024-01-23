import './bootstrap'
import { createApp } from 'vue'
import App from './App.vue'
import router from './routes'
import Swal from 'sweetalert2'

window.popupConfirm = async function(text) {
    return await Swal.fire({
        icon: 'warning',
        html: text,
        showCancelButton: true,
        confirmButtonText: "Ya",
        cancelButtonText: "Batalkan",
        confirmButtonColor: '#28a745',
        cancelButtonColor: '#dc3545',
        reverseButtons: true,
    });
}

window.popupSuccess = function(text) {
    Swal.fire({
        html: text,
        icon: "success",
        confirmButtonColor: '#28a745',
    });
}

window.popupError = function(text) {
    Swal.fire({
        html: text,
        icon: "error",
        confirmButtonColor: '#dc3545',
    });
}

const app = createApp(App)
app.use(router)
app.mount("#app")
