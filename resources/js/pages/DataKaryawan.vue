<template>
    <div class="card">
        <div class="card-header">Data Karyawan</div>
        <div class="card-body">
            <DataTable class="display table table-bordered" ajax="/data.json" :columns="columns"  ref="myTable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Extn.</th>
                        <th>Start date</th>
                        <th>Salary</th>
                        <th></th>
                    </tr>
                </thead>
            </DataTable>
        </div>
    </div>
</template>
<script setup>

import { ref, onMounted, nextTick  } from 'vue'
import DataTable from 'datatables.net-vue3';
import DataTablesCore from 'datatables.net';
 
DataTable.use(DataTablesCore);

function testBtn(name){
    alert(name)
}
const myTable = ref(null);

const columns = [
  { data: 'name' },
  { data: 'position' },
  { data: 'office' },
  { data: 'extn' },
  { data: 'start_date' },
  { data: 'salary' },
    { data: null, render: function(data, type, row) {
        // return `<button @click="testBtn('${row.name}')" class="action-btn">Action</button>`;
        return `<button onclick="testBtn('${row.name}')" class="action-btn">Action</button>`;
    }}
];

</script>

<style>
@import 'datatables.net-dt';
</style>