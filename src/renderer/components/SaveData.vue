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
  import { mapGetters } from 'vuex';

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
    computed: {
      ...mapGetters('options', ['horizon']),
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

        const moreFields = new Array(this.horizon).fill().map((_, i) => String(i + 1));

        const csv = pp.unparse({
          fields: ['resulttype', 'rule', 'model', 'shock', 'variable', ...moreFields],
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
