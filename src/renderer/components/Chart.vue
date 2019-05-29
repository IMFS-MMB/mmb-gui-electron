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
    mounted() {
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

    beforeDestroy() {
      try {
        this.chart.destroy();
      } catch (e) { /* noop */ }
    },
  };
</script>

<style scoped lang="scss">

</style>
