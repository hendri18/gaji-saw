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

window.hasRoles = function(roles) {

    if (typeof user !== 'undefined' && user.roles) {
        if (typeof roles === 'object') {
            return user.roles.find(item => roles.includes(item.name)) ? true : false;
        } else if (typeof roles === 'string') {
            return user.roles.find(item => roles == item.name) ? true : false;
        }
    }
    return false;
}

const app = createApp(user ? App : {})
app.use(router)
app.mount("#app")