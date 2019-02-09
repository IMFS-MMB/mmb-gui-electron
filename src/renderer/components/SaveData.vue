<template>
    <span>
        <a href="javascript:void(0)" @click="saveCSV">CSV</a>, <a href="javascript:void(0)" @click="saveJSON">JSON</a>
    </span>
</template>
<script>
import { saveAs } from 'file-saver';
import pp from 'papaparse';

export default {
  name: 'SaveData',
  props: {
    data: {
      default: () => [],
    },
  },
  methods: {
    saveCSV() {
      const csv = pp.unparse(this.data);

      const blob = new Blob([csv], { type: 'text/csv;charset=utf-8' });

      saveAs(blob, 'output.csv');
    },
    saveJSON() {
      const json = JSON.stringify(this.data, null, 2);

      const blob = new Blob([json], { type: 'application/json;charset=utf-8' });

      saveAs(blob, 'output.json');
    },
  },
};
</script>
