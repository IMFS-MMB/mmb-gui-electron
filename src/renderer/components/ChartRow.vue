<template>
    <b-row v-if="hasAtLeastOneSeries(charts) && !resizing">
        <b-col v-for="chart of charts" :key="uniqueKey()">
            <Chart v-if="chart.series.length" :title="chart.title" :series="chart.series"></Chart>
        </b-col>
    </b-row>
</template>
<script>
  import Chart from '@/components/Chart.vue';

  export default {
    name: 'ChartRow',
    components: { Chart },
    props: {
      charts: {
        default: () => [],
      },
    },
    data() {
      return {
        resizing: false,
      };
    },
    methods: {
      onResizeStart() {
        this.resizing = true;
      },
      onResizeEnd() {
        this.resizing = false;
      },
      uniqueKey() {
        // Used to force rerendering of Chart components on data change.
        // Reusing components has proven difficult when charts need to be resized
        // due to window resize or cols per row change

        return `chart-${Math.random()}`;
      },
      hasAtLeastOneSeries(charts) {
        return charts && charts.some(chart => !!chart.series.length);
      },
    },
    mounted() {
      this.$root.$on('window:resize-start', this.onResizeStart);
      this.$root.$on('window:resize-end', this.onResizeEnd);
    },
    beforeDestroy() {
      this.$root.$off('window:resize-start', this.onResizeStart);
      this.$root.$off('window:resize-end', this.onResizeEnd);
    },
  };
</script>
