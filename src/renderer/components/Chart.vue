<template>
    <div :id="id"></div>
</template>

<script>
  import * as HighCharts from 'highcharts';

  export const charts = new Set();

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
        // eslint-disable-next-line no-plusplus
        id: `chart-${nextId++}`,
        chart: undefined,
      };
    },
    methods: {
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

        charts.add(this.chart);
      },
      destroyChart() {
        if (this.chart) {
          charts.delete(this.chart);
          this.chart.destroy();
          this.chart = null;
        }
      },
    },
    mounted() {
      this.createChart();
    },
    beforeDestroy() {
      try {
        this.destroyChart();
      } catch (e) { /* noop */ }
    },
  };
</script>
