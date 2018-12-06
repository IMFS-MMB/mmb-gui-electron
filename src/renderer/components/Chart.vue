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
      this.chart = new HighCharts.Chart({
        chart: {
          renderTo: this.id,
        },
        title: {
          text: this.title,
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