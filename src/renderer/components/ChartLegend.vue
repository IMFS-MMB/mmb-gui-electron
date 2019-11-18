<template>
    <div :id="id"></div>
</template>

<script>
  import * as HighCharts from 'highcharts';
  import { mapGetters } from 'vuex';
  import { charts } from './Chart';

  const legendId = 'chart-legend';

  export default {
    computed: {
      ...mapGetters('comparison', ['legendSeries']),
    },
    data() {
      return {
        id: legendId,
        chart: undefined,
      };
    },
    mounted() {
      this.chart = new HighCharts.Chart({
        chart: {
          animation: false,
          renderTo: this.id,
          height: 100,
        },
        title: {
          text: null,
        },
        yAxis: {
          visible: false,
        },
        xAxis: {
          visible: false,
        },
        legend: {
          padding: 0,
          margin: 0,
          verticalAlign: 'middle',
          maxHeight: 100,
        },
        exporting: {
          enabled: false,
        },
        series: this.legendSeries,
        plotOptions: {
          series: {
            events: {
              legendItemClick: (event) => {
                const legendSeries = event.target;

                charts.forEach((chart) => {
                  if (!chart || chart === legendSeries.chart) {
                    return;
                  }

                  const otherSeries = chart.get(legendSeries.options.id);

                  if (otherSeries) {
                    if (legendSeries.visible) {
                      otherSeries.hide();
                    } else {
                      otherSeries.show();
                    }
                  }
                });
              },
            },
          },
        },
      });
    },
    watch: {
      legendSeries(newVal) {
        if (Array.isArray(newVal)) {
          // HighCharts mutates the series array on removal
          // shallow copy the array before looping to catch all elements
          [...this.chart.series].forEach(s => s.remove());

          newVal.forEach(s => this.chart.addSeries(s));
        }
      },
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
