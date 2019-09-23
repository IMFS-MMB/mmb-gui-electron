<template>
    <div :id="id"></div>
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
      },
      destroyChart() {
        if (this.chart) {
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
