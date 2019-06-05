<template>
    <div :id="id" :class="{invisible: resizing}"></div>
</template>

<script>
  import * as HighCharts from 'highcharts';

  let nextId = 0;

  export default {
    props: {
      title: {
        default: '',
      },
      series: {
        default: () => [],
      },
    },
    data() {
      return {
        id: `chart-${nextId++}`, // eslint-disable-line
        chart: undefined,
        resizing: false,
      };
    },
    methods: {
      onResizeStart() {
        this.resizing = true;
      },
      onResizeEnd() {
        this.resizing = false;
        this.recreateChart();
      },
      createChart() {
        const [title, subtitle] = this.title.split(' - ');
        this.chart = new HighCharts.Chart({
          legend: {
            enabled: false,
          },
          chart: {
            renderTo: this.id,
          },
          title: {
            text: title,
          },
          subtitle: {
            text: subtitle,
          },
          series: this.series,
        });
      },
      destroyChart() {
        this.chart.destroy();
      },
      recreateChart() {
        this.destroyChart();
        setTimeout(() => this.createChart(), 0);
      },
    },
    mounted() {
      this.$root.$on('window:resize-start', this.onResizeStart);
      this.$root.$on('window:resize-end', this.onResizeEnd);

      this.createChart();
    },
    beforeDestroy() {
      try {
        this.$root.$off('window:resize-start', this.onResizeStart);
        this.$root.$off('window:resize-end', this.onResizeEnd);
        this.destroyChart();
      } catch (e) { /* noop */ }
    },
  };
</script>

<style scoped lang="scss">

</style>
