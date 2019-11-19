<template>
    <div class="d-flex flex-column align-items-center">
        <span class="text">Export data</span>
        <span class="text">
            <a href="javascript:void(0)" @click="saveCSV">CSV</a>, <a href="javascript:void(0)"
                                                                      @click="saveJSON">JSON</a>
        </span>
    </div>
</template>
<script>
  import { saveAs } from 'file-saver';
  import pp from 'papaparse';

  export default {
    name: 'SaveData',
    props: {
      nested: {
        default: () => {
        },
      },
      normalized: {
        default: () => [],
      },
    },
    methods: {
      saveCSV() {
        const data = this.normalized.map((n) => {
          const { values, ...rest } = n;

          return [
            ...Object.values(rest),
            ...values,
          ];
        });

        const csv = pp.unparse({
          fields: ['resulttype', 'rule', 'model', 'shock', 'variable', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21'],
          data,
        }, {
          header: true,
        });

        const blob = new Blob([csv], { type: 'text/csv;charset=utf-8' });

        saveAs(blob, 'output.csv');
      },
      saveJSON() {
        const json = JSON.stringify(this.nested, null, 2);

        const blob = new Blob([json], { type: 'application/json;charset=utf-8' });

        saveAs(blob, 'output.json');
      },
    },
  };
</script>
<style lang="scss">
    .text {
        font-size: 0.9rem;
    }
</style>
